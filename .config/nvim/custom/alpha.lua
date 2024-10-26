local dashboard = require 'alpha.themes.dashboard'
local button = dashboard.button

local version = vim.version()
local nvim_version_info = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

dashboard.section.header.val = {
  'Neovim' .. '    ' .. nvim_version_info,
}

dashboard.section.buttons.val = {
  button('e', '  New File', ':ene <BAR> startinsert<CR>'),
  -- button('s', '  Search Files', ':Telescope find_files<CR>'),
  -- button('b', '  Recents', ':Telescope oldfiles<CR>'),
  -- button('h', '  History', ':Telescope git_commits<CR>'),
  -- button('c', '  Find Word', ':Telescope live_grep<CR>'),
  button('q', '  Quit', ':qa<CR>'),
}

local function footer()
  local datetime = os.date ' %d/%m/%Y    %H:%M:%S'
  local lazy_stats = require('lazy').stats()

  local text_table = {
    datetime,
    'Plugin      ' .. '  󰚥  ' .. lazy_stats.count .. ' / ' .. lazy_stats.loaded,
    'Startup Time' .. '  󱎫  ' .. lazy_stats.startuptime .. ' ms',
    'Pytness',
  }

  return {
    type = 'text',
    val = text_table,
    opts = {
      position = 'center',
      hl = 'Conditional',
    },
  }
end

local function create_layout()
  return {
    { type = 'padding', val = 3 },
    dashboard.section.header,
    { type = 'padding', val = 2 },
    dashboard.section.buttons,
    { type = 'padding', val = 1 },
    footer(),
  }
end

dashboard.config.layout = create_layout()

vim.api.nvim_create_autocmd('User', {
  once = true,
  pattern = 'LazyVimStarted',

  callback = function()
    dashboard.config.layout = create_layout()
    pcall(vim.cmd.AlphaRedraw)
  end,
})

return dashboard
