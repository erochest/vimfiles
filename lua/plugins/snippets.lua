return {
	 {
		"L3MON4D3/LuaSnip",
		version = "2.*",
		keys = {
			{ "<C-K>", function() require("luasnip").expand() end, mode = {"i"}, silent = true, },
			{ "<C-L>", function() require("luasnip").jump( 1) end, mode = {"i", "s"}, silent = true, },
			{ "<C-J>", function() require("luasnip").jump(-1) end, mode = {"i", "s"}, silent = true, },
			{
				"<C-E>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				mode = {"i"}, silent = true,
			},
		},
		config = function()
			require("luasnip").setup({})
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},
}
