# .dotfiles

Some of my .dotfile setup

### GIT

```sh
mkdir ~/.config/git
ln -s ~/.dotfiles/git/.gitconfig ~/.config/git/config
```

### ZSH

Overwrite onfig

```sh
rm ~/.zshrc && ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
rm ~/.p10k.zsh && ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
rm -r ~/.oh-my-zsh
```

Install ZSH and set as default shell.

```sh
sudo dnf install zsh
chsh -s $(which zsh)
```

Install OMZSH.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install plugins.

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
exec zsh
```

### NVIM

ln -s ~/.dotfiles/nvim ~/.config/nvim

### IDEAVIM

ln -s ~/.dotfiles/ideavim/.ideavimrc ~/.ideavimrc

### TMUX

```sh
mkdir ~/.config/tmux && mkdir ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf
```

In tmux, run: `<leader> I`

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
