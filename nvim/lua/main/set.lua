-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrap
vim.opt.wrap = false

-- Remove swap files and have undo tree
vim.opt.swapfile = false 
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Terminal colours
vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Update time
vim.opt.updatetime = 50

-- Vertical rule
vim.opt.colorcolumn = "80"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

-- Netrw
-- netrw is extremely buggy and breaks without the banner
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
