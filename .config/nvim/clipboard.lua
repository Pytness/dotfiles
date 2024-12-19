local function yank_to_clipboard(lines)
  local text = table.concat(lines, '\r\n')
  vim.fn.system('win32yank-wsl -i --crlf', text)
end

local function paste_to_clipboard()
  local text = vim.fn.system 'win32yank-wsl -o --lf'
  return text:split '\n'
end

if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'win32yank-wsl',

    copy = {
      ['+'] = yank_to_clipboard,
      ['*'] = yank_to_clipboard,
    },

    paste = {
      ['+'] = paste_to_clipboard,
      ['*'] = paste_to_clipboard,
    },

    cache_enabled = false,
  }
end
