return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				-- Use a sub-list to run only the first available formatter
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "dotnet format" },
				python = { "black" },
				java = { "clang-format" },
				rust = { "rustfmt" },
				go = { "gofmt", "goimports-revised", "golines" },
				typescript = { { "prettierd", "prettier", stop_after_first = true } },
				javascript = { { "prettierd", "prettier", stop_after_first = true } },
				json = { { "prettierd", "prettier", stop_after_first = true } },
				html = { { "prettierd", "prettier", stop_after_first = true } },
				css = { { "prettierd", "prettier", stop_after_first = true } },
				scss = { { "prettierd", "prettier", stop_after_first = true } },
				markdown = { { "prettierd", "prettier", stop_after_first = true } },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
			-- Use the "*" filetype to run formatters on all filetypes.
			-- ["*"] = { "codespell" },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = { "trim_whitespace" },
		})
		require("conform").formatters.golines = {
			prepend_args = {
				"-m",
				"80",
				"-t",
				"8",
			},
		}
	end,
}
