return {
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {
					inlay_hints = {
						show_parameter_hints = true,
						highlight = "constant",
					},
					hover_actions = { auto_focus = true },
				},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						-- you can also put keymaps in here
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {
							lens = {
								enable = true,
							},
						},
					},
				},
				-- DAP configuration
				dap = {
					adapter = {
						type = "executable",
						command = "lldb",
						-- name = "rt_lldb",
					},
				},
			}
		end
	},
	{
		'saecki/crates.nvim',
		tag = 'stable',
	},
}
