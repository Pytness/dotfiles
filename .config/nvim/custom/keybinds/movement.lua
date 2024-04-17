-- Stay in Visual when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Move lines around
-- vim.keymap.set('n', '<M-k>', '<cmd>m .-2<cr>==')
-- vim.keymap.set('n', '<M-j>', '<cmd>m .+1<cr>==')
--
-- vim.keymap.set('i', '<M-k>', '<esc>:m .-2<cr>==gi')
-- vim.keymap.set('i', '<M-j>', '<esc>:m .+1<cr>==gi')
--
-- vim.keymap.set('v', '<M-k>', ":m '<-2<cr>gv=gv")
-- vim.keymap.set('v', '<M-j>', ":m '>+1<cr>gv=gv")

vim.keymap.set('n', 's', '<Plug>Lightspeed_omni_s')
vim.keymap.set('n', 'f', '<Plug>Lightspeed_f')
vim.keymap.set('n', 'F', '<Plug>Lightspeed_F')
vim.keymap.set('n', ';', '<Plug>Lightspeed_;_ft')
vim.keymap.set('n', ',', '<Plug>Lightspeed_,_ft')
