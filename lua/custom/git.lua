local M = {}

function M.get_commit_hash_for_current_line()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%')
  local cmd = string.format("git blame -L %d,%d --show-name -- %s | awk '{print $1}'", line, line, file)
  local hash = vim.fn.trim(vim.fn.system(cmd))

  if hash == "" or hash == "^" then
    return nil
  end

  return hash
end

return M
