-- local harpoon_ext = require 'harpoon.ext'

local function add_file()
  local harpoon = require 'harpoon'
  harpoon:list():add()
end

local function open_all()
  local harpoon = require 'harpoon'
  local list = harpoon:list()

  -- Open the fist 4 files
  list:select(1)
  list:select(2)
  list:select(3)
  list:select(4)

  -- Select the first one
  list:select(1)
end

local function open_harpoon_list()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

local function select_factory(n)
  return function()
    local harpoon = require 'harpoon'
    harpoon:list():select(n)
  end
end

local function select_previous()
  local harpoon = require 'harpoon'
  harpoon:list():prev()
end

local function select_next()
  local harpoon = require 'harpoon'
  harpoon:list():next()
end

return {
  { 'n', '<leader>ha', add_file, { desc = 'Add current file to Harpoon' } },
  { 'n', '<leader>hA', open_all, { desc = 'Open all' } },
  { 'n', '<leader>he', open_harpoon_list, { desc = 'Toggle Harpoon menu' } },

  { 'n', '<leader>hh', select_factory(1), { desc = 'Select Harpoon 1' } },
  { 'n', '<leader>hj', select_factory(2), { desc = 'Select Harpoon 2' } },
  { 'n', '<leader>hk', select_factory(3), { desc = 'Select Harpoon 3' } },
  { 'n', '<leader>hl', select_factory(4), { desc = 'Select Harpoon 4' } },

  -- Toggle previous & next buffers stored within Harpoon list
  { 'n', '<leader>hp', select_previous, { desc = 'Select previous Harpoon buffer' } },
  { 'n', '<leader>hn', select_next, { desc = 'Select next Harpoon buffer' } },
}
