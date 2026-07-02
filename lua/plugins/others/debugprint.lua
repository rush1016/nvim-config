return {
    "andrewferrier/debugprint.nvim",

    -- opts = { … },

    version = "*", -- Remove if you DON'T want to use the stable version
    config = function()
        require("debugprint").setup()

        vim.keymap.set('n', '<leader>dd', ":Debugprint delete<CR>", { silent = true })
        vim.keymap.set('n', '<leader>df', ":Debugprint search<CR>", { silent = true })
        vim.keymap.set('n', '<leader>dc', ":Debugprint commenttoggle<CR>", { silent = true })
        vim.keymap.set('n', '<leader>dr', ":Debugprint resetcounter<CR>", { silent = true })
    end,
}
