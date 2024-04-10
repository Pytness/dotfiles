local gittools = {}

function gittools.restore_file(path)
  os.execute('git restore ' .. path)
end

return gittools
