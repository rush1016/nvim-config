return {
    {
        -- Autoclose pairs
        'echasnovski/mini.pairs',
        version = '*',
        config = function()
            require('mini.pairs').setup()
        end
    },
    {
        -- Better selection of closed pairs
        'echasnovski/mini.ai',
        version = '*',
        config = function()
            require('mini.ai').setup()
        end
    }
}

