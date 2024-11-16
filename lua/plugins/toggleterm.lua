return {
    'akinsho/toggleterm.nvim',
    event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require('toggleterm').setup({ 
            open_mapping = [[<c-\>]],
            -- highlights = highlights,
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = 120,
                height = 25,
                winblend = 0,
            }
        })

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end
}
