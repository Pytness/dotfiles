local colors = require 'custom.theme.colors'

local highlights = {
  cssAttrComma = { fg = colors.purple }, -- CSS Attribute Comma
  cssAttributeSelector = { fg = colors.green }, -- CSS Attribute Selector
  cssBraces = { fg = colors.white }, -- CSS Braces
  cssClassName = { fg = colors.dark_yellow }, -- CSS Class Name
  cssClassNameDot = { fg = colors.dark_yellow }, -- CSS Class Name Dot
  cssDefinition = { fg = colors.purple }, -- CSS Definition
  cssFontAttr = { fg = colors.dark_yellow }, -- CSS Font Attribute
  cssFontDescriptor = { fg = colors.purple }, -- CSS Font Descriptor
  cssFunctionName = { fg = colors.blue }, -- CSS Function Name
  cssIdentifier = { fg = colors.blue }, -- CSS Identifier
  cssImportant = { fg = colors.purple }, -- CSS !important
  cssInclude = { fg = colors.white }, -- CSS Include
  cssIncludeKeyword = { fg = colors.purple }, -- CSS Include Keyword
  cssMediaType = { fg = colors.dark_yellow }, -- CSS Media Type
  cssProp = { fg = colors.white }, -- CSS Property
  cssPseudoClassId = { fg = colors.dark_yellow }, -- CSS Pseudo Class/ID
  cssSelectorOp = { fg = colors.purple }, -- CSS Selector Operator
  cssSelectorOp2 = { fg = colors.purple }, -- CSS Selector Operator 2
  cssTagName = { fg = colors.red }, -- CSS Tag Name
  cssColor = { fg = colors.dark_yellow }, -- CSS Color
  cssCommonAttr = { fg = colors.blue }, -- CSS Common Attribute
  cssUnitDecorators = { fg = colors.yellow }, -- CSS Unit Decorators

  scssExtend = { fg = colors.purple }, -- SCSS Extend
  scssExtendedSelector = { fg = colors.dark_yellow }, -- SCSS Extended Selector
  scssFunctionName = { fg = colors.cyan }, -- SCSS Function Name
  scssImport = { fg = colors.purple }, -- SCSS Import
  scssInclude = { fg = colors.purple }, -- SCSS Include
  scssMixin = { fg = colors.purple }, -- SCSS Mixin
  scssMixinName = { fg = colors.blue }, -- SCSS Mixin Name
  scssSelectorName = { fg = colors.yellow }, -- SCSS Selector Name
  scssVariable = { fg = colors.dark_yellow }, -- SCSS Variable

  sassAmpersand = { fg = colors.red }, -- Sass Ampersand
  sassClass = { fg = colors.dark_yellow }, -- Sass Class
  sassControl = { fg = colors.purple }, -- Sass Control
  sassExtend = { fg = colors.purple }, -- Sass Extend
  sassFor = { fg = colors.white }, -- Sass For
  sassFunction = { fg = colors.cyan }, -- Sass Function
  sassId = { fg = colors.blue }, -- Sass ID
  sassInclude = { fg = colors.purple }, -- Sass Include
  sassMedia = { fg = colors.purple }, -- Sass Media
  sassMediaOperators = { fg = colors.white }, -- Sass Media Operators
  sassMixin = { fg = colors.purple }, -- Sass Mixin
  sassMixinName = { fg = colors.blue }, -- Sass Mixin Name
  sassMixing = { fg = colors.purple }, -- Sass Mixing
  sassVariable = { fg = colors.dark_yellow }, -- Sass Variable
}

return highlights
