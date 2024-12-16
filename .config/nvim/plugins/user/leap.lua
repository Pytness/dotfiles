-- Allows you to jump to any character in the visible area of the screen
return {
  'ggandor/leap.nvim',
  config = function()
    require('leap').setup {
      safe_labels = '', -- Disable the default labels so keypresses are always 3
      labels = 'sfnjklhodweimbuyvrgtaqpcxz',
    }
  end,
}
