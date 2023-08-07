# Hyprland on NixOS configuration

# Instructions
1. Clone repo into new hidden directory.
```zsh
git clone https://github.com/Kazuto/.dotfiles.git ~/.dotfiles
```

2. Copy or symlink configuration files
```zsh
ln -s $HOME/.dotfiles/nixos/configuration.nix $HOME/nixos/configuration.nix
```

2. Rebuild NixOS
```zsh
sudo nixos-rebuild switch
```
