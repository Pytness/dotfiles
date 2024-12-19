local escape_target = function(target)
  local escapes = {
    [' '] = '%20',
    ['<'] = '%3C',
    ['>'] = '%3E',
    ['#'] = '%23',
    ['%'] = '%25',
    ['+'] = '%2B',
    ['{'] = '%7B',
    ['}'] = '%7D',
    ['|'] = '%7C',
    ['\\'] = '%5C',
    ['^'] = '%5E',
    ['~'] = '%7E',
    ['['] = '%5B',
    [']'] = '%5D',
    ['‘'] = '%60',
    [';'] = '%3B',
    ['/'] = '%2F',
    ['?'] = '%3F',
    [':'] = '%3A',
    ['@'] = '%40',
    ['='] = '%3D',
    ['&'] = '%26',
    ['$'] = '%24',
  }

  return target:gsub('.', escapes)
end

local function google_search()
  local mode = vim.api.nvim_get_mode().mode

  print('mode', mode)

  if mode == 'v' or mode == 'V' or mode == '' then
    vim.cmd 'normal! "sy'
  elseif mode == 'n' then
    vim.cmd 'normal! "syiW'
  end

  local selected_text = vim.fn.getreg 's'

  selected_text = escape_target(selected_text)

  local search_query = 'https://www.google.com/search?q=' .. selected_text

  -- wsl
  if vim.fn.has 'wsl' then
    print('wsl-open ' .. search_query)
    vim.fn.jobstart('wsl-open "' .. search_query .. '"')
  else
    vim.fn.jobstart('xdg-open "' .. search_query .. '"')
  end
end

return {
  { { 'n', 'v' }, 'gs', google_search, { desc = 'Search on google' } },
  { 'n', '<leader>mm', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Toggle markdown preview' } },
  { { 'n', 'v' }, '<leader>ms', '<cmd>!sort<cr>', { desc = 'Sort lines' } },
}
