local gittools = require 'custom.gittools'

-- git restore current file and reload it
local function restore_current_file()
  local current_file = vim.api.nvim_buf_get_name(0)
  gittools.restore_file(current_file)

  vim.cmd 'edit!'
end

vim.keymap.set('n', '<leader>gr', restore_current_file, { desc = 'Restore current file' })
