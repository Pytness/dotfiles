local gittools = require 'custom.gittools'

-- git restore current file and reload it
local function restore_current_file()
  local current_file = vim.api.nvim_buf_get_name(0)

  gittools.restore_file(current_file)
  print('Restored ' .. current_file)

  vim.cmd 'edit!'
end

local function git_diff()
  local current_file = vim.api.nvim_buf_get_name(0)
  vim.cmd('DiffviewOpen -- ' .. current_file)
  vim.cmd 'DiffviewToggleFiles'
end

vim.keymap.set('n', '<leader>gr', restore_current_file, { desc = 'Restore current file' })
vim.keymap.set('n', '<leader>gd', git_diff, { desc = 'Diff current file' })
