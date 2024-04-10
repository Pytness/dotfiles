vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })

vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = ':q' })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { desc = ':q!' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = ':w' })
vim.keymap.set('n', '<leader>e', require('custom.minifiles').toggle, { desc = 'Toggle file tree' })

vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment line (visual)' })
vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment line' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope colorscheme<cr>', { desc = 'Select coloscheme' })

-- Stay in Visual when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Move lines around
vim.keymap.set('n', '<M-k>', '<cmd>m .-2<cr>==')
vim.keymap.set('n', '<M-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('i', '<M-k>', '<esc>:m .-2<cr>==gi')
vim.keymap.set('i', '<M-j>', '<esc>:m .+1<cr>==gi')
vim.keymap.set('v', '<M-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('v', '<M-j>', ":m '>+1<cr>gv=gv")

vim.g.lightspeed_no_default_keymaps = 1
vim.keymap.set('n', 's', '<Plug>Lightspeed_omni_s')
vim.keymap.set('n', 'f', '<Plug>Lightspeed_f')
vim.keymap.set('n', 'F', '<Plug>Lightspeed_F')
vim.keymap.set('n', ';', '<Plug>Lightspeed_;_ft')
vim.keymap.set('n', ',', '<Plug>Lightspeed_,_ft')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

local telescope_builtin = require 'telescope.builtin'

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bb', '<cmd>bprev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>c', '<cmd>BufDel<cr>', { desc = 'Close Buffer' })

-- Cargo keymaps
vim.keymap.set('n', '<leader>Cr', '<cmd>CargoReload<cr>', { desc = 'Cargo Reload' })

-- Neovim keymaps
vim.keymap.set('n', '<leader>nc', '<cmd>e $MYVIMRC<cr>', { desc = 'Open init.lua' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>lR', telescope_builtin.lsp_references, { desc = '[R]eferences' })

-- Search keymaps
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', telescope_builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>s.', telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })

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
