return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"html",
					"cssls",
					--"ts_ls",
					"gopls",
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"jdtls",
				},
				["jdtls"] = function() end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					-- Opt to list sources here, when available in mason.
					"stylua",
					"prettier",
					"black",
					"clang-format",
				},
				automatic_installation = false,
				handlers = {},
			})
		end,
	},
}
