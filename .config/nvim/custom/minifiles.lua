local files = require 'mini.files'
local utils = require 'utils'

local function is_open()
  return files.get_explorer_state() ~= nil
end

local function close_without_sync()
  -- Synchronize the files without acceping changes
  utils.no_confirm_execute(0, files.synchronize)
  files.close()
end

local function toggle()
  if not is_open() then
    files.open()
  else
    close_without_sync()
  end
end
files.toggle = toggle

local function force_refresh()
  files.refresh {
    content = {
      force_update = true,
    },
  }
end

local show_dotfiles = false
local show_gitignored = false

local is_dotfile = function(fs_entry)
  return vim.startswith(fs_entry.name, '.')
end

local is_gitignored = function(fs_entry)
  local path = fs_entry.path
  local parent_path = vim.fn.fnamemodify(path, ':h')

  local output = vim.fn.systemlist('git -C ' .. parent_path .. ' check-ignore ' .. fs_entry.path)

  return #output > 0
end

local function file_filter(fs_entry)
  if not show_dotfiles and is_dotfile(fs_entry) then
    return false
  end

  if not show_gitignored and is_gitignored(fs_entry) then
    return false
  end

  return true
end

local function toggle_show_dotfiles()
  show_dotfiles = not show_dotfiles
  force_refresh()
end

local function toggle_show_gitignored()
  show_gitignored = not show_gitignored
  force_refresh()
end

local function synchronize()
  -- Synchronize the files acceping changes
  utils.no_confirm_execute(1, files.synchronize)
  force_refresh()

  print 'Files synchronized!'
end

local function trim_all()
  files.trim_left()
  files.trim_right()
end

local function set_target_as_cwd()
  local entry = files.get_fs_entry()

  if not entry then
    return
  end

  local is_file = entry.fs_type == 'file'
  local is_dir = entry.fs_type == 'directory'

  local current_dir = nil

  if is_file then
    current_dir = vim.fn.fnamemodify(entry.path, ':h')
  elseif is_dir then
    current_dir = entry.path
    files.go_in {}
  end

  if current_dir then
    print('Set ' .. current_dir .. ' as cwd')
    vim.api.nvim_set_current_dir(current_dir)

    trim_all()
    force_refresh()
  end
end

local function set_parent_as_cwd()
  files.go_out()
  trim_all()

  local entry = files.get_fs_entry()

  if not entry then
    return
  end
  local parent_path = vim.fn.fnamemodify(entry.path, ':h')
  print('Set ' .. parent_path .. ' as cwd')

  vim.api.nvim_set_current_dir(parent_path)

  force_refresh()
end

local key_mappings = {
  { 'n', 'q', close_without_sync, 'Close' },
  { 'n', ',', toggle_show_gitignored, 'Toggle gitignored' },
  { 'n', '.', toggle_show_dotfiles, 'Toggle dotfiles' },
  { 'n', '<leader>w', synchronize, 'Synchronize' },
  { 'n', 't', set_parent_as_cwd, 'Target parent as cwd' },
  { 'n', '[', set_parent_as_cwd, 'Target parent as cwd' },
  { 'n', ']', set_target_as_cwd, 'Target as cwd' },
}

local function buffer_make_mappings(buffer_id, mappings)
  local function buffer_map(mode, key, func, desc)
    -- Use `nowait` to account for non-buffer mappings starting with `key`
    vim.keymap.set(mode, key, func, { buffer = buffer_id, desc = desc, nowait = true })
  end

  for _, keymap in ipairs(mappings) do
    buffer_map(unpack(keymap))
  end
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buffer_id = args.data.buf_id
    buffer_make_mappings(buffer_id, key_mappings)
  end,
})

files.setup {
  content = {
    filter = file_filter,
  },

  mappings = {
    close = 'q',
    go_in_plus = 'L',
    go_out_plus = 'H',
    reset = '<BS>',
    reveal_cwd = '@',
    show_help = 'g?',
    trim_left = '<',
    trim_right = '>',

    -- Disable default mappings
    synchronize = '=',
    go_in = '',
    go_out = '',
  },
}

return files
