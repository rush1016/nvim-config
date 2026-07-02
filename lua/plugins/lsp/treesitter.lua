return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    config = function ()
        require('nvim-treesitter').setup({
            ensure_installed = {
                'lua', 'vim', 'vimdoc', 'javascript', 'typescript',
                'vue', 'html', 'php', 'go', 'markdown', 'markdown_inline',
                'blade'
            },
            parsers = {
                blade = {
                    install_info = {
                        url = "https://github.com/EmranMR/tree-sitter-blade",
                        files = { "src/parser.c" },
                        branch = "main",
                    },
                    filetype = "blade",
                },
            },
        })

        -- Vue files
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'vue', 'blade' },
            callback = function()
                local parser = vim.treesitter.get_parser(0)
                parser:parse()
                vim.treesitter.start()
            end,
        })
    end
}
