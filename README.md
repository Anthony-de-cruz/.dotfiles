# .dotfiles

Some of my .dotfile setup

### GIT

mkdir ~/.config/git
ln -s ~/.dotfiles/git/.gitconfig ~/.config/git/config

### ZSH

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

### NVIM

ln -s ~/.dotfiles/nvim/main ~/.config/nvim

### IDEAVIM

ln -s ~/.dotfiles/ideavim/.ideavimrc ~/.ideavimrc

### TMUX

mkdir ~/.config/tmux && mkdir ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf

### Zellij

ln -s ~/.dotfiles/zellij/ ~/.config/zellij

### Spicetify

ln -s ~/.dotfiles/spicetify/ ~/.config/spicetify

### Kitty

ln -s ~/.dotfiles/kitty/ ~/.config/

### Hypr

ln -s ~/.dotfiles/hypr/ ~/.config/

### Waybar

ln -s ~/.dotfiles/waybar/ ~/.config/

### Bat

ln -s ~/.dotfiles/bat/ ~/.config/
