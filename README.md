# My macSetup script

# Instructions
1. Clone repo into new hidden directory.
```zsh
# Use SSH (if set up)...
git clone git@github.com:Kazuto/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/Kazuto/dotfiles.git ~/.dotfiles
```

2. Install prerequisites

**macOS**
```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install gum
brew install gum
```

**Ubuntu/Debian**
```sh
# install gum
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
```


2. Run script
```sh
cd ~/.dotfiles/install

chmod +x setup.sh

./setup.sh
```
