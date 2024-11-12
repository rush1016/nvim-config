return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('fzf-lua').setup({
            -- 'max-perf',
            files = {
                prompt = "Files❯ ",
                cwd_prompt = false
            },
            winopts = {
                fullscreen = true
            }
        })
        local fzf = require('fzf-lua')
        vim.keymap.set('n', '<leader>p', fzf.files, { desc = 'Fuzzy Files' })
        vim.keymap.set('n', '<leader>r', fzf.oldfiles, { desc = 'Fuzzy Files' })
        vim.keymap.set('n', '<leader>ff', fzf.live_grep_native, { desc = 'Live Grep' })
        vim.keymap.set('n', '<leader>e', fzf.buffers, { desc = 'Buffers' })
        vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Help Tags' })
        vim.keymap.set('n', '<leader>t', fzf.lsp_live_workspace_symbols, { desc = 'Workspace Symbols' })
        vim.keymap.set('n', '<leader>o', fzf.lsp_document_symbols, { desc = 'Document Symbols' })
        vim.keymap.set('n', '<leader>fb', fzf.blines, { desc = 'Buffer lines' })

        -- Git Maps
        vim.keymap.set('n', '<leader>gb', fzf.git_branches, { desc = 'Git branches' })
        vim.keymap.set('n', '<leader>gs', fzf.git_status, { desc = 'Git status' })
        vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = 'Git commits' })
    end
}
