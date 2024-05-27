function merge_arrays(...)
  local result = {}
  for _, array in ipairs { ... } do
    for _, value in ipairs(array) do
      table.insert(result, value)
    end
  end
  return result
end

-- Execute a function skiping vim.fn.confirm
function no_confirm_execute(confirm_value, callback)
  local old_confirm = vim.fn.confirm

  vim.fn.confirm = function(_, _, _)
    return confirm_value
  end

  local value = callback()

  vim.fn.confirm = old_confirm
  return value
end
