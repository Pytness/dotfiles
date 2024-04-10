local files = require 'mini.files'

local function is_open()
  return files.get_target_window() ~= nil
end

local function close_without_sync()
  -- Synchronize the files without acceping changes
  no_confirm_execute(0, files.synchronize)
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
  local output = vim.fn.systemlist('git check-ignore ' .. fs_entry.path)

  return #output ~= 0
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

local toggle_show_dotfiles = function()
  show_dotfiles = not show_dotfiles
  force_refresh()
end

local toggle_show_gitignored = function()
  show_gitignored = not show_gitignored
  force_refresh()
end

local synchronize = function()
  -- Synchronize the files acceping changes
  no_confirm_execute(1, files.synchronize)
  force_refresh()

  print 'Files synchronized!'
end

local key_mappings = {
  { 'n', 'q', close_without_sync, 'Close' },
  { 'n', 'H', toggle_show_gitignored, 'Toggle gitignored' },
  { 'n', '.', toggle_show_dotfiles, 'Toggle dotfiles' },
  { 'n', '<leader>w', synchronize, 'Synchronize' },
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
    go_in_plus = 'l',
    go_out_plus = 'h',
    reset = '<BS>',
    reveal_cwd = '@',
    show_help = 'g?',
    trim_left = '<',
    trim_right = '>',

    -- Disable default mappings
    synchronize = '',
    go_in = '',
    go_out = '',
  },
}

return files
