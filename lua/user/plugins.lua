local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "xiyaowong/fast-cursor-move.nvim", branch = "main" })

	use({ "nvim-lua/plenary.nvim", branch = "master" }) -- Useful lua functions used by lots of plugins

	use({ "akinsho/toggleterm.nvim", tag = "v2.7.1" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })


	-- Cmp
	use({ "hrsh7th/nvim-cmp", branch = "main" })                                          -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })    -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" })      -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", branch = "main" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v2.0.0" }) --snippet engine

	-- LSP
	use({ "neovim/nvim-lspconfig", branch = "master" })      -- enable LSP
	use({ "williamboman/mason.nvim", tag = "v1.6.1" })       -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", tag = "v1.12.0" })
	use({ "jose-elias-alvarez/null-ls.nvim", branch = "main" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "fb83d835eac50baeef49aac20c524a80727db0ac" })

	--debugger
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	-- Rust
	use({ "simrat39/rust-tools.nvim", branch = "master" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.2" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
