return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup()
            -- vim.cmd.colorscheme 'rose-pine'
        end
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
        config = function()
            local options = {
                darken = {
                    floats = false,
                    sidebars = {
                        enable = false,
                        list = {'qf', 'netrw'} -- default is {}
                    }
                }
            }
            require('github-theme').setup({ options = options })

            vim.cmd.colorscheme 'github_dark_default'
            vim.cmd("highlight Normal guibg=#0d1118")

        end,
    }
}
