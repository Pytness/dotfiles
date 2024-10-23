-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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

      local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })

      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
      vim.api.nvim_set_hl(0, 'LeapMatch', {
        fg = 'white',
        bold = true,
        nocombine = true,
      })

      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
        bg = normal.bg,
        fg = '#ff2f87',
        bold = false,
        nocombine = true,
      })

      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
        bg = normal.bg,
        fg = '#99ddff',
        bold = false,
        nocombine = true,
      })

      require('leap').setup {
        safe_labels = '', -- Disable the default labels so keypresses are always 3
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
    -- Improve the built-in UI
    'stevearc/dressing.nvim',
    event = 'VeryLazy',

    opts = {
      input = {
        insert_only = false,
        start_in_insert = false,
      },
    },
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- NOTE: check if works
    event = 'BufRead',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
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
    lazy = true,
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
    config = function()
      require('treesitter-context').setup {
        max_lines = 3,
        trim_scope = 'inner',
        multiline_threshold = 1,
        mode = 'topline',
      }
    end,
  },
  {
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
    lazy = true,
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    cmd = {
      'CopilotChatToggle',
      'CopilotChatCommit',
      'CopilotChatCommitStaged',
      'CopilotChatReview',
      'CopilotChatFix',
      'CopilotChatFixDiagnostic',
      'CopilotChatOptimize',
      'CopilotChatDocs',
      'CopilotChatTests',
      'CopilotChatExplain',
      'CopilotChatExplainAdvanced',
      'CopilotChatRefactor',
      'CopilotChatReadable',
      'CopilotChatImplement',
      'CopilotChatLeetTest',
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
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    config = function()
      require('diffview').setup {
        keymaps = {
          view = {
            ['<leader>q'] = '<cmd>DiffviewClose<cr>',
          },
        },
      }
    end,
  },
  {
    'jsongerber/thanks.nvim',
    config = true,
  },
  {
    'rhysd/git-messenger.vim',
    cmd = 'GitMessenger',
    opts = {},
  },
  {
    'cappyzawa/trim.nvim',
    opts = {},
  },
  {
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
  },
}
