local colors = require 'custom.theme.colors'

local highlights = {

  markdownCode = { fg = colors.green }, -- Markdown Code
  markdownLinkReference = { fg = colors.comment_grey }, -- Markdown Link Reference
  markdownJekyllFrontMatter = { fg = colors.comment_grey }, -- Markdown Jekyll Front Matter
  markdownCodeBlock = { fg = colors.green }, -- Markdown Code Block
  markdownCodeDelimiter = { fg = colors.green }, -- Markdown Code Delimiter
  markdownHeadingDelimiter = { fg = colors.red }, -- Markdown Heading Delimiter
  markdownRule = { fg = colors.comment_grey }, -- Markdown Rule
  markdownHeadingRule = { fg = colors.comment_grey }, -- Markdown Heading Rule
  htmlH1 = { fg = colors.blue }, -- HTML Heading 1
  htmlH2 = { fg = colors.blue }, -- HTML Heading 2
  htmlH3 = { fg = colors.blue }, -- HTML Heading 3
  htmlH4 = { fg = colors.blue }, -- HTML Heading 4
  htmlH5 = { fg = colors.blue }, -- HTML Heading 5
  htmlH6 = { fg = colors.blue }, -- HTML Heading 6
  mkdDelimiter = { fg = colors.cyan }, -- Markdown Delimiter
  markdownId = { fg = colors.purple }, -- Markdown ID
  markdownBlockquote = { fg = colors.comment_grey }, -- Markdown Blockquote
  markdownItalic = { fg = colors.purple, gui = 'italic', cterm = 'italic' }, -- Markdown Italic
  mkdBold = { fg = colors.yellow, gui = 'bold', cterm = 'bold' }, -- Markdown Bold
  mkdInlineURL = { fg = colors.light_red }, -- Markdown Inline URL
  mkdListItem = { fg = colors.yellow }, -- Markdown List Item
  markdownOrderedListMarker = { fg = colors.red }, -- Markdown Ordered List Marker
  markdownIdDeclaration = { fg = colors.blue }, -- Markdown ID Declaration
  mkdLink = { fg = colors.white }, -- Markdown Link
  markdownLinkDelimiter = { fg = colors.white }, -- Markdown Link Delimiter
  mkdURL = { fg = colors.light_red }, -- Markdown URL
}

return highlights
