return {
    'akinsho/toggleterm.nvim',
    event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require('toggleterm').setup({ 
            open_mapping = [[<c-\>]],
            highlights = highlights,
            direction = 'float'
        })
    end
}
