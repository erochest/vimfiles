
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
				-- "nvim-navic",
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
		setup = {
			options = {
				-- theme = "nord",
				theme = "auto",
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location', 'navic'},
			},
		},
		lazy = false,
	},

}
