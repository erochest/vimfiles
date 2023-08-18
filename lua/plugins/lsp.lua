return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, {desc="Open diagnostic float"})
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc="Go to previous error"})
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc="Go to next error"})
            vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, {desc="Set location list from errors"})

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=ev.buf, desc="Go to declaration"})
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=ev.buf, desc="Go to definition"})
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=ev.buf, desc="Hover Tool Tip"})
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=ev.buf, desc="Go to implementation"})
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {buffer=ev.buf, desc="Signature"})
                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {buffer=ev.buf, desc="Add Workspace Folder"})
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {buffer=ev.buf, desc="Remove Workspace Folder"})
                    vim.keymap.set('n', '<leader>wl', function()
                        -- TODO: use telescope here (or move this to telescope, or put it into a utility that uses telescope, or something)
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, {buffer=ev.buf, desc="List Workspace Folders"})
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {buffer=ev.buf, desc="Type Definition"})
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=ev.buf, desc="Rename"})
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {buffer=ev.buf, desc="Code Action"})
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=ev.buf, desc="References"})
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, {buffer=ev.buf, desc="Format"})
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls",
                -- "jedi_language_server",
                "pyright",
                "rust_analyzer",
            },
        },
    },

}
