--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bb', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })

vim.keymap.set('n', '<leader>bk', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move prev' })
vim.keymap.set('n', '<leader>bj', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move next' })

vim.keymap.set('n', '<leader>bH', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Close all to the left' })
vim.keymap.set('n', '<leader>bL', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close all to the right' })

-- vim.keymap.set('n', '<leader>c', '<cmd>BufDel<cr>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>c', '<cmd>bd!<cr>', { desc = 'Close Buffer' })
