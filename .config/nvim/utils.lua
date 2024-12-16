local M = {}

M.merge_arrays = function(...)
  local result = {}
  for _, array in ipairs { ... } do
    for _, value in ipairs(array) do
      table.insert(result, value)
    end
  end
  return result
end

-- Execute a function skiping vim.fn.confirm
M.no_confirm_execute = function(confirm_value, callback)
  local old_confirm = vim.fn.confirm

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.fn.confirm = function(_, _, _)
    return confirm_value
  end

  local value = callback()

  vim.fn.confirm = old_confirm
  return value
end

-- @param module_path: string - Module path to load plugins from in the form of `path.to.module`
M.load_plugins = function(module_path)
  local plugins = {}

  local path = vim.fn.stdpath 'config' .. '/' .. module_path:gsub('%.', '/')
  local files = io.popen('ls ' .. path)

  if not files then
    return plugins
  end

  for file_name in files:lines() do
    file_name = file_name:gsub('.lua', '')
    local plugin = require(module_path .. '/' .. file_name)
    table.insert(plugins, plugin)
  end

  return plugins
end

return M
