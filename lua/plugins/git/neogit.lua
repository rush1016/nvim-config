return {
    "NeogitOrg/neogit",
    dependencies = {
        "sindrets/diffview.nvim",        -- optional
        "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<cmd>Neogit kind=split_below<cr>", desc = "Show Neogit UI" }
    }
}
