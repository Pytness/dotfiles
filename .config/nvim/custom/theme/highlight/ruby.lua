local colors = require 'custom.theme.colors'

local highlights = {
  rubyAccess = { fg = colors.cyan }, -- Ruby Access
  rubyBlockParameter = { fg = colors.yellow }, -- Ruby Block Parameter
  rubyBlockParameterList = { fg = colors.white }, -- Ruby Block Parameter List
  rubyBoolean = { fg = colors.red }, -- Ruby Boolean
  rubyCapitalizedMethod = { fg = colors.blue }, -- Ruby Capitalized Method
  rubyClass = { fg = colors.purple }, -- Ruby Class
  rubyClassName = { fg = colors.yellow }, -- Ruby Class Name
  rubyConstant = { fg = colors.yellow }, -- Ruby Constant
  rubyControl = { fg = colors.purple }, -- Ruby Control
  rubyEscape = { fg = colors.red }, -- Ruby Escape
  rubyFunction = { fg = colors.blue }, -- Ruby Function
  rubyGlobalVariable = { fg = colors.red }, -- Ruby Global Variable
  rubyInclude = { fg = colors.cyan }, -- Ruby Include
  rubyInstanceVariable = { fg = colors.red }, -- Ruby Instance Variable
  rubyInterpolation = { fg = colors.cyan }, -- Ruby Interpolation
  rubyInterpolationDelimiter = { fg = colors.red }, -- Ruby Interpolation Delimiter
  rubyModuleName = { fg = colors.white }, -- Ruby Module Name
  rubyKeyword = { fg = colors.purple }, -- Ruby Keyword
  rubyOperator = { fg = colors.purple }, -- Ruby Operator
  rubyPredefinedConstant = { fg = colors.yellow }, -- Ruby Predefined Constant
  rubyPseudoVariable = { fg = colors.blue }, -- Ruby Pseudo Variable
  rubyRegexp = { fg = colors.white }, -- Ruby Regexp
  rubyRegexpDelimiter = { fg = colors.cyan }, -- Ruby Regexp Delimiter
  rubySharpBang = { fg = colors.comment_grey }, -- Ruby Sharp Bang
  rubyStringDelimiter = { fg = colors.green }, -- Ruby String Delimiter
  rubySymbol = { fg = colors.blue }, -- Ruby Symbol
  erubyDelimiter = { fg = colors.red }, -- ERB Delimiter
  railsAssetPreProc = { fg = colors.comment_grey }, -- Rails Asset Preprocessor
  railsAssetInclude = { fg = colors.comment_grey }, -- Rails Asset Include
  railsAssetIncluded = { fg = colors.comment_grey }, -- Rails Asset Included
  rubyRailsMethod = { fg = colors.blue }, -- Ruby Rails Method
  rubyRailsFilterMethod = { fg = colors.cyan }, -- Ruby Rails Filter Method
  rubyRailsRenderMethod = { fg = colors.cyan }, -- Ruby Rails Render Method
  rubyRailsARAssociationMethod = { fg = colors.cyan }, -- Ruby Rails Association Method
  rubyRailsHelperMethod = { fg = colors.cyan }, -- Ruby Rails Helper Method
  rspecGroupMethods = { fg = colors.white }, -- RSpec Group Methods
  rspecBeforeAndAfter = { fg = colors.white }, -- RSpec Before and After
}

return highlights
