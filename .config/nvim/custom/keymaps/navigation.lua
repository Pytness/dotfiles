--  Use CTRL+<hjkl> to switch between windows
return {
  { 'n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' } },
  { 'n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' } },
  { 'n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' } },
  { 'n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' } },

  { 'n', '<leader>sb', require('bafa.ui').toggle, { desc = 'Close diffview' } },
  { 'n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' } },
  { 'n', '<leader>bb', '<cmd>bprev<cr>', { desc = 'Previous buffer' } },

  -- NOTE: maybe delete this later
  { 'n', '<leader>c', '<cmd>BufDel<cr>', { desc = 'Close Buffer' } },
}
