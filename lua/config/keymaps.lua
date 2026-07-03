-- Close buffer
vim.keymap.set('n', '<leader>w', ' :<C-U>bprevious <bar> bdelete #<CR>', { silent = true, desc = 'Close buffer' })
vim.keymap.set("n", "Q", "<nop>")
-- Move highlighted lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', '>', ">gv", { silent = true })
vim.keymap.set('v', '<', "<gv", { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Auto center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('n', 'n', 'nzzzv', { silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { silent = true })

-- Add new lines
vim.keymap.set('i', '<C-j>', '<Esc>o', { silent = true })
vim.keymap.set('i', '<C-k>', '<Esc>O', { silent = true })
vim.keymap.set('i', '<C-CR>', '<Esc>o', { silent = true })
vim.keymap.set('i', '<C-S-CR>', '<Esc>O', { silent = true })

-- Beginning or end of selection
vim.keymap.set('v', '<S-i>', '<esc>`<i', { noremap = true })
vim.keymap.set('v', '<S-a>', '<esc>`>a', { noremap = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

vim.keymap.set('n', '\\r', function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative number' })
vim.keymap.set('n', '\\n', function()
    vim.wo.number = not vim.wo.number
end, { desc = 'Toggle relative number' })

vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>")

vim.keymap.set('n', '<Leader>ch', function()
  local line = vim.fn.line('.')
  local commit_hash = vim.fn.system(
      string.format("git blame -L %d,%d --show-number %s | awk '{print $1}'", line, line, vim.fn.expand('%'))
  )
  commit_hash = vim.fn.trim(commit_hash)
  vim.fn.setreg('+', commit_hash)
end, {silent = true})

vim.keymap.set('n', '<Leader>cd', function()
    vim.fn.setreg('+', vim.fn.fnamemodify(vim.fn.expand('%'), ":."))
end, { silent = true })

vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = "Show diagnostics" })

vim.keymap.set('n', '<leader>q', function()
  local has_qf = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      has_qf = true
      break
    end
  end
  if has_qf then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { silent = true })

