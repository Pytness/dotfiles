local function toggle()
  require('bafa.ui').toggle()
end

local function select_menu_item()
  require('bafa.ui').select_menu_item()
end

local function delete_menu_item()
  require('bafa.ui').delete_menu_item()
end

local function delete_multiple_menu_items()
  require('bafa.ui').delete_multiple_menu_items()
end

return {
  { 'n', 'q', toggle, { silent = true } },
  { 'n', '<ESC>', toggle, { silent = true } },
  { 'n', '<CR>', select_menu_item, {} },
  { 'n', '<C-l>', select_menu_item, {} },
  { 'n', 'dd', delete_menu_item, {} },
  { 'n', 'D', delete_menu_item, {} },
  { 'v', 'd', delete_multiple_menu_items, {} },
}
