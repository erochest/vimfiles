return {
    {
        "tpope/vim-commentary",
        keys = { "gc", "gcc", "gcu", },
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        keys = {
            { "<leader>cg", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
        config = true,
    },
}
