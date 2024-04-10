vim.keymap.set('n', '<leader>zn', ':TZNarrow<CR>', { desc = 'Narrow focus' })
vim.keymap.set('v', '<leader>zn', ":'<,'>TZNarrow<CR>", { desc = 'Narrow focus' })
vim.keymap.set('n', '<leader>za', ':TZAtaraxis<CR>', { desc = 'Zen mod' })

-- vim.api.nvim_set_keymap('n', '<leader>zf', ':TZFocus<CR>', {})

-- vim.api.nvim_set_keymap('n', '<leader>zm', ':TZMinimalist<CR>', {})
