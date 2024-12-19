local M = {}

local ffi = require 'ffi'

-- Using ffi for directory listing is faster than using Lua's `io.popen` or `os.execute`
-- In this case, with 3 calls to load_plugins, the overhead went from ~5ms to ~1ms
ffi.cdef [[
    typedef struct DIR DIR;

    struct dirent {
        unsigned long  d_ino;      /* inode number */
        unsigned long  d_off;      /* offset to the next dirent */
        unsigned short d_reclen;   /* length of this record */
        unsigned char  d_type;     /* type of file */
        char           d_name[256];/* filename */
    };

    DIR *opendir(const char *name);
    struct dirent *readdir(DIR *dirp);
    int closedir(DIR *dirp);
]]

local function list_dir_iterator(path)
  local dir = ffi.C.opendir(path)

  if dir == nil then
    return nil
  end

  return function()
    local entry
    local name

    repeat
      entry = ffi.C.readdir(dir)
      if entry == nil then
        ffi.C.closedir(dir)
        return nil
      end

      name = ffi.string(entry.d_name)
    until name ~= '.' and name ~= '..'

    return name
    -- end
  end
end

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
  local files = list_dir_iterator(path)

  if not files then
    return plugins
  end

  for file_name in files do
    file_name = file_name:gsub('.lua', '')
    local plugin = require(module_path .. '/' .. file_name)
    table.insert(plugins, plugin)
  end

  return plugins
end

return M
