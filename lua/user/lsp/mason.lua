local servers = {
	"sumneko_lua",
	-- "cssls",
	-- "html",
	-- "tsserver",
	-- "pyright",
	-- "bashls",
	"jsonls",
	"yamlls",
	"rust-analyzer",
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

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		if server == "rust-analyzer" then
			require("rust-tools").setup({
				tools = conf_opts.tools,
				server = {
					on_attach = opts.on_attach,
					capabilities = opts.capabilities,
					settings = conf_opts.settings,
				},
			})
			return
		end

		opts = vim.tbl_deep_extend("force", conf_opts, opts)
		lspconfig[server].setup(opts)
	end
end
