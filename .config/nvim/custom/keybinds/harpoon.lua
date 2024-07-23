local harpoon = require 'harpoon'
-- local harpoon_ext = require 'harpoon.ext'

local function add()
  harpoon:list():add()
end

vim.keymap.set('n', '<leader>ha', add, { desc = 'Add current file to Harpoon' })

vim.keymap.set('n', '<leader>hA', function()
  local list = harpoon:list()

  -- Open the fist 4 files
  list:select(1)
  list:select(2)
  list:select(3)
  list:select(4)

  -- Select the first one
  list:select(1)
end, { desc = 'Open all' })

local function toggle_telescope(harpoon_files)
  -- local opts = {
  --   attach_mappings = function(_, map)
  --     map('i', '<A-j>', 'move_selection_next')
  --     return true
  --   end,
  -- }
  -- require('telescope').extensions.harpoon.marks()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

vim.keymap.set('n', '<leader>he', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Toggle Harpoon menu' })

vim.keymap.set('n', '<leader>hh', function()
  harpoon:list():select(1)
end, { desc = 'Select Harpoon 1' })

vim.keymap.set('n', '<leader>hj', function()
  harpoon:list():select(2)
end, { desc = 'Select Harpoon 2' })

vim.keymap.set('n', '<leader>hk', function()
  harpoon:list():select(3)
end, { desc = 'Select Harpoon 3' })

vim.keymap.set('n', '<leader>hl', function()
  harpoon:list():select(4)
end, { desc = 'Select Harpoon 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>hp', function()
  harpoon:list():prev()
end, { desc = 'Select previous Harpoon buffer' })

vim.keymap.set('n', '<leader>hn', function()
  harpoon:list():next()
end, { desc = 'Select next Harpoon buffer' })
