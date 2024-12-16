-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'modern',
  },
  keys = {
    '<leader>',
  },
}
