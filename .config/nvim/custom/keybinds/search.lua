local telescope_builtin = require 'telescope.builtin'

local function find_files_glob()
  telescope_builtin.find_files {
    find_command = { 'fd', '--type', 'file', '--hidden', '--exclude', '.git', '--glob' },
    prompt_title = 'Live Files glob',
  }
end

vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sF', find_files_glob, { desc = '[S]earch [F]iles glob' })
vim.keymap.set('n', '<leader>ss', telescope_builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>s.', telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sy', '/*<cr>', { desc = 'Find yanked' })

local todo_keywords = 'FIX,BUG,ISSUE,TODO,HACK,WARN,WARNING,XXX,NOTE,INFO,PERF,OPTIM,PERFORMANCE,OPTIMIZE,TEST'
vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope keywords=' .. todo_keywords .. '<cr>', { desc = '[T]odo' })
vim.keymap.set('n', '<leader>sp', '<cmd>Telescope persisted<cr>', { desc = '[P]rojects' })

-- Search current word under cursor
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- Resume previous search
vim.keymap.set('n', '<leader>sr', telescope_builtin.resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>b/', function()
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Also possible to pass additional configuration options.
vim.keymap.set('n', '<leader>s/', function()
  telescope_builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<leader>sn', function()
  telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
