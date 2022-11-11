return {
	-- rust-tools tools settings
	tools = {
		inlay_hints = {
			show_parameter_hints = true,
			highlight = "constant",
		},
		hover_actions = { auto_focus = true },
	},
	-- rust-tools server settings
	settings = {
		["rust-analyzer"] = {
			lens = {
				enable = true,
			},
		},
	},
	-- rust-tools dap settings
	dap = {
		adapter = {
			type = "executable",
			command = "lldb",
			-- name = "rt_lldb",
		},
	},
}
