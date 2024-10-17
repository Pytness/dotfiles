local colors = require 'custom.theme.colors'

local highlights = {
  jsonCommentError = { fg = colors.white }, -- JSON Comment Error
  jsonKeyword = { fg = colors.blue }, -- JSON Keyword
  jsonBoolean = { fg = colors.red }, -- JSON Boolean
  jsonNumber = { fg = colors.dark_yellow }, -- JSON Number
  jsonQuote = { fg = colors.white }, -- JSON Quote
  jsonMissingCommaError = { fg = colors.red, gui = 'reverse' }, -- JSON Missing Comma Error
  jsonNoQuotesError = { fg = colors.red, gui = 'reverse' }, -- JSON No Quotes Error
  jsonNumError = { fg = colors.red, gui = 'reverse' }, -- JSON Number Error
  jsonString = { fg = colors.green }, -- JSON String
  jsonStringSQError = { fg = colors.red, gui = 'reverse' }, -- JSON String Single Quote Error
  jsonSemicolonError = { fg = colors.red, gui = 'reverse' }, -- JSON Semicolon Error
}
