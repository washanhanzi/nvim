local colorscheme = "onedarkpro"

require("onedarkpro").setup({
	dark_theme = "onedark_dark",
	colors = {
		onedark_dark = {
			comment = "#0ffc03",
		},
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
