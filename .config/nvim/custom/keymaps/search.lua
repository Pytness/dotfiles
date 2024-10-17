local function telescope_builtin_factory(name)
  return function()
    local telescope_builtin = require 'telescope.builtin'
    return telescope_builtin[name]()
  end
end

local function find_files_glob()
  local telescope_builtin = require 'telescope.builtin'

  telescope_builtin.find_files {
    find_command = { 'fd', '--type', 'file', '--hidden', '--exclude', '.git', '--glob' },
    prompt_title = 'Live Files glob',
  }
end

local function search_current_buffer()
  local telescope_builtin = require 'telescope.builtin'
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

local function search_in_open_files()
  local telescope_builtin = require 'telescope.builtin'
  telescope_builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

local function search_neovim_files()
  local telescope_builtin = require 'telescope.builtin'
  telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
end

local todo_keywords = 'FIX,BUG,ISSUE,TODO,HACK,WARN,WARNING,XXX,NOTE,INFO,PERF,OPTIM,PERFORMANCE,OPTIMIZE,TEST'

return {
  { 'n', '<leader>sh', telescope_builtin_factory 'help_tags', { desc = '[S]earch [H]elp' } },
  { 'n', '<leader>sk', telescope_builtin_factory 'keymaps', { desc = '[S]earch [K]eymaps' } },
  { 'n', '<leader>sf', telescope_builtin_factory 'find_files', { desc = '[S]earch [F]iles' } },
  { 'n', '<leader>sF', find_files_glob, { desc = '[S]earch [F]iles glob' } },
  { 'n', '<leader>ss', telescope_builtin_factory 'builtin', { desc = '[S]earch [S]elect Telescope' } },
  { 'n', '<leader>sg', telescope_builtin_factory 'live_grep', { desc = '[S]earch by [G]rep' } },
  { 'n', '<leader>sd', telescope_builtin_factory 'diagnostics', { desc = '[S]earch [D]iagnostics' } },
  { 'n', '<leader>s.', telescope_builtin_factory 'oldfiles', { desc = '[S]earch Recent Files ("." for repeat)' } },
  { 'n', '<leader>sb', telescope_builtin_factory 'buffers', { desc = '[ ] Find existing buffers' } },
  { 'n', '<leader>sy', '/*<cr>', { desc = 'Find yanked' } },

  { 'n', '<leader>st', '<cmd>TodoTelescope keywords=' .. todo_keywords .. '<cr>', { desc = '[T]odo' } },
  { 'n', '<leader>sp', '<cmd>Telescope persisted<cr>', { desc = '[P]rojects' } },

  -- Search current word under cursor
  -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  -- Resume previous search
  { 'n', '<leader>sr', telescope_builtin_factory 'resume', { desc = '[S]earch [R]esume' } },
  { 'n', '<leader>b/', search_current_buffer, { desc = '[/] Fuzzily search in current buffer' } },

  -- Also possible to pass additional configuration options.
  { 'n', '<leader>s/', search_in_open_files, { desc = '[S]earch [/] in Open Files' } },
  -- { 'n', '<leader>sn', search_neovim_files, { desc = '[S]earch [N]eovim files' } },
}
