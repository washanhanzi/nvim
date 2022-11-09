local colorscheme = "onedarkpro"

require("onedarkpro").setup({
	dark_theme = "onedark_dark",
	colors = {
		onedark_dark = {
			comment = "#64dd17",
			functions = "#2bbac5",
			bg = "#181A1F",
		},
	},
})

-- require("nightfox").setup({
-- 	palettes = {
-- 		all = {
-- 			comment = "#0ffc03",
-- 		},
-- 	},
-- 	options = {},
-- })

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
