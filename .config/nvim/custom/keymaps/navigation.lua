--  Use CTRL+<hjkl> to switch between windows
return {
  { 'n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' } },
  { 'n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' } },
  { 'n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' } },
  { 'n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' } },
  -- Buffer navigation
  { 'n', '<leader>bb', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' } },
  { 'n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' } },

  { 'n', '<leader>bk', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move prev' } },
  { 'n', '<leader>bj', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move next' } },
  { 'n', '<leader>c', '<cmd>BufDel<cr>', { desc = 'Close Buffer' } },
  { 'n', '<leader>bH', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close all to the left' } },
  { 'n', '<leader>bL', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close all to the right' } },
  { 'n', '<leader>c', '<cmd>bd!<cr>', { desc = 'Close Buffer' } },
}
