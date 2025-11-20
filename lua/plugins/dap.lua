return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "codelldb" },
		},
		dependencies = {
			{ "mason-org/mason.nvim" },
			"mfussenegger/nvim-dap",
		},
	},
}
