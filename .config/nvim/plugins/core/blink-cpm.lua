-- Adds completion
return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = 'v0.*',
  opts = {
    completion = {
      trigger = {
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
      },
      menu = {
        min_width = 15,
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
    },

    signature = { enabled = true },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
    },

    fuzzy = {
      sorts = { 'score', 'kind', 'label' },
    },

    keymap = {
      preset = 'default',

      ['<C-j>'] = {
        function(cmp)
          cmp.select_next()
        end,
      },
      ['<C-k>'] = {
        function(cmp)
          cmp.select_prev()
        end,
      },
      ['<C-l>'] = {
        function(cmp)
          cmp.accept()
        end,
      },
      ['<C-Space>'] = {
        function(cmp)
          cmp.show()
        end,
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { 'sources.default' },
}
