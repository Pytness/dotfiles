-- Add nvim-cmp compatibility layer for blink
return {
  'saghen/blink.compat',
  version = '*',
  lazy = true,
  opts = {
    impersonate_nvim_cmp = true,
    debug = true,
  },
}
