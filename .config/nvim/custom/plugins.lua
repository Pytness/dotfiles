-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'rktjmp/lush.nvim' },
  {
    -- Add tabs for buffers
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Explorer',
              text_align = 'center',
              separator = true,
            },
          },
        },
      }
    end,
  },
  {
    -- Improves buffer deletion
    'ojroques/nvim-bufdel',
  },
  {
    -- Add fast motions for the whole buffer
    'ggandor/lightspeed.nvim',
    config = function()
      require('lightspeed').setup {
        ignore_case = true,
      }
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        insert_only = false,
        start_in_insert = false,
      },
    },
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ '*' }, {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'levouh/tint.nvim',
    config = function()
      require('tint').setup {
        tint = -5, -- Darken colors, use a positive value to brighten
        saturation = 0.6, -- Saturation to preserve
        transforms = require('tint').transforms.SATURATE_TINT, -- Showing default behavior, but value here can be predefined set of transforms
        tint_background_colors = true, -- Tint background portions of highlight groups
        highlight_ignore_patterns = { 'WinSeparator', 'Status.*' }, -- Highlight group patterns to ignore, see `string.find`
        window_ignore_function = function(winid)
          local bufid = vim.api.nvim_win_get_buf(winid)
          local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
          local floating = vim.api.nvim_win_get_config(winid).relative ~= ''

          -- Do not tint `terminal` or floating windows, tint everything else
          return buftype == 'terminal' or floating
        end,
      }
    end,
  },
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function()
        require('duck').hatch()
      end, {})
      vim.keymap.set('n', '<leader>dk', function()
        require('duck').cook()
      end, {})
      vim.keymap.set('n', '<leader>da', function()
        require('duck').cook_all()
      end, {})
    end,
  },
}
