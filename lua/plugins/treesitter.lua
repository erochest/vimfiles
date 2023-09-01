return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                -- add from https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
                ensure_installed = {
                    "css",
                    "html",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                    "graphql",
                    "javascript",
                    "jsonc",
                    "lua",
                    "make",
                    "markdown_inline",
                    "nu",
                    "python",
                    "query",
                    "rust",
                    "todotxt",
                    "toml",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
