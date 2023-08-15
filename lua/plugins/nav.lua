return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeClose",
			"NvimTreeRefresh",
			"NvimTreeFindFile",
		},
		keys = {
			{ "<leader>nt", "<cmd>NvimTreeToggle<CR>", mode = "n", desc = "Toggle the file tree", },
			{ "<leader>nf", "<cmd>NvimTreeFindFile<CR>", mode = "n", desc = "Find a file in the file tree", },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},

	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({})
			vim.api.nvim_create_autocmd({"LspAttach"}, {
				pattern = "*",
				callback = function(args)
					-- print("args: ", vim.inspect(args))
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("nvim-navic").attach(client, bufnr)
				end,
			})
		end,
	},
}
