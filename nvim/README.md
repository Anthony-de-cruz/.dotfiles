# Neovim

My Neovim setup as of January 2024

### Package Management

- lazy to manage packages
- mason to manage LSPs and formatters

### LSP

- nvim-lspconfig
- mason-lspconfig

### Completion

- nvim-cmp
- cmp_luasnip
- luasnip
- friendly-snippets
- cmp-nvim-lsp

### Formatting

- none-ls
- mason-null-ls

## Keybinds

##### Commenting

NORMAL MODE

- `gcc` - Toggles the current line using linewise comment
- `gbc` - Toggles the current line using blockwise comment
- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

###### VISUAL MODE

- `gc` - Toggles the region using linewise comment
- `gb` - Toggles the region using blockwise comment

##### Telescope

- <leader>pf : project find | fuzzy find everything
- <leader><C-p> : project find repo | fuzzy find current repo
- <leader>ps : project search | greps the repo

##### Harpoon

- <leader>a : add | add file to the list
- <C-e> : quick menu | toggle quick menu

- <C-h> : nav h | nav to file 1
- <C-t> : nav t | nav to file 2
- <C-n> : nav n | nav to file 3
- <C-s> : nav s | nav to file 4

##### Undotree

- <leader>u : undo-tree | toggle undo-tree
