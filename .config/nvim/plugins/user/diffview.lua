return {
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
}
