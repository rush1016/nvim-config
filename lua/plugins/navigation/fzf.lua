return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local fzf = require('fzf-lua')
        local actions = fzf.actions;
        fzf.setup({
            {'max-perf', 'borderless-full'},
            actions = {
                files = {
                    true,
                    ["ctrl-g"]       = actions.toggle_ignore,
                }
            },
            files = {
                cwd_prompt = false,
                cwd_header = true
            },
            winopts = {
                backdrop = 100,
                border = "rounded",
                width = 0.90,
                height = 0.90,
                fullscreen = false,
                preview = {
                    hidden = true,
                    default = 'builtin',
                    horizontal = 'right:50%',
                    vertical = "up:55%",
                    layout = "none",
                }
            },
            fzf_opts = {
                ["--info"] = "inline-right",
                ["--no-separator"] = true,
                ["--layout"] = 'default',
                ["--pointer"] = ' ',
                ["--border"] = 'none',
                ["--scrollbar"] = ' '
            },
            fzf_colors = {
                ["bg"]      = { "bg", "Normal" },
                ["pointer"] = { "bg", "Normal" },
                ["gutter"]  = "-1",
            },
            hls = {
                border = 'none'
            },
            keymap = {
                builtin = {
                    ["<C-d>"] = "preview-down",
                    ["<C-u>"] = "preview-up",
                },
                fzf = {
                    ["ctrl-q"] = "select-all+accept"
                },
            },
            buffers = {
                actions = {
                    ["ctrl-d"]      = false,
                    ["ctrl-x"]      = { fn = actions.buf_del, reload = true },
                },
            }
        })
        vim.keymap.set('n', '<leader>p', fzf.files, { desc = 'Open file' })
        vim.keymap.set('n', '<leader>fc', fzf.resume, { desc = 'Resume last find operation' })
        vim.keymap.set('n', '<leader>ff', fzf.live_grep_native, { desc = 'Find in workspace' })
        vim.keymap.set('n', '<leader>e', fzf.buffers, { desc = 'Active buffers' })
        vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Help Tags' })
        vim.keymap.set('n', '<leader>o', fzf.lsp_document_symbols, { desc = 'Find symbols in document' })
        vim.keymap.set('n', '<leader>t', fzf.lsp_live_workspace_symbols, { desc = 'Find symbols in workspace' })
        vim.keymap.set('n', '<leader>fb', fzf.blines, { desc = 'Find in buffer' })
    end
}
