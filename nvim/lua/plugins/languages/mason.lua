return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"html",
				"cssls",
				"gopls",
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"csharp_ls",
				"zls",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
