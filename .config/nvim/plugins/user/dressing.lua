-- Improve the built-in UI
return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',

  opts = {
    input = {
      insert_only = false,
      start_in_insert = false,
    },
  },
}
