return {
  'goolord/alpha-nvim',
  config = function()
    local dash = require 'custom.alpha'
    require('alpha').setup(dash.opts)
  end,
}
