return {
	"debugloop/telescope-undo.nvim",

	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"debugloop/telescope-undo.nvim",
		},
        cmd = { "Telescope", },
		keys = {
			{ '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Find files', mode = "n", },
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'grep', mode = "n", },
			{ ';', '<cmd>Telescope buffers<cr>', desc = 'Find buffer', mode = "n", },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help pages', mode = "n", },
			{
				'<leader>fs',
				'<cmd>Telescope spell_suggest<cr>',
				desc = 'Spelling suggestions for current word',
				mode = "n",
			},
			{
				'<leader>fz',
				'<cmd>Telescope current_buffer_fuzzy_find<cr>',
				desc = 'Fuzzy find in current buffer',
				mode = "n",
			},
			{
				"<leader>fu",
				"<cmd>Telescope undo<cr>",
				desc = "Undo history",
				mode = "n",
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						-- telescope-undo.nvim config, see below
					},
				},
			})
			require("telescope").load_extension("undo")
		end,
	}
}
