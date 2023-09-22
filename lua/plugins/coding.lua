return {
  {
    "tpope/vim-commentary",
    keys = { "gc", "gcc", "gcu", },
    cmd = { "Commentary", },
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

  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    config = true,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>dx", function() require("trouble").toggle() end,
        desc = "Toggle Trouble",
      },
      { "<leader>dw", function() require("trouble").open("workspace_diagnostics") end,
        desc = "Trouble Workspace Diagnostics",
      },
      { "<leader>dd", function() require("trouble").open("document_diagnostics") end,
        desc = "Trouble Document Diagnostics",
      },
      { "<leader>dq", function() require("trouble").open("quickfix") end,
        desc = "Trouble quickfix",
      },
      { "<leader>dl", function() require("trouble").open("loclist") end,
        desc = "Trouble loclist",
      },
      { "gR", function() require("trouble").open("lsp_references") end,
        desc = "Trouble LSP References",
      },
    },
    opts = {},
  },

  { "yorinasub17/vim-terragrunt", },
}
