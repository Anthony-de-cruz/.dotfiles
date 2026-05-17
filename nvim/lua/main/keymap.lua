-- Plugin specific keybinds should go in their respective config files
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw
-- Replaced with Neo-Tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Set cursor to middle when <C-d/u>
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Up

-- Set cursor to middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't copy when pasting over
vim.keymap.set("x", "<leader>p", '"_dP')

-- Same idea but for deleting
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Diagnostics
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
