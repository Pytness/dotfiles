--  Use CTRL+<hjkl> to switch between windows

local function toggle_minifiles()
  require('custom.minifiles').toggle()
end

local function toggle_bafa()
  require('bafa.ui').toggle()
end

return {
  { 'n', '<leader>e', toggle_minifiles, { desc = 'Toggle file tree' } },
  { 'n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' } },
  { 'n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' } },
  { 'n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' } },
  { 'n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' } },

  { 'n', '<leader>sb', toggle_bafa, { desc = 'Close diffview' } },
  { 'n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' } },
  { 'n', '<leader>bb', '<cmd>bprev<cr>', { desc = 'Previous buffer' } },

  -- NOTE: maybe delete this later
  { 'n', '<leader>c', '<cmd>BufDel<cr>', { desc = 'Close Buffer' } },
}
