return {
  { 'n', '<leader>zn', ':TZNarrow<CR>', { desc = 'Narrow focus' } },
  { 'v', '<leader>zn', ":'<,'>TZNarrow<CR>", { desc = 'Narrow focus' } },
  { 'n', '<leader>za', ':TZAtaraxis<CR>', { desc = 'Zen mod' } },
}

-- vim.api.nvim_set_keymap('n', '<leader>zf', ':TZFocus<CR>', {})

-- vim.api.nvim_set_keymap('n', '<leader>zm', ':TZMinimalist<CR>', {})
