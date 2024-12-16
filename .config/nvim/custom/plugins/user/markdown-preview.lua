return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  config = function()
    vim.g.mkdp_auto_close = 0
  end,
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
