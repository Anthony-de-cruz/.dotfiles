return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		-- lspconfig.ts_ls.setup({
		-- 	capabilities = capabilities,
		-- })
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
		})
		-- lspconfig.omnisharp.setup({
		-- 	capabilities = capabilities,
		-- })
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--clang-tidy",
			},
		})
		lspconfig.zls.setup({
			capabilities = capabilities,
		})
		-- jdtls now being handled by nvim-jdtls
		-- lspconfig.jdtls.setup({
		-- 	capabilities = capabilities,
		-- })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	end,
}
