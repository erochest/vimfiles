return {
    {
        "github/copilot.vim",
        cmd = { "Copilot", },
        keys = {
            {
                "<leader>co",
                "<cmd>Copilot<CR>",
                mode = "n",
                desc = "Copilot",
            },
        },
    },
    -- {
    --  "zbirenbaum/copilot.lua",
    --  cmd = "Copilot",
    --  event = "InsertEnter",
    -- },
    -- {
    --  "zbirenbaum/copilot-cmp",
    --  dependencies = { "github/copilot.vim", },
    --  config = true,
    -- },
}
