return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('fzf-lua').setup({
            files = {
                prompt = "Files❯ ",
                cwd_prompt = false
            },
            winopts = {
                backdrop = 100,
                width = 0.90,
                height = 0.80,
                preview = {
                    horizontal = 'right:45%',
                    vertical = "up:55%",
                    layout = "horizontal",
                }
            },
            keymap = {
                builtin = {
                    ["<C-d>"] = "preview-down",
                    ["<C-u>"] = "preview-up",
                },
                fzf = {
                    ["ctrl-q"] = "select-all+accept"
                }
            }
        })
        local fzf = require('fzf-lua')
        vim.keymap.set('n', '<leader>p', fzf.files, { desc = 'Open file' })
        vim.keymap.set('n', '<leader>r', fzf.oldfiles, { desc = 'Recently Opened Files' })
        vim.keymap.set('n', '<leader>ff', fzf.live_grep_native, { desc = 'Find in workspace' })
        vim.keymap.set('n', '<leader>e', fzf.buffers, { desc = 'Active buffers' })
        vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Help Tags' })
        vim.keymap.set('n', '<leader>t', fzf.lsp_live_workspace_symbols, { desc = 'Workspace Symbols' })
        vim.keymap.set('n', '<leader>o', fzf.lsp_document_symbols, { desc = 'Document Symbols' })
        vim.keymap.set('n', '<leader>fb', fzf.blines, { desc = 'Buffer lines' })

        -- Git Maps
        vim.keymap.set('n', '<leader>gb', fzf.git_branches, { desc = 'Git branches' })
        vim.keymap.set('n', '<leader>gs', fzf.git_status, { desc = 'Git status' })
        vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = 'Git commit options' })
    end
}
