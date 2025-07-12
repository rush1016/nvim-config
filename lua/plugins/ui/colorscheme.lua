function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "ModeMsg", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })

    local ref_hl = vim.api.nvim_get_hl(0, { name = "@keyword", link = false })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = ref_hl.fg, bg = "#2e2e2e" })
end

vim.api.nvim_create_user_command(
    'ColorMyPencils',
    function(opts)
        local color = opts.args ~= '' and opts.args or nil
        ColorMyPencils(color)
    end,
    { nargs = '?' }
)
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

            -- ColorMyPencils("rose-pine")
        end
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require('github-theme').setup({
                darken = {
                    floats = true,
                    sidebars = {
                        enable = false,
                        list = {'qf', 'netrw'}
                    }
                }
             })

            ColorMyPencils()
        end,
    },
    {
        'Mofiqul/vscode.nvim',
        name = 'vscode',
        config = function()
            ColorMyPencils("vscode")
        end
    },
    {
        'metalelf0/base16-black-metal-scheme'
    }
}
