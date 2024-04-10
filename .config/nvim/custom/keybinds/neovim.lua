-- Neovim keymaps
vim.keymap.set('n', '<leader>nc', '<cmd>e $MYVIMRC<cr>', { desc = 'Open init.lua' })
vim.keymap.set('n', '<leader>ns', '<cmd>Lazy sync<cr>', { desc = 'Lazy sync' })
vim.keymap.set('n', '<leader>nu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' })
