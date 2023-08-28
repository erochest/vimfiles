
-- https://github.com/epwalsh/obsidian.nvim
-- TODO: sniff out all my vaults here, or set them from an env var
--
-- More resources
-- https://github.com/arakkkkk/kanban.nvim
-- https://lib.rs/crates/rust-kanban
-- https://neovimcraft.com/plugin/nvim-neorg/neorg/index.html
-- https://news.ycombinator.com/item?id=17547278
-- https://www.reddit.com/r/neovim/comments/tvej9t/kabmat_a_tui_program_for_managing_kanban_boards/
-- https://github.com/PlankCipher/kabmat
-- https://github.com/epwalsh/obsidian.nvim/issues
-- https://github.com/epwalsh/obsidian.nvim/issues/170
-- https://github.com/epwalsh/obsidian.nvim/issues/128
-- https://github.com/epwalsh/obsidian.nvim/issues/126
-- https://github.com/epwalsh/obsidian.nvim/issues/115
-- https://github.com/epwalsh/obsidian.nvim/issues/88

local vault_locations = {
  "~/Dropbox/g",
  "~/Dropbox/n/omni",
  "~/Dropbox/garden",
}

local function find_vault()
  for _, vault in pairs(vault_locations) do
    local vault = vim.fn.expand(vault)
    if vim.fn.isdirectory(vault) then
      return vault
    end
  end
  return nil
end

local vault = find_vault()

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
      dir = vault,

      completion = {
        nvim_cmp = true,
        new_notes_location = "currentdir",
      },

      -- mappings = {
      --   ["gf"] = require("obsidian.mapping").gf_passthrough(),
      -- },

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },

      -- Optional, customize the backlinks interface.
      backlinks = {
        -- The default height of the backlinks pane.
        height = 10,
        -- Whether or not to wrap lines.
        wrap = true,
      },
    },
  },
}
