-- venn.nvim: enable or disable keymappings
local venn_enabled = false
local function Toggle_venn()
  if venn_enabled == false then
    venn_enabled = true
    vim.cmd [[setlocal ve=all]]
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, 'n', 'J', '<C-v>j:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<C-v>k:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'L', '<C-v>l:VBox<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'H', '<C-v>h:VBox<CR>', { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, 'v', 'f', ':VBox<CR>', { noremap = true })
  else
    vim.cmd [[setlocal ve=]]
    vim.cmd [[mapclear <buffer>]]
    venn_enabled = false
  end
end

-- vim.keymap.set('n', '<leader>mv', Toggle_venn, { desc = 'Toggle venn', noremap = true })

return {
  { 'n', '<leader>mm', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Toggle markdown preview' } },
}
