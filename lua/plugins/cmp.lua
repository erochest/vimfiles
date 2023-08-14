return {
	{ "hrsh7th/cmp-nvim-lsp", },
	{ "hrsh7th/cmp-nvim-lua", },
	{ "hrsh7th/cmp-buffer", },
	{ "hrsh7th/cmp-path", },
	{ "hrsh7th/cmp-cmdline", },
	{ "saadparwaiz1/cmp_luasnip", },
	{ "onsails/lspkind.nvim", },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"SmiteshP/nvim-navic",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require('lspkind')

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1, },
					{ name = "nvim_lua", group_index = 1, },
					{ name = "luasnip", group_index = 1, },
				}, {
					{ name = "buffer", group_index = 2, },
					{ name = "path", group_index = 2, },
				}),
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol',
						maxwidth = 50,
						ellipsis_char = '...',
					})
				}
			})

			vim.api.nvim_create_autocmd({
				"BufNewFile",
				"BufRead",
			}, {
				pattern = "*.py",
				callback = function()
					print('starting python language server')
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig").jedi_language_server.setup({
						capabilities = capabilities,
						on_attach = function(client, buffer)
							print('attaching nvim-navic')
							require("nvim-navic").attach(client, buffer)
						end,
					})
				end,
			})
			vim.api.nvim_create_autocmd({
				"BufNewFile",
				"BufRead",
			}, {
				pattern = "*.rs",
				callback = function()
					print('starting rust-analyzer')
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					lspconfig.rust_analyzer.setup({
						capabilities = capabilities,
						on_attach = function(client, buffer)
							print('attaching nvim-navic')
							require("nvim-navic").attach(client, buffer)
						end,
					})
				end,
			})
		end,
	},
}
