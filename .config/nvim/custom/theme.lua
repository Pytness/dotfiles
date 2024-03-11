-- vim.g.palenight_color_overrides = {
--   white = { gui = '#ccccce6', cterm = '145', cterm16 = '7' },
--   cursor_grey = { gui = '#324452', cterm = '236', cterm16 = '9' },
--   black = { gui = '#1c1d24', cterm = '235', cterm16 = '0' },
-- }
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   callback = function()
--     vim.cmd 'highlight FloatBorder guifg=white guibg=black'
--     vim.cmd 'highlight FloatTitle guifg=white guibg=black'
--   end,
-- })

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    'pytness/palenight.vim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
      vim.cmd.colorscheme 'palenight'
    end,
  },
}
