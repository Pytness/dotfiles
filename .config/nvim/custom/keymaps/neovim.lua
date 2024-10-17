local config_path = vim.fn.stdpath 'config'

return {
  { 'n', '<leader>nc', '<cmd>e $MYVIMRC<cr>', { desc = 'Open init.lua' } },
  { 'n', '<leader>nC', '<cmd>cd ' .. config_path .. '<cr>', { desc = 'Open init.lua' } },
  { 'n', '<leader>ns', '<cmd>Lazy sync<cr>', { desc = 'Lazy sync' } },
  { 'n', '<leader>nl', '<cmd>Lazy<cr>', { desc = 'Lazy' } },
  { 'n', '<leader>nu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' } },
  { 'n', '<leader>nr', '<cmd>source $MYVIMRC<cr>', { desc = 'Re source init.lua' } },
}
