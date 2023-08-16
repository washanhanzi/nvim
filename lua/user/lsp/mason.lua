local servers = {
  "gopls",
	"lua_ls",
	"jsonls",
	"yamlls",
	"taplo",
	"rust_analyzer",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	-- idk what is this for
	-- server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	-- if config is found in settings folder
	if require_ok then
		-- rust_analyzer specific
		if server == "rust_analyzer" then
			require("rust-tools").setup({
				tools = conf_opts.tools,
				server = {
					on_attach = opts.on_attach,
					capabilities = opts.capabilities,
					settings = conf_opts.settings,
				},
				dap = conf_opts.dap,
			})
			return
		end

		opts = vim.tbl_deep_extend("force", conf_opts, opts)
		lspconfig[server].setup(opts)
	else
		-- if config is not found in settings folder, use default settings
		lspconfig[server].setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end
end
