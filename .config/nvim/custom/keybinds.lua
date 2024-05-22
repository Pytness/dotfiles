-- " " Copy to clipboard
vim.cmd 'vnoremap  y  "+y'
vim.cmd 'nnoremap  Y  "+yg_'
vim.cmd 'nnoremap  y  "+y'
vim.cmd 'nnoremap  yy  "+yy'

-- " " P'aste from clipboard
vim.cmd 'nnoremap p "+p'
vim.cmd 'nnoremap P "+P'
vim.cmd 'vnoremap p "+p'
vim.cmd 'vnoremap P "+P'

vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('i', 'kk', '<ESC>', { silent = true })
vim.keymap.set('i', 'kj', '<ESC>', { silent = true })

-- vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })
vim.keymap.set('n', '<leader>k', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })

vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = ':q' })
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { desc = ':q!' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = ':w' })
vim.keymap.set('n', '<leader>e', require('custom.minifiles').toggle, { desc = 'Toggle file tree' })

vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment line (visual)' })
vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment line' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope colorscheme<cr>', { desc = 'Select coloscheme' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

require 'custom.keybinds.git'

require 'custom.keybinds.movement'
require 'custom.keybinds.harpoon'

require 'custom.keybinds.misc'

require 'custom.keybinds.cargo'

require 'custom.keybinds.neovim'

require 'custom.keybinds.navigation'

require 'custom.keybinds.lsp'

require 'custom.keybinds.search'

require 'custom.keybinds.zen'
