return {
	'nvim-lua/plenary.nvim',
	"nvim-tree/nvim-web-devicons",
	'MunifTanjim/nui.nvim',

	{
		"jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
		cmd = {
			"PossessionSave",
			"PossessionLoad",
			"PossessionRename",
			"PossessionClose",
			"PossessionDelete",
			"PossessionShow",
			"PossessionList",
			"PossessionMigrate",
		},
	},

}
