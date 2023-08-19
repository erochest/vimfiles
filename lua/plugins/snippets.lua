return {
     {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        keys = {
            { "<C-K>", function() require("luasnip").expand() end, mode = {"i"}, silent = true, desc = "Expand snippet" },
            { "<C-L>", function() require("luasnip").jump( 1) end, mode = {"i", "s"}, silent = true, desc = "Next snippet expansion" },
            { "<C-J>", function() require("luasnip").jump(-1) end, mode = {"i", "s"}, silent = true, desc = "Previous snippet expansion" },
            {
                "<C-E>",
                function()
                    local ls = require("luasnip")
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end,
                mode = {"i"}, silent = true,
                desc = "Change active choice",
            },
        },
        config = function()
            require("luasnip").setup({})
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    "rafamadriz/friendly-snippets",
}
