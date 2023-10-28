# Neovim Keybinds:

<leader> = " "

[bind] : name | description

#### Telescope
- <leader>pf : project find | fuzzy find everything
- <leader><C-p> : project find repo | fuzzy find current repo
- <leader>ps : project search | greps the repo

#### Netrw
- <leader>pv : project view | netrw over the project

#### Harpoon
- <leader>a : add | add file to the list
- <C-e> : quick menu | toggle quick menu

- <C-h> : nav h | nav to file 1
- <C-t> : nav t | nav to file 2
- <C-n> : nav n | nav to file 3
- <C-s> : nav s | nav to file 4


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
