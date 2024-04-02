# .dotfiles
Some of my .dotfile setup
```sh
❯ git ls-tree -r --name-only HEAD | tree --fromfile -a
.
├── .clang-format
├── git
│   └── .gitconfig
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── lua
│   │   ├── .luarc.json
│   │   ├── main
│   │   │   ├── init.lua
│   │   │   ├── keymap.lua
│   │   │   ├── lazy.lua
│   │   │   └── set.lua
│   │   └── plugins
│   │       ├── alpha-nvim.lua
│   │       ├── harpoon.lua
│   │       ├── lualine.lua
│   │       ├── mason-lspconfig.lua
│   │       ├── neo-tree.lua
│   │       ├── none-ls.lua
│   │       ├── onedark.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       ├── vim-startuptime.lua
│   │       └── vim-tmux-navigator.lua
│   └── README.md
├── nvim_old
│   ├── after
│   │   └── plugin
│   │       ├── colors.lua
│   │       ├── formatter.lua
│   │       ├── fugitive.lua
│   │       ├── gitsigns.lua
│   │       ├── glow.lua
│   │       ├── harpoon.lua
│   │       ├── lsp.lua
│   │       ├── lualine.lua
│   │       ├── mason.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       ├── undotree.lua
│   │       └── whichkey.lua
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

13 directories, 45 files
```

### GIT
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

### ZSH
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

### NVIM
ln -s ~/.dotfiles/nvim/ ~/.config/nvim

### IDEAVIM
ln -s ~/.dotfiles/ideavim/.ideavimrc ~/.ideavimrc

### TMUX
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

### Zellij
ln -s ~/.dotfiles/zellij/ ~/.config/zellij
