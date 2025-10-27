return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Default Setups
		local servers = {
			-- "pyright",
			-- "roslyn_ls",
			-- "html",
			-- "cssls",
			-- "ts_ls",
			-- "gopls",
			-- "rust_analyzer",
			-- "omnisharp",
			-- "csharp_ls",
			-- "zls",
		}

		for _, lsp in ipairs(servers) do
			vim.lsp.config[lsp] = { capabilities = capabilities }
			vim.lsp.enable(lsp)
		end

		-- Custom Setups
		vim.lsp.config["lua_ls"] = {
			capabilities = capabilities,
			cmd = { "lua-lsp" },
		}
		vim.lsp.enable("lua_ls")

		-- vim.lsp.enable("clangd")
		-- vim.lsp.config["clangd"] = {
		-- 	capabilities = capabilities,
		-- 	cmd = { "clangd", "--clang-tidy" },
		-- }
		-- vim.lsp.enable("clangd")
		--
		-- vim.lsp.config["roslyn_ls"] = {
		-- 	capabilities = capabilities,
		-- 	--cmd = {
		-- 	--	"Microsoft.CodeAnalysis.LanguageServer",
		-- 	--	"--logLevel",
		-- 	--	"Information",
		-- 	--	"--extensionLogDirectory",
		-- 	--	"/home/anthonydecruz/temp",
		-- 	--},
		-- 	--filetypes = { "cs", "fsharp" },
		-- }
		-- vim.lsp.enable("roslyn_ls")
	end,
}
