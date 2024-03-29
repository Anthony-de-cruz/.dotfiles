-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- LSP Plugins
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	-- Navgiation Plugins
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("HiPhish/nvim-ts-rainbow2")
	use("theprimeagen/harpoon")
	use("christoomey/vim-tmux-navigator")

	-- Tool Plugins
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	})
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("mhartington/formatter.nvim")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Cosmetic Plugins
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})
end)
