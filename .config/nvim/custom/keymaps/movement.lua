return {
  -- Stay in Visual when indenting
  { 'v', '>', '>gv' },
  { 'v', '<', '<gv' },
  -- Leap
  { 'n', 's', '<Plug>(leap)' },

  { { 'n', 'v' }, 'gj', ':Treewalker Down<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gk', ':Treewalker Up<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gh', ':Treewalker Left<CR>', { noremap = true } },
  { { 'n', 'v' }, 'gl', ':Treewalker Right<CR>', { noremap = true } },
}
