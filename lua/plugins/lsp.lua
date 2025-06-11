return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "codelldb" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	-- {
	-- 	'folke/lazydev.nvim',
	-- 	-- file type
	-- 	ft = 'lua',
	-- 	opts = {
	-- 		library = {
	-- 			-- See the configuration section for more details
	-- 			-- Load luvit types when the `vim.uv` word is found
	-- 			{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
	-- 		},
	-- 	},
	-- },
	-- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	-- {
	-- 	'neovim/nvim-lspconfig',
	-- 	event = 'LazyFile',
	-- 	dependencies = {
	-- 		'mfussenegger/nvim-jdtls',
	-- 		-- 'mrcjkb/rustaceanvim',
	-- 		'nvimtools/none-ls.nvim',
	-- 		-- 'alaviss/nim.nvim',
	-- 		{
	-- 			'pmizio/typescript-tools.nvim',
	-- 			dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	-- 			opts = {
	-- 				settings = {
	-- 					tsserver_file_preferences = {
	-- 						includeInlayParameterNameHints = 'all',
	-- 						includeCompletionsForModuleExports = true,
	-- 						quotePreference = 'auto',
	-- 					},
	-- 					tsserver_format_options = {
	-- 						allowIncompleteCompletions = false,
	-- 						allowRenameOfImportPath = false,
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			'mrcjkb/haskell-tools.nvim',
	-- 			version = '^3', -- Recommended
	-- 			lazy = false, -- This plugin is already lazy
	-- 		},
	-- 		{
	-- 			'https://git.sr.ht/~p00f/clangd_extensions.nvim',
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local lspconfig = require('lspconfig')
	-- 		-- lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
	-- 		--   if config.name == 'lua_ls' then
	-- 		--     -- workaround for nvim's incorrect handling of scopes in the workspace/configuration handler
	-- 		--     -- https://github.com/folke/neodev.nvim/issues/41
	-- 		--     -- https://github.com/LuaLS/lua-language-server/issues/1089
	-- 		--     -- https://github.com/LuaLS/lua-language-server/issues/1596
	-- 		--     config.handlers = vim.tbl_extend('error', {}, config.handlers)
	-- 		--     config.handlers['workspace/configuration'] = function(...)
	-- 		--       local _, result, ctx = ...
	-- 		--       local client_id = ctx.client_id
	-- 		--       local client = vim.lsp.get_client_by_id(client_id)
	-- 		--       if client and client.workspace_folders and #client.workspace_folders then
	-- 		--         if result.items and #result.items > 0 then
	-- 		--           if not result.items[1].scopeUri then return vim.tbl_map(function(_) return nil end, result.items) end
	-- 		--         end
	-- 		--       end
	-- 		--
	-- 		--       return vim.lsp.handlers['workspace/configuration'](...)
	-- 		--     end
	-- 		--   end
	-- 		-- end)
	-- 		local handlers = {
	-- 			function(ls) lspconfig[ls].setup(require('user.lsp.configs')[ls]) end,
	-- 			rust_analyzer = function() end, -- use rustaceanvim
	-- 			jdtls = function() end, -- use nvim-jdtls
	-- 			tsserver = function() end, -- use typescript-tools
	-- 			hls = function() end, -- use haskell-tools
	-- 		}
	-- 		-- if vim.fn.executable('ccls') == 1 then
	-- 		--   handlers.clangd = function() end
	-- 		--   require('lspconfig').ccls.setup({})
	-- 		-- end
	-- 		require('mason-lspconfig').setup({
	-- 			ensure_installed = {
	-- 				'clangd',
	-- 				'lua_ls',
	-- 				'rust_analyzer',
	-- 				'marksman',
	-- 				'jdtls',
	-- 				'powershell_es',
	-- 				'ltex',
	-- 				'clangd',
	-- 			},
	-- 			handlers = handlers,
	-- 		})
	-- 		local null_ls = require('null-ls')
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				null_ls.builtins.code_actions.gitrebase,
	-- 				null_ls.builtins.hover.dictionary,
	-- 				null_ls.builtins.hover.printenv,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
