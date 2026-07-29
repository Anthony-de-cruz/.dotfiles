return {
	"tomstolarczuk/rider.nvim",
	config = function()
		require("rider").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = {
					rider = {},
					all = {},
				},
			},
			overrides = function()
				return {
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
					FoldColumn = { bg = "NONE" },
					GitSignsAdd = { bg = "NONE" },
					GitSignsChange = { bg = "NONE" },
					GitSignsDelete = { bg = "NONE" },
				}
			end,
		})
		--vim.cmd("colorscheme rider")
	end,
}
