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

vim.keymap.set('i', 'jj', '<ESC>j', { silent = true })
vim.keymap.set('i', 'kk', '<ESC>k', { silent = true })
vim.keymap.set('i', 'kj', '<ESC>', { silent = true })

-- vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })
vim.keymap.set('n', '<leader>k', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })

local function quit()
  vim.cmd 'silent q'
end

-- Disable default S key in favour of using it for surround.vim
vim.keymap.set('n', 'S', '<nop>')

-- For some reason, neovim started spitting out errors
-- when I tried to use '<cmd>q<cr>' here.
vim.keymap.set('n', '<leader>q', quit, { desc = ':q' })

vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { desc = ':q!' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = ':w' })

vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment line (visual)' })
vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment line' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope neoclip<cr>', { desc = 'Search clipboard' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

local wk = require 'which-key'

wk.add {
  { '<leader>b', group = '[b]uffer' },
  { '<leader>d', group = '[d]ocument' },
  { '<leader>r', group = '[r]ename' },
  { '<leader>s', group = '[s]earch' },
  { '<leader>h', group = '[h]arpoon' },
  { '<leader>n', group = '[n]eovim' },
  { '<leader>l', group = '[l]sp' },
  { '<leader>C', group = '[C]argo' },
  { '<leader>g', group = '[g]it' },
  { '<leader>m', group = '[m]isc' },
  { '<leader>a', group = 'Copilot Ch[a]t' },
  { '<leader>z', group = '[Z]en mode' },
}

-- @keymaps: {string | table, string, string | function, table?}
local function set_keymaps(mappings)
  for _, keymap in ipairs(mappings) do
    local mode = keymap[1]
    local key = keymap[2]
    local action = keymap[3]
    local options = keymap[4] or {}

    vim.keymap.set(mode, key, action, options)
  end
end

set_keymaps(require 'keymaps.cargo')
set_keymaps(require 'keymaps.copilot')
set_keymaps(require 'keymaps.git')
set_keymaps(require 'keymaps.harpoon')
set_keymaps(require 'keymaps.lsp')
set_keymaps(require 'keymaps.misc')
set_keymaps(require 'keymaps.movement')
set_keymaps(require 'keymaps.navigation')
set_keymaps(require 'keymaps.neovim')
set_keymaps(require 'keymaps.search')
set_keymaps(require 'keymaps.zen')
