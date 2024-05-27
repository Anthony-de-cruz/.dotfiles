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
				python = { "black" },
				java = { "clang-format" },
				rust = { "rustfmt" },
				typescript = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
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
	end,
}
