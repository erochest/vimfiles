return {
    {
        "mhartington/formatter.nvim",
        keys = {
            {
                "<leader>fm",
                "<cmd>Format<CR>",
                mode = "n",
                desc = "Format the current buffer",
            },
            {
                "<leader>fM",
                "<cmd>FormatWrite<CR>",
                mode = "n",
                desc = "Format the current buffer and write it to disk",
            },
        },
        cmd = {
            "Format",
            "FormatWrite",
            "FormatLock",
            "FormatWriteLock",
        },
        event = {
            "BufWritePre",
        },
        config = function()
            formatter = require("formatter")
            formatter.setup({
                logging = false,
                filetype = {
                    ["*"] = {
                        -- "formatter.filetypes.any" defines default configurations for any
                        -- filetype
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    },
                    ["json"] = {
                        require("formatter.filetypes.json").prettier,
                    },
                    ["lua"] = {
                        require("formatter.filetypes.lua").lua_format,
                    },
                    ["markdown"] = {
                        require("formatter.filetypes.markdown").prettier,
                    },
                    ["python"] = {
                        require("formatter.filetypes.python").black,
                        require("formatter.filetypes.python").isort,
                    },
                    ["rust"] = {
                        require("formatter.filetypes.rust").rustfmt,
                    },
                    ["toml"] = {
                        require("formatter.filetypes.toml").prettier,
                    },
                    ["yaml"] = {
                        require("formatter.filetypes.yaml").prettier,
                    },
                },
            })
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                command = "FormatWrite",
            })
        end,
    },

}
