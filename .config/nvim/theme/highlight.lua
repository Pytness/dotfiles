local colors = require 'theme.colors'

local highlights = {
  Comment = { fg = colors.comment_grey, italic = true, cterm = { italic = true } }, -- any comment
  Constant = { fg = colors.cyan }, -- any constant
  String = { fg = colors.green }, -- a string constant: "this is a string"
  Character = { fg = colors.green }, -- a character constant: 'c', '\n'
  Number = { fg = colors.dark_yellow }, -- a number constant: 234, 0xff
  Boolean = { fg = colors.red }, -- a boolean constant: TRUE, false
  Float = { fg = colors.dark_yellow }, -- a floating point constant: 2.3e10
  Identifier = { fg = colors.red }, -- any variable name
  Function = { fg = colors.blue }, -- function name (also: methods for classes)
  Statement = { fg = colors.purple }, -- any statement
  Conditional = { fg = colors.purple }, -- if, then, else, endif, switch, etc.
  Repeat = { fg = colors.purple }, -- for, do, while, etc.
  Label = { fg = colors.purple }, -- case, default, etc.
  Operator = { fg = colors.cyan }, -- sizeof", "+", "*", etc.
  Keyword = { fg = colors.red }, -- any other keyword
  Exception = { fg = colors.purple }, -- try, catch, throw
  PreProc = { fg = colors.yellow }, -- generic Preprocessor
  Include = { fg = colors.blue }, -- preprocessor #include
  Define = { fg = colors.purple }, -- preprocessor #define
  Macro = { fg = colors.purple }, -- same as Define
  PreCondit = { fg = colors.yellow }, -- preprocessor #if, #else, #endif, etc.
  Type = { fg = colors.yellow }, -- int, long, char, etc.
  StorageClass = { fg = colors.yellow }, -- static, register, volatile, etc.
  Structure = { fg = colors.yellow }, -- struct, union, enum, etc.
  Typedef = { fg = colors.yellow }, -- A typedef
  Special = { fg = colors.blue }, -- any special symbol
  SpecialChar = {}, -- special character in a constant
  Tag = {}, -- you can use CTRL-] on this
  Delimiter = {}, -- character that needs attention
  SpecialComment = { fg = colors.comment_grey }, -- special things inside a comment
  Debug = {}, -- debugging statements
  Underlined = { underline = true, cterm = { underline = true } }, -- text that stands out, HTML links
  Ignore = {}, -- left blank, hidden
  Error = { fg = colors.red }, -- any erroneous construct
  Todo = { fg = colors.purple }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  ColorColumn = { bg = colors.cursor_grey }, -- used for the columns set with 'colorcolumn'
  Conceal = {}, -- placeholder characters substituted for concealed text
  Cursor = { fg = colors.black, bg = colors.blue }, -- the character under the cursor
  CursorIM = {}, -- like Cursor, but used when in IME mode
  CursorColumn = { bg = colors.cursor_grey }, -- the screen column when 'cursorcolumn' is set
  CursorLine = { bg = colors.cursor_grey }, -- the screen line when 'cursorline' is set
  Directory = { fg = colors.blue }, -- directory names
  DiffAdd = { bg = colors.green, fg = colors.black }, -- diff mode: Added line
  DiffChange = { bg = colors.yellow, fg = colors.black }, -- diff mode: Changed line
  DiffDelete = { bg = colors.red, fg = colors.black }, -- diff mode: Deleted line
  DiffText = { bg = colors.black, fg = colors.yellow }, -- diff mode: Changed text within a changed line
  ErrorMsg = { fg = colors.red }, -- error messages on the command line
  VertSplit = { fg = colors.vertsplit }, -- the column separating vertically split windows
  Folded = { bg = colors.cursor_grey, fg = colors.comment_grey }, -- line used for closed folds
  FoldColumn = {}, -- 'foldcolumn'
  SignColumn = {}, -- column where signs are displayed
  IncSearch = { fg = colors.yellow, bg = colors.comment_grey }, -- 'incsearch' highlighting
  LineNr = { fg = colors.gutter_fg_grey }, -- Line number for ":number" and ":#"
  CursorLineNr = {}, -- Like LineNr when 'cursorline' or 'relativenumber' is set
  MatchParen = { fg = colors.blue, underline = true }, -- the character under the cursor if it's a paired bracket
  ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT --")
  MoreMsg = {}, -- more-prompt
  NonText = { fg = colors.special_grey }, -- '~' and '@' at the end of the window
  Normal = { fg = colors.white, bg = colors.black }, -- normal text
  Pmenu = { bg = colors.menu_grey }, -- Popup menu: normal item
  PmenuSel = { fg = colors.black, bg = colors.blue }, -- Popup menu: selected item
  PmenuSbar = { bg = colors.special_grey }, -- Popup menu: scrollbar
  PmenuThumb = { bg = colors.white }, -- Popup menu: Thumb of the scrollbar
  Question = { fg = colors.purple }, -- hit-enter prompt and yes/no questions
  Search = { fg = colors.black, bg = colors.yellow }, -- Last search pattern highlighting
  SpecialKey = { fg = colors.special_grey }, -- Meta and special keys listed with ":map"
  SpellBad = { fg = colors.red, underline = true, cterm = { underline = true } }, -- Word not recognized by the spellchecker
  SpellCap = { fg = colors.dark_yellow }, -- Word that should start with a capital
  SpellLocal = { fg = colors.dark_yellow }, -- Word recognized by spellchecker as used in another region
  SpellRare = { fg = colors.dark_yellow }, -- Word recognized by spellchecker as hardly ever used
  StatusLine = { fg = colors.white, bg = colors.cursor_grey }, -- status line of current window
  StatusLineNC = { fg = colors.comment_grey }, -- status lines of not-current windows
  TabLine = { fg = colors.comment_grey }, -- tab pages line, not active tab page label
  TabLineFill = {}, -- tab pages line, where there are no labels
  TabLineSel = { fg = colors.white }, -- tab pages line, active tab page label
  Title = { fg = colors.green }, -- titles for output from ":set all", ":autocmd" etc.
  Visual = { fg = colors.visual_black, bg = colors.visual_grey }, -- Visual mode selection
  VisualNOS = { bg = colors.visual_grey }, -- Visual mode selection when vim is "Not Owning the Selection"
  WarningMsg = { fg = colors.yellow }, -- warning messages
  WildMenu = { fg = colors.black, bg = colors.blue }, -- current match in 'wildmenu' completion
  DiagnosticError = { fg = colors.red }, -- Error
  DiagnosticWarning = { fg = colors.yellow }, -- Warning
  DiagnosticInfo = { fg = colors.blue }, -- Info
  DiagnosticHint = { fg = colors.green }, -- Hint
  DiagnosticDefault = { fg = colors.blue_purple }, -- Test Error
  DiagnosticTest = { fg = colors.purple }, -- Test
  LspInlayHint = { fg = colors.comment_grey }, -- Inlay Hint
  FloatTitle = { fg = colors.white, bg = colors.black }, -- Float title
  FloatBorder = { fg = colors.white, bg = colors.black }, -- Float border
  NormalFloat = { fg = colors.white, bg = colors.cursor_grey }, -- Normal floating window

  dockerfileKeyword = { fg = colors.purple }, -- Dockerfile keywords
  shSet = { fg = colors.cyan }, -- Shell Set
  shSetOption = { fg = colors.white }, -- Shell Set Option
  shStatement = { fg = colors.cyan }, -- Shell Statement
  shFunctionKey = { fg = colors.purple }, -- Shell Function Key
  goDeclaration = { fg = colors.purple }, -- Go Declaration

  -- Plugin Highlighting
  SignifySignAdd = { fg = colors.green },
  SignifySignChange = { fg = colors.yellow },
  SignifySignDelete = { fg = colors.red },

  NeomakeWarningSign = { fg = colors.yellow },
  NeomakeErrorSign = { fg = colors.red },
  NeomakeInfoSign = { fg = colors.blue },

  diffAdded = { fg = colors.green },
  diffRemoved = { fg = colors.red },

  VistaBracket = { fg = colors.purple },
  VistaChildrenNr = { fg = colors.dark_yellow },
  VistaScope = { fg = colors.blue_purple },
  VistaTag = { fg = colors.purple },
  VistaPrefix = { fg = colors.blue_purple },
  VistaParenthesis = { fg = colors.purple },
  VistaColon = { fg = colors.cyan },
  VistaIcon = { fg = colors.cyan },
  VistaLineNr = { fg = colors.comment_grey },
  VistaArgs = { fg = colors.comment_grey },
  VistaKind = { fg = colors.comment_grey },
  VistaScopeKind = { fg = colors.yellow },

  debugBreakpoint = { fg = colors.blue_purple },
  debugPC = { bg = colors.blue_purple, fg = colors.black },

  jediFunction = { bg = colors.white_mask_3, fg = colors.white },
  jediFat = { bg = colors.white_mask_3, fg = colors.blue, bold = true, underline = true },

  -- Git Highlighting
  gitcommitComment = { fg = colors.comment_grey },
  gitcommitUnmerged = { fg = colors.green },
  gitcommitOnBranch = {},
  gitcommitBranch = { fg = colors.purple },
  gitcommitDiscardedType = { fg = colors.red },
  gitcommitSelectedType = { fg = colors.green },
  gitcommitHeader = {},
  gitcommitUntrackedFile = { fg = colors.cyan },
  gitcommitDiscardedFile = { fg = colors.red },
  gitcommitSelectedFile = { fg = colors.green },
  gitcommitUnmergedFile = { fg = colors.yellow },
  gitcommitFile = {},
  gitcommitSummary = { fg = colors.white },
  gitcommitOverflow = { fg = colors.red },

  MiniTablineHidden = { bg = colors.cursor_grey, fg = colors.white },
  MiniTablineVisible = { bg = colors.cursor_grey, fg = colors.white },
  MiniTablineCurrent = { bg = colors.white_mask_3, fg = colors.white },

  MiniTablineModifiedHidden = { bg = colors.cursor_grey, fg = colors.green },
  MiniTablineModifiedVisible = { bg = colors.cursor_grey, fg = colors.green },
  MiniTablineModifiedCurrent = { bg = colors.white_mask_3, fg = colors.green },
}

local function load_highlights(hl_table)
  for group, settings in pairs(hl_table) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

load_highlights(highlights)
load_highlights(require 'theme.treesitter')
load_highlights(require 'theme.leap')
