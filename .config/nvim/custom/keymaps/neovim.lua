local config_path = vim.fn.stdpath 'config'

return {
  { 'n', '<leader>nc', '<cmd>e $MYVIMRC<cr>', { desc = 'Open init.lua' } },
  { 'n', '<leader>nC', '<cmd>cd ' .. config_path .. '<cr>', { desc = 'Open init.lua' } },
  { 'n', '<leader>nr', '<cmd>source $MYVIMRC<cr>', { desc = 'Re source init.lua' } },

  { 'n', '<leader>Ls', '<cmd>Lazy sync<cr>', { desc = 'Lazy sync' } },
  { 'n', '<leader>Ll', '<cmd>Lazy<cr>', { desc = 'Lazy' } },
  { 'n', '<leader>Lu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' } },
  { 'n', '<leader>Lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy profile' } },
}
