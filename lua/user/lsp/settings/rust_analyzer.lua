return {
	-- rust-tools tools settings
	tools = {
		inlay_hints = {
			highlight = "constant",
		},
	},
  -- rust-tools server.settings
	settings = {
		["rust-analyzer"] = {
			lens = {
				enable = true,
			},
		},
	},
}
