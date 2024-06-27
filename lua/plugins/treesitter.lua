return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = "all",
			ignore_install = { "php", "phpdoc" }, -- List of parsers to ignore installing
			highlight = {
				enable = true,           -- false will disable the whole extension
				-- list of language that will be disabled
				disable = { "css", "lua", "rust" },
			},
			autopairs = {
				enable = true,
			},
			indent = { enable = true, disable = { "python", "css" } },
			rainbow = {
				enable = true,
				-- list of languages you want to disable the plugin for
				-- disable = { "lua" },
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
		})
	end
}
