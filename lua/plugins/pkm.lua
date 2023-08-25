
-- https://github.com/epwalsh/obsidian.nvim
-- TODO: sniff out all my vaults here, or set them from an env var

return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    -- event = { "BufReadPre path/to/my-vault/**.md" },

    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      -- dir = "~/my-vault",  -- no need to call 'vim.fn.expand' here

      -- see below for full list of options 👇
    },
  },
}
