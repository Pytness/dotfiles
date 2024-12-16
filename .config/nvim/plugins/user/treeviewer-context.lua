return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {
    after = 'nvim-treesitter',
  },
  config = function()
    require('treesitter-context').setup {
      max_lines = 3,
      trim_scope = 'inner',
      multiline_threshold = 1,
      mode = 'topline',
    }
  end,
}
