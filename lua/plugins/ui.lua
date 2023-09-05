
-- local branch_ticket = require('erochest.ui').branch_ticket

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
  { "ishan9299/nvim-solarized-lua", },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
    },
    opts = {
      sections = {
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        -- lualine_b = {branch_ticket, 'diff', 'diagnostics'},
        lualine_c = {'navic'},
      },
    },
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  { "rcarriga/nvim-notify", },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>zn", "<cmd>TZNarrow<cr>", mode = { "n", "v" }, desc = "Narrow Zen", },
      { "<leader>zf", "<cmd>TZFocus<cr>", mode = "n", desc = "Zen Focus", },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", mode = "n", desc = "Minimalist Zen", },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", mode = "n", desc = "Zen Ataraxis", },
    },
  },
}
