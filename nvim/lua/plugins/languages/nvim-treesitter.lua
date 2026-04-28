local languages = {
	"bash",
	"c",
	"cpp",
    "c_sharp",
	"java",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"python",
	"query",
	"rust",
	"typescript",
	"vim",
	"vimdoc",
	"zig",
}

return {
	"neovim-treesitter/nvim-treesitter",
	branch = "main",
	dependencies = {
		"neovim-treesitter/treesitter-parser-registry",
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		local installed = {}

		for _, language in ipairs(treesitter.get_installed("parsers")) do
			installed[language] = true
		end

		local missing = vim.tbl_filter(function(language)
			return not installed[language]
		end, languages)

		if #missing > 0 then
			if vim.fn.executable("tree-sitter") == 1 then
				treesitter.install(missing, { max_jobs = 4, summary = true })
			else
				vim.notify_once("tree-sitter CLI is required to install parsers", vim.log.levels.WARN)
			end
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
			pattern = languages,
			callback = function(args)
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
