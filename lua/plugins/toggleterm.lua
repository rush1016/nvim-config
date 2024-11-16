return {
    'akinsho/toggleterm.nvim',
    event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require('toggleterm').setup({ 
            open_mapping = [[<c-\>]],
            -- highlights = highlights,
            direction = 'float',
            close_on_exit = true,
            float_opts = {
                border = 'curved',
                width = 140,
                height = 30,
                winblend = 0,
            }
        })

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true,  })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end
}
