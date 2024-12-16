-- " " Copy to clipboard
vim.cmd 'vnoremap  y  "+y'
vim.cmd 'nnoremap  Y  "+yg_'
vim.cmd 'nnoremap  y  "+y'
vim.cmd 'nnoremap  yy  "+yy'

-- " " Paste from clipboard
vim.cmd 'nnoremap p "+p'
vim.cmd 'nnoremap P "+P'
vim.cmd 'vnoremap p "+p'
vim.cmd 'vnoremap P "+P'

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
