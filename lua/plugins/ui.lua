
return {
	{ "shaunsingh/nord.nvim", lazy = true, },
	{
		"marko-cerovac/material.nvim",
		lazy = true,
		setup = {
			plugins = {
				"dap",
				-- "dashboard",
				-- "gitsigns",
				-- "hop",
				-- "indent-blankline",
				-- "lspsaga",
				-- "mini",
				-- "neogit",
				-- "neorg",
				"nvim-cmp",
				"nvim-navic",
				"nvim-tree",
				"nvim-web-devicons",
				-- "sneak",
				"telescope",
				-- "trouble",
				"which-key",
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		opts = {
			sections = {
				lualine_c = {'navic'},
			},
		},
		lazy = false,
	},

}