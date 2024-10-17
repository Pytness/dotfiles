local colors = require 'custom.theme.colors'

local highlights = {
  xmlAttrib = { fg = colors.yellow }, -- XML Attribute
  xmlEndTag = { fg = colors.red }, -- XML End Tag
  xmlTag = { fg = colors.red }, -- XML Tag
  xmlTagName = { fg = colors.red }, -- XML Tag Name
}

return highlights
