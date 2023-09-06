return {
  'nvim-lua/plenary.nvim',
  "nvim-tree/nvim-web-devicons",
  'MunifTanjim/nui.nvim',

  {
    "jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    cmd = {
      "PossessionSave",
      "PossessionLoad",
      "PossessionRename",
      "PossessionClose",
      "PossessionDelete",
      "PossessionShow",
      "PossessionList",
      "PossessionMigrate",
    },
    opts = {
      commands = {
        save = 'PossessionSave',
        load = 'PossessionLoad',
        rename = 'PossessionRename',
        close = 'PossessionClose',
        delete = 'PossessionDelete',
        show = 'PossessionShow',
        list = 'PossessionList',
        migrate = 'PossessionMigrate',
      },
    },
  },

  {
    "phaazon/hop.nvim",
    config = function()
      local hop = require("hop")
      hop.setup()

      -- More keymaps based on https://github.com/phaazon/hop.nvim/wiki/Commands
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, {remap=true, desc="Hop to next character"})
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, {remap=true, desc="Hop to previous character"})
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, {remap=true, desc="Hop to next character after cursor"})
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, {remap=true, desc="Hop to previous character after cursor"})
    end,
  },

  { "tpope/vim-repeat", },

  { "LhKipp/nvim-nu" },
  -- Need to also install the nu treesitter.

  { "NoahTheDuke/vim-just", },
}
