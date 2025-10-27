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
			-- 	ensure_installed = {
			-- 		"pyright",
			-- 		"html",
			-- 		"cssls",
			-- 		-- "gopls",
			-- 		"lua_ls",
			-- 		"rust_analyzer",
			-- 		"clangd",
			-- 		-- "csharp_ls",
			-- 		"zls@0.14.0",
			-- 	},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
