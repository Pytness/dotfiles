local function quit()
  vim.cmd 'silent q'
end

return {
  { 'i', 'jj', '<ESC>j', { silent = true } },
  { 'i', 'kk', '<ESC>k', { silent = true } },
  { 'i', 'kj', '<ESC>', { silent = true } },

  { 'n', '<leader>k', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' } },

  -- Disable default S key in favour of using it for surround.vim
  { 'n', 'S', '<nop>' },

  -- For some reason, neovim started spitting out errors
  -- when I tried to use '<cmd>q<cr>' here.
  { 'n', '<leader>q', quit, { desc = ':q' } },

  { 'n', '<leader>Q', '<cmd>q!<cr>', { desc = ':q!' } },
  { 'n', '<leader>w', '<cmd>w<cr>', { desc = ':w' } },
  { 'n', '<leader>W', '<cmd>w !sudo tee %', { desc = 'Write with root privileges' } },

  { 'v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment line (visual)' } },
  { 'n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment line' } },
  -- Stay in Visual when indenting
  { 'v', '>', '>gv' },
  { 'v', '<', '<gv' },
  -- Leap
  { 'n', 's', '<Plug>(leap)' },

  { { 'n', 'v' }, 'gj', ':Treewalker Down<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gk', ':Treewalker Up<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gh', ':Treewalker Left<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gl', ':Treewalker Right<CR>', { noremap = true } },
}
