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
                border = 'single',
                width = 120,
                height = 25,
            }
        })
    end
}
