-- better f, F, t, T
return {
  'ggandor/flit.nvim',
  config = function()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      labeled_modes = 'v',
      multiline = true,
      opts = {},
    }
  end,
}
