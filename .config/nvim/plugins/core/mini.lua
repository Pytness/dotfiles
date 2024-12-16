-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']

    require('mini.surround').setup {
      -- Add custom surroundings to be used on top of builtin ones. For more
      -- information with examples, see `:h MiniSurround.config`.
      custom_surroundings = nil,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = 'Sa', -- Add surrounding in Normal and Visual modes
        delete = 'Sd', -- Delete surrounding
        find = 'Sf', -- Find surrounding (to the right)
        find_left = 'SF', -- Find surrounding (to the left)
        highlight = 'Sh', -- Highlight surrounding
        replace = 'Sr', -- Replace surrounding
        update_n_lines = 'Sn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = 'cover',

      -- Whether to disable showing non-error feedback
      silent = false,
    }

    local tabline = require 'mini.tabline'
    tabline.setup {
      show_icons = true,

      -- Function which formats the tab label
      -- By default surrounds with space and possibly prepends with icon
      format = function(buffer_id, label)
        if label == '*' then
          label = '[No Name]'
        end

        label = tabline.default_format(buffer_id, label)

        if vim.bo[buffer_id].modified then
          label = '+' .. label
        else
          label = ' ' .. label
        end

        return label
      end,

      -- Whether to set Vim's settings for tabline (make it always shown and
      -- allow hidden buffers)
      set_vim_settings = true,

      -- Where to show tabpage section in case of multiple vim tabpages.
      -- One of 'left', 'right', 'none'.
      tabpage_section = 'right',
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    statusline.setup()

    local gen_ai_spec = require('mini.extra').gen_ai_spec
    require('mini.ai').setup {
      custom_textobjects = {
        B = gen_ai_spec.buffer(),
        D = gen_ai_spec.diagnostic(),
        I = gen_ai_spec.indent(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
      },
    }

    require('mini.move').setup {
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = false,
      },
    }

    require('mini.bracketed').setup {
      treesitter = { suffix = 't', options = {} },
    }

    statusline.section_location = function()
      return '%2l:%-2v %P'
    end

    require 'custom.minifiles'
  end,
}
