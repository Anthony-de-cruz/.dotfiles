return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- default setups
		local servers = {
			"ruff",
			"pyright",
			-- "roslyn_ls",
			-- "html",
			-- "cssls",
			"ts_ls",
			-- "gopls",
			"rust_analyzer",
			-- "omnisharp",
			-- "csharp_ls",
			-- "zls",
		}

		for _, lsp in ipairs(servers) do
			vim.lsp.config[lsp] = { capabilities = capabilities }
			vim.lsp.enable(lsp)

			-- vim.lsp.config(lsp, { capabilities = capabilities })
			-- vim.lsp.enable(lsp)
		end

		-- custom setups
		vim.lsp.config["lua_ls"] = {
			capabilities = capabilities,
			cmd = { "lua-lsp" },
		}
		vim.lsp.enable("lua_ls")

		-- vim.lsp.config["pyright"] = {
		-- 	capabilities = capabilities,
		-- 	cmd = { "uvx", "pyright" },
		-- }
		-- vim.lsp.enable("pyright")

		-- vim.lsp.config["clangd"] = {
		-- 	capabilities = capabilities,
		-- 	cmd = { "clangd", "--clang-tidy" },
		-- }
		-- vim.lsp.enable("clangd")
		--
		-- vim.lsp.config["roslyn_ls"] = {
		-- 	capabilities = capabilities,
		-- 	--cmd = {
		-- 	--	"microsoft.codeanalysis.languageserver",
		-- 	--	"--loglevel",
		-- 	--	"information",
		-- 	--	"--extensionlogdirectory",
		-- 	--	"/home/anthonydecruz/temp",
		-- 	--},
		-- 	--filetypes = { "cs", "fsharp" },
		-- }
		-- vim.lsp.enable("roslyn_ls")
	end,
}
