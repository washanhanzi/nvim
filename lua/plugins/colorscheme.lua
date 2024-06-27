return {
	{ "catppuccin/nvim",        name = "catppuccin", lazy = true },
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				dark_theme = "onedark_dark",
				colors = {
					onedark_dark = {
						comment = "#64dd17",
						functions = "#2bbac5",
						bg = "#181A1F",
					},
				},
				options = {
					transparency = true
				}
			})
			vim.cmd("colorscheme onedark_dark")
		end

	},
	{ "EdenEast/nightfox.nvim", lazy = true },
}
