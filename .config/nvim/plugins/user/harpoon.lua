-- Mininal project navigation
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        sync_on_ui_close = true,
      },
    }
  end,
}
