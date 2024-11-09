-- Neotree
vim.keymap.set('n', '<leader>n', ':Neotree toggle<cr>', { silent = true})

-- Close buffer
vim.keymap.set('n', '<leader>w', ' :<C-U>bprevious <bar> bdelete #<CR>', { silent = true })

-- Navigate panes / buffers
vim.keymap.set('n', '<c-j>', '<c-w>j', {})
vim.keymap.set('n', '<c-k>', '<c-w>k', {})
vim.keymap.set('n', '<c-l>', '<c-w>l', {})
vim.keymap.set('n', '<c-h>', '<c-w>h', {})

-- Add new lines
vim.keymap.set('n', 'zj', 'o<Esc>k', {})
vim.keymap.set('n', 'zk', 'O<Esc>j', {})
