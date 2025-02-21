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

        local custom_github_dark_default = require('lualine.themes.github_dark_default')

        -- Set background color to 'None' for multiple modes
        local modes = { 'normal', 'terminal', 'insert', 'visual', 'command' }
        for _, mode in ipairs(modes) do
            custom_github_dark_default[mode].c.bg = 'None'
        end

        require('lualine').setup({
            options = {
                theme = custom_github_dark_default
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
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
            tabline = {
                lualine_a = {}
            }
        })
    end
}
