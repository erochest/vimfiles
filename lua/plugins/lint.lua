return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            lint = require("lint")
            lint.linters_by_ft = {
                json = { "jsonlint", },
                lua = { "luacheck", },
                markdown = { "vale", },
                python = { "flake8", "mypy", "pylint" },
                yaml = { "yamllint", },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
