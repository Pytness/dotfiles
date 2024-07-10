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
    'ggandor/leap.nvim',
    config = function()
      -- The below settings make Leap's highlighting closer to what you've been
      -- used to in Lightspeed.

      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
      vim.api.nvim_set_hl(0, 'LeapMatch', {
        -- For light themes, set to 'black' or similar.
        fg = 'white',
        bold = true,
        nocombine = true,
      })

      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
        -- fg = 'white',
        fg = '#ff2f87',
        bold = false,
        nocombine = true,
      })

      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
        -- fg = 'black',
        fg = '#99ddff',
        bold = false,
        nocombine = true,
      })

      require('leap').setup {
        safe_labels = 'sfnut/',
        labels = 'sfnjklhodweimbuyvrgtaqpcxz',
      }
    end,
  },
  {
    'ggandor/flit.nvim',
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = 'v',
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {},
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
  {
    'Pocco81/true-zen.nvim',
    config = function()
      require('true-zen').setup {
        modes = {
          narrow = {
            --- change the style of the fold lines. Set it to:
            --- `informative`: to get nice pre-baked folds
            --- `invisible`: hide them
            --- function() end: pass a custom func with your fold lines. See :h foldtext
            folds_style = 'invisible',
            run_ataraxis = true, -- display narrowed text in a Ataraxis session
            callbacks = { -- run functions when opening/closing Narrow mode
              open_pre = nil,
              open_pos = nil,
              close_pre = nil,
              close_pos = nil,
            },
          },
        },
      }
    end,
  },
  { -- Ascii box drawing
    'jbyuki/venn.nvim',
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      after = 'nvim-treesitter',
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {
        settings = {
          sync_on_ui_close = true,
        },
      }
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      clear_chat_on_new_prompt = false,
      prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN Write a detailed and technical explanation of the following code.',
        },
        Review = {
          prompt = '/COPILOT_REVIEW Review the selected code.',
        },
        Fix = {
          prompt = '/COPILOT_GENERATE There is an issue in this code. Rewrite the code to show it with the bug fixed.',
        },
        Optimize = {
          prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
        },
        Docs = {
          prompt = '/COPILOT_GENERATE Add documentation and comments for the following code. Follow these rules:\n1) The comments should not duplicate the code.\n2) Explain unidiomatic code.',
        },
        Tests = {
          prompt = '/COPILOT_GENERATE Generate tests for my code.',
        },
        FixDiagnostic = {
          prompt = 'Please assist with the following diagnostic issue in file:',
        },
        Commit = {
          prompt = 'Write commit message for the change with commitizen convention.\nMake sure the title has maximum 50 characters and message is wrapped at 72 characters.\nWrap the whole message in code block with language gitcommit.',
        },
        CommitStaged = {
          prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
        },
      },
      mappings = {
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = 'R',
          insert = '<C-R>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-m>',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    'anurag3301/nvim-platformio.lua',
    dependencies = {
      { 'akinsho/nvim-toggleterm.lua' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    cmd = {
      'Pioinit',
      'Piorun',
      'Piocmd',
      'Piolib',
      'Piomon',
      'Piodebug',
    },
  },
}
