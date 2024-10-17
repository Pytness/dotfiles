local colors = require 'custom.theme.colors'

local highlights = {

  phpInclude = { fg = colors.purple }, -- PHP Include
  phpClass = { fg = colors.yellow }, -- PHP Class
  phpClasses = { fg = colors.yellow }, -- PHP Classes
  phpFunction = { fg = colors.blue }, -- PHP Function
  phpType = { fg = colors.purple }, -- PHP Type
  phpKeyword = { fg = colors.purple }, -- PHP Keyword
  phpVarSelector = { fg = colors.white }, -- PHP Variable Selector
  phpIdentifier = { fg = colors.white }, -- PHP Identifier
  phpMethod = { fg = colors.blue }, -- PHP Method
  phpBoolean = { fg = colors.blue }, -- PHP Boolean
  phpParent = { fg = colors.white }, -- PHP Parent
  phpOperator = { fg = colors.purple }, -- PHP Operator
  phpRegion = { fg = colors.purple }, -- PHP Region
  phpUseNamespaceSeparator = { fg = colors.white }, -- PHP Use Namespace Separator
  phpClassNamespaceSeparator = { fg = colors.white }, -- PHP Class Namespace Separator
  phpDocTags = { fg = colors.purple, gui = 'italic', cterm = 'italic' }, -- PHP Doc Tags
  phpDocParam = { fg = colors.purple, gui = 'italic', cterm = 'italic' }, -- PHP Doc Param
}

return highlights
