-- Clipboard manager with telescope integration
return {
  'acksld/nvim-neoclip.lua',
  dependencies = {
    -- you'll need at least one of these
    -- {'nvim-telescope/telescope.nvim'},
    -- {'ibhagwan/fzf-lua'},
  },

  config = function()
    require('neoclip').setup {
      default_register = '*',
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-P>',
            replay = '<c-q>', -- replay a macro
            delete = '<c-d>', -- delete an entry
            edit = '<c-e>', -- edit an entry
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
        fzf = {
          select = 'default',
          paste = 'ctrl-p',
          paste_behind = 'ctrl-k',
          custom = {},
        },
      },
    }
  end,
}
