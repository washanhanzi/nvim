return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 200
	end,
	opts = {
		mode = { n = true }, -- NORMAL mode
		prefix = "<leader>",
		delay = 200,
		preset = "modern",
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			-- presets = {
			-- 	operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			-- 	motions = true, -- adds help for motions
			-- 	text_objects = true, -- help for text objects triggered after entering an operator
			-- 	windows = true, -- default bindings on <c-w>
			-- 	nav = true, -- misc bindings to work with windows
			-- 	z = true, -- bindings for folds, spelling and others prefixed with z
			-- 	g = true, -- bindings for prefixed with g
			-- },
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
	},
	-- config = function()
	-- 	local opts = {
	-- 		mode = "n", -- NORMAL mode
	-- 		prefix = "<leader>",
	-- 		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	-- 		silent = true, -- use `silent` when creating keymaps
	-- 		noremap = true, -- use `noremap` when creating keymaps
	-- 		nowait = true, -- use `nowait` when creating keymaps
	-- 	}

	-- 	local mappings = {
	-- 		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	-- 		["b"] = {
	-- 			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	-- 			"Buffers",
	-- 		},
	-- 		["c"] = { "<cmd>w!|Bdelete!<CR>", "Close Buffer" },
	-- 		["n"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- 		["f"] = {
	-- 			"<cmd>lua require('fzf-lua').files()<CR>",
	-- 			"Find files",
	-- 		},
	-- 		["F"] = { "<cmd>lua require('fzf-lua').live_grep()<CR>", "Find Text" },
	-- 		-- ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	-- 		p = {
	-- 			name = "Packer",
	-- 			c = { "<cmd>PackerCompile<cr>", "Compile" },
	-- 			i = { "<cmd>PackerInstall<cr>", "Install" },
	-- 			s = { "<cmd>PackerSync<cr>", "Sync" },
	-- 			S = { "<cmd>PackerStatus<cr>", "Status" },
	-- 			u = { "<cmd>PackerUpdate<cr>", "Update" },
	-- 		},

	-- 		g = {
	-- 			name = "Git",
	-- 			g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	-- 			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	-- 			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	-- 			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
	-- 			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	-- 			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	-- 			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	-- 			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	-- 			u = {
	-- 				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
	-- 				"Undo Stage Hunk",
	-- 			},
	-- 			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	-- 			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	-- 			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	-- 			d = {
	-- 				"<cmd>Gitsigns diffthis HEAD<cr>",
	-- 				"Diff",
	-- 			},
	-- 		},

	-- 		l = {
	-- 			name = "LSP",
	-- 			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	-- 			d = {
	-- 				"<cmd>Telescope diagnostics bufnr=0<cr>",
	-- 				"Document Diagnostics",
	-- 			},
	-- 			w = {
	-- 				"<cmd>Telescope diagnostics<cr>",
	-- 				"Workspace Diagnostics",
	-- 			},
	-- 			f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
	-- 			i = { "<cmd>LspInfo<cr>", "Info" },
	-- 			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	-- 			j = {
	-- 				"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
	-- 				"Next Diagnostic",
	-- 			},
	-- 			k = {
	-- 				"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
	-- 				"Prev Diagnostic",
	-- 			},
	-- 			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	-- 			q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	-- 			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- 			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	-- 			S = {
	-- 				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	-- 				"Workspace Symbols",
	-- 			},
	-- 		},
	-- 		s = {
	-- 			name = "Search",
	-- 			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	-- 			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	-- 			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	-- 			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	-- 			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	-- 			R = { "<cmd>Telescope registers<cr>", "Registers" },
	-- 			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	-- 			C = { "<cmd>Telescope commands<cr>", "Commands" },
	-- 		},

	-- 		t = {
	-- 			name = "Terminal",
	-- 			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	-- 			t = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	-- 			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- 		},
	-- 	}
	-- 	local wk = require("which-key")
	-- 	wk.register(mappings, opts)
	-- end,
	keys = {
		{ "<leader>w",  "<cmd>w!<CR>",                            desc = "Save" },
		{ "<leader>q",  "<cmd>q!<CR>",                            desc = "Quit" },
		{ "<leader>e",  "<cmd>NvimTreeToggle<cr>",                desc = "Explorer" },
		{ "<leader>l",  group = "lsp" }, -- group
		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
	},
}
