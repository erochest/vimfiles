
local branch_ticket = require('erochest.ui').branch_ticket

return {
    { "shaunsingh/nord.nvim", lazy = true, },
    {
        "marko-cerovac/material.nvim",
        lazy = true,
        setup = {
            plugins = {
                "dap",
                -- "dashboard",
                "gitsigns",
                "hop",
                "indent-blankline",
                -- "lspsaga",
                -- "mini",
                "neogit",
                -- "neorg",
                "nvim-cmp",
                "nvim-navic",
                "nvim-tree",
                "nvim-web-devicons",
                -- "sneak",
                "telescope",
                "trouble",
                "which-key",
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "SmiteshP/nvim-navic",
        },
        opts = {
            sections = {
                -- lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_b = {branch_ticket, 'diff', 'diagnostics'},
                lualine_c = {'navic'},
            },
        },
        lazy = false,
    },

  { "lukas-reineke/indent-blankline.nvim", },
}
