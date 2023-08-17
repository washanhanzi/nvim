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
	use({ "wbthomason/packer.nvim", branch = "master" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", branch = "master" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", branch = "master" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", tag = "v0.8.0" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", branch = "main" })
	-- nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		branch = "master",
		requires = { "nvim-tree/nvim-web-devicons", branch = "master" },
	})

	use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
	use({ "akinsho/toggleterm.nvim", tag = "v2.7.1" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.7" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	use({ "folke/which-key.nvim" })

	-- Colorschemes
	use({ "catppuccin/nvim", commit = "e695645298320e9714d10897aadee3cb5951567a" })
	use({ "olimorris/onedarkpro.nvim", commit = "05219bc43981109105329428a03fe0ae254e8a12" })
	use("EdenEast/nightfox.nvim")

	-- Cmp
	use({ "hrsh7th/nvim-cmp", branch = "main" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", branch = "main" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v2.0.0" }) --snippet engine

	-- LSP
	use({ "neovim/nvim-lspconfig", branch = "master" }) -- enable LSP
	use({ "williamboman/mason.nvim", tag = "v1.6.1" }) -- simple to use language server installer
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

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Surround
	use({ "kylechui/nvim-surround", tag = "*" })

	-- Leap
	use({ "ggandor/leap.nvim", commit = "847a1dcfb1a3a576860151754d95fb3b0014663e" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" })

	-- multiline
	use({ "mg979/vim-visual-multi", branch = "master" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
