
return {
    { "shaunsingh/nord.nvim", lazy = true, },
    {
        "marko-cerovac/material.nvim",
        lazy = true,
        setup = {
            plugins = {
                "dap",
                -- "dashboard",
                -- "gitsigns",
                -- "hop",
                -- "indent-blankline",
                -- "lspsaga",
                -- "mini",
                -- "neogit",
                -- "neorg",
                "nvim-cmp",
                "nvim-navic",
                "nvim-tree",
                "nvim-web-devicons",
                -- "sneak",
                "telescope",
                -- "trouble",
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
                -- this is the default for section b
                -- i want to change it to look for the branch, and if it's contains "CODE-\d+" then only show the number
                -- https://github.com/nvim-lualine/lualine.nvim
                -- lualine_b = {'branch', 'diff', 'diagnostics'},

                lualine_c = {'navic'},
            },
        },
        lazy = false,
    },

  { "lukas-reineke/indent-blankline.nvim", },
}
