local colors = require 'custom.theme.colors'

local character = {
  { fg = colors.green },
  {
    special = { fg = colors.blue_purple },
  },
}

local constant = {
  { fg = colors.cyan },
  {
    builtin = { fg = colors.yellow },
    macro = { fg = colors.dark_yellow },
  },
}

local function_ = {
  { fg = colors.blue_purple },
  {
    builtin = { fg = colors.cyan },
    call = { fg = colors.blue },
    macro = { fg = colors.purple, italic = true },
  },
}

local keyword = {
  { fg = colors.red, italic = true },
  {
    function_ = { fg = colors.blue_purple, italic = true },
    operator = { fg = colors.blue_purple },
    return_ = { fg = colors.red },
  },
}

local method = {
  { fg = colors.blue },
  {
    builtin = { fg = colors.cyan }, -- ?? added by copilot
    call = { fg = colors.blue },
  },
}

local parameter = {
  { fg = colors.white, italic = true },
  {
    builtin = { fg = colors.cyan }, -- ?? added by copilot
    reference = { fg = colors.menu_grey },
  },
}

local punctuation = {
  { fg = colors.white },
  {
    bracket = { fg = colors.white },
    delimiter = { fg = colors.white },
    special = { fg = colors.white },
  },
}

local string = {
  { fg = colors.green },
  {
    escape = { fg = colors.comment_grey },
    regex = { fg = colors.white },
    special = { fg = colors.menu_grey },
  },
}

local tag = {
  { fg = colors.light_red },
  {
    attribute = { fg = colors.blue_purple },
    delimiter = { fg = colors.white },
  },
}

local text = {
  { fg = colors.white },
  {
    emphasis = { italic = true },
    environment = { fg = colors.blue_purple },
    literal = { fg = colors.yellow },
    reference = { fg = colors.blue_purple },
    strong = { bold = true },
    title = { fg = colors.yellow, bold = true },
    underline = { underline = true },
    warning = { fg = colors.yellow },
    todo = { fg = colors.purple },
  },
}

local type = {
  { fg = colors.yellow },
  {
    builtin = { fg = colors.yellow },
    qualifier = { fg = colors.yellow },
  },
}

local variable = {
  { fg = colors.white },
  {
    builtin = { fg = colors.yellow },
  },
}

local treesitter = {
  annotation = { fg = colors.yellow },
  attribute = { fg = colors.light_red },
  boolean = { fg = colors.red, italic = true },
  character = character,
  comment = { fg = colors.comment_grey },
  conditional = { fg = colors.purple },
  constant = constant,
  constructor = { fg = colors.white },
  define = { fg = colors.purple },
  exception = { fg = colors.purple },
  field = { fg = colors.cyan },
  float = { fg = colors.dark_yellow },
  ['function'] = function_,
  include = { fg = colors.blue },
  keyword = keyword,
  label = { fg = colors.purple },
  method = method,
  namespace = { fg = colors.blue_purple },
  number = { fg = colors.dark_yellow },
  operator = { fg = colors.white },
  parameter = parameter,
  property = { fg = colors.cyan },
  punctuation = punctuation,
  ['repeat'] = { fg = colors.purple },
  storageclass = { fg = colors.yellow, italic = true },
  string = string,
  symbol = { fg = colors.red },
  tag = tag,
  type = type,
  variable = variable,
}

local function flatten_treesitter_table(t)
  local result = {}

  for key, value in pairs(t) do
    local prefix = '@' .. key

    result[prefix] = value[1]

    if #value == 2 then
      for subkey, subvalue in pairs(value[2]) do
        result[prefix .. '.' .. subkey] = subvalue
      end
    end
  end

  return result
end

return flatten_treesitter_table(treesitter)
