return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeRefresh",
      "NvimTreeFindFile",
    },
    keys = {
      { "<leader>nt", "<cmd>NvimTreeToggle<CR>", mode = "n", desc = "Toggle the file tree", },
      { "<leader>nf", "<cmd>NvimTreeFindFile<CR>", mode = "n", desc = "Find a file in the file tree", },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({})
      wk.register({
        ["<leader>c"] = { name = "Code" },
        ["<leader>C"] = { name = "Clipboard" },
        ["<leader>d"] = { name = "Code Diagnostic" },
        ["<leader>f"] = { name = "Find" },
        ["<leader>F"] = { name = "Format" },
        ["<leader>g"] = { name = "Go" },
        ["<leader>l"] = { name = "LSP" },
        ["<leader>n"] = { name = "Navigation File Tree" },
        ["<leader>w"] = { name = "Workspace" },
        ["<leader>z"] = { name = "Zen" },
      })
    end,
  },

  {
    'stevearc/aerial.nvim',
    config = function()
      require("aerial").setup({})
      vim.keymap.set('n', '<leader>ct', '<cmd>AerialToggle!<CR>', {desc = "Toggle Aerial"})
    end,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    on_attach = function(bufnr)
      vim.keymap.set("n", "<leader>g{", "<cmd>AerialPrev<cr>", {
        buffer = bufnr,
        desc = "Previous Aerial node",
      })
      vim.keymap.set("n", "<leader>g}", "<cmd>AerialNext<cr>", {
        buffer = bufnr,
        desc = "Next Aerial node",
      })
    end,
  },

  {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup({})
      vim.api.nvim_create_autocmd({"LspAttach"}, {
        pattern = "*",
        callback = function(args)
          -- print("args: ", vim.inspect(args))
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
          end
        end,
      })
    end,
  },

  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat", },
    keys = { "s", "S", },
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}
