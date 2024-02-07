-- This is for generic vim configurations
-- Plugin specific configurations should go in their respective config files

-- ---------------------------- System ---------------------------- --
-- Remove swap files and have undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Update time
vim.opt.updatetime = 50

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Terminal colours
vim.opt.termguicolors = true

-- Netrw
-- netrw is extremely buggy and breaks without the banner
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- ---------------------------- Editor ---------------------------- --
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

-- Vertical rule
vim.opt.colorcolumn = "80"

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
