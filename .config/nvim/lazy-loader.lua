local utils = require 'utils'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = utils.merge_arrays {
  utils.load_plugins 'plugins.core',
  utils.load_plugins 'plugins.user',
  utils.load_plugins 'plugins.custom',
}

require('lazy').setup(plugins, {
  version = nil,
  concurrency = vim.uv.available_parallelism(),
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath 'state' .. '/lazy/pkg-cache.lua',
    -- the first package source that is found for a plugin will be used.
    sources = {
      'lazy',
      'rockspec',
      'packspec',
    },
  },
  rocks = {
    root = vim.fn.stdpath 'data' .. '/lazy-rocks',
    server = 'https://nvim-neorocks.github.io/rocks-binaries/',
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = ' ',
      config = '🛠 ',
      event = '󰃭 ',
      ft = '󰉋 ',
      init = ' ',
      keys = '🗝 ',
      plugin = '󰚥 ',
      runtime = '󰌢  ',
      require = '󰏔 ',
      source = '󰈔 ',
      start = '󰑣 ',
      task = '󰐃 ',
      lazy = '󰒲 ',
    },
  },
  profiling = {
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = true,
    -- Track each new require in the Lazy profiling tab
    require = true,
  },
})
