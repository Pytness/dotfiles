local colors = require 'custom.theme.colors'

local highlights = {
  htmlTitle = { fg = colors.white }, -- HTML Title
  htmlArg = { fg = colors.yellow }, -- HTML Argument
  htmlEndTag = { fg = colors.cyan }, -- HTML End Tag
  htmlLink = { fg = colors.purple }, -- HTML Link
  htmlSpecialChar = { fg = colors.dark_yellow }, -- HTML Special Character
  htmlSpecialTagName = { fg = colors.red }, -- HTML Special Tag Name
  htmlTag = { fg = colors.cyan }, -- HTML Tag
  htmlTagName = { fg = colors.red }, -- HTML Tag Name
}

return hgihlights
