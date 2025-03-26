function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "ModeMsg", { bg = "none" })
end

return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false
                }
            })

            ColorMyPencils()
        end
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require('github-theme').setup({
                specs = {
                    github_dark_default = {
                        bg0 = '#000000',
                        bg1 = '#000000',
                        bg2 = '#000000',
                        bg3 = '#000000',
                        bg4 = '#000000',
                    }
                },
                darken = {
                    floats = true,
                    sidebars = {
                        enable = false,
                        list = {'qf', 'netrw'}
                    }
                }
             })

            ColorMyPencils('github_dark_default')
        end,
    },
    {
        'Mofiqul/vscode.nvim',
        name = 'vscode',
        config = function()
            require('vscode').setup({
                transparent = true
            })
            -- ColorMyPencils('vscode')
        end
    }
}
