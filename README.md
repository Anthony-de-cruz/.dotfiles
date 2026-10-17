# .dotfiles

Some of my .dotfile setup

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

### TMUX

```sh
mkdir ~/.config/tmux && mkdir ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/.dotfiles/tmux/onedark.tmux ~/.config/tmux/onedark.tmux
```

In tmux, run: `<leader> I`

### Other

```sh
ln -s ~/.dotfiles/waybar ~/.config # Waybar
ln -s ~/.dotfiles/hypr ~/.config # Hyprland

ln -s ~/.dotfiles/kitty ~/.config # Kitty
ln -s ~/.dotfiles/zed ~/.config # Zed
ln -s ~/.dotfiles/spicetify ~/.config # Spicetify

ln -s ~/.dotfiles/ideavim/.ideavimrc ~/.ideavimrc # Ideavim

mkdir ~/.config/git && ln -s ~/.dotfiles/git/.gitconfig ~/.config/git/config # Git
ln -s ~/.dotfiles/nvim ~/.config # Nvim
ln -s ~/.dotfiles/zellij/ ~/.config # Zellij
ln -s ~/.dotfiles/yazi ~/.config # Yazi
ln -s ~/.dotfiles/bat ~/.config # Bat
ln -s ~/.dotfiles/rmpc ~/.config # Rmpc
ln -s ~/.dotfiles/beets/ ~/.config # Beets
```
