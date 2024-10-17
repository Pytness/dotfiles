-- return {
--   {
--     'pytness/palenight.vim',
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--
--     config = function()
--       vim.cmd.colorscheme 'palenight'
--     end,
--   },
-- }

require 'custom.theme.term_colors'
require 'custom.theme.highlight'
