return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local project_root = {
            function()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            icon = "",
            cond = hide_in_width,
            separator = '',
        }

        require('lualine').setup({
            options = {
                theme = 'github_dark_default'
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    project_root,
                    {
                        'filename',
                        file_status = true,
                    }
                },
                lualine_x = {'location'},
                lualine_y = {'progress'},
                lualine_z = {'filetype'}
            },
        })
    end
}
