# .dotfiles
Some of my .dotfile setup

❯ git ls-tree -r --name-only HEAD | tree --fromfile -a
.
├── git
│   └── .gitconfig
├── nvim
│   ├── after
│   │   └── plugin
│   │       ├── colors.lua
│   │       ├── formatter.lua
│   │       ├── fugitive.lua
│   │       ├── gitsigns.lua
│   │       ├── harpoon.lua
│   │       ├── lsp.lua
│   │       ├── lualine.lua
│   │       ├── mason.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       └── undotree.lua
│   ├── .gitignore
│   ├── init.lua
│   ├── keybinds.md
│   └── lua
│       └── main
│           ├── init.lua
│           ├── packer.lua
│           ├── remap.lua
│           └── set.lua
├── README.md
├── tmux
│   └── .tmux.conf
└── zsh
    ├── .p10k.zsh
    └── .zshrc

9 directories, 23 files

### GIT
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

### ZSH
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

### NVIM
ln -s ~/.dotfiles/nvim/ ~/.config/nvim

### TMUX
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

