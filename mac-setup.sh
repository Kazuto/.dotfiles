email="mail@kazuto.de"

ssh-keygen -t rsa -b 4096 -C $email
ssh-add -K ~/.ssh/id_rsa
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
ssh-keyscan -t rsa github.lab >> ~/.ssh/known_hosts
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/keys
notification "Add your SSH key to Github (copied into the clipboard)"

############################
#                          #
# Utils to run this script #
#     (needed order)       #
#                          #
############################

#
# Xcode Command Line Tools
#
# https://developer.apple.com/xcode
#
xcode-select --install

#
# Brew
#
# https://brew.sh
#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
brew analytics off

#
# Dockutil
#
brew install dockutil

#
# Duti
#
# https://github.com/moretension/duti
#
brew install duti

#
# nvm + node.js + npm cli
#
# https://github.com/nvm-sh/nvm
# https://github.com/nodejs/node
# https://github.com/npm/cli
#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash #don't use brew
nvm install v19.8.1
npm i -g npm@latest

#
# wget
#
# https://www.gnu.org/software/wget
#
brew install wget

###########################
#                         #
# Top Helper Applications #
#                         #
###########################

#
# Alfred
#
brew install --cask alfred

#
# Alt-Tab
#
brew install --cask alt-tab

#
# Bartender
#
brew install --cask bartender

########################
#                      #
# Applications Cleanup #
#                      #
########################

#
# Garage Band
#
sudo rm -rf /Applications/GarageBand.app

#
# iMovie
#
sudo rm -rf /Applications/iMovie.app

#
# Keynote
#
sudo rm -rf /Applications/Keynote.app
dockutil --remove 'Keynote' --allhomes

#
# Numbers
#
sudo rm -rf /Applications/Numbers.app
dockutil --remove 'Numbers' --allhomes

#
# Pages
#
sudo rm -rf /Applications/Pages.app
dockutil --remove 'Pages' --allhomes

################
#              #
# Dock Cleanup #
#              #
################

#
# App Store
#
dockutil --remove 'App Store' --allhomes

#
# Calendar
#
dockutil --remove 'Calendar' --allhomes

#
# Contacts
#
dockutil --remove 'Contacts' --allhomes

#
# Facetime
#
dockutil --remove 'FaceTime' --allhomes

#
# Launchpad
#
dockutil --remove 'Launchpad' --allhomes

#
# Mail
#
dockutil --remove 'Mail' --allhomes

#
# Maps
#
dockutil --remove 'Maps' --allhomes

#
# Messages
#
dockutil --remove 'Messages' --allhomes

#
# Music
#
dockutil --remove 'Music' --allhomes

#
# News
#
dockutil --remove 'News' --allhomes

#
# Notes
#
dockutil --remove 'Notes' --allhomes

#
# Photos
#
dockutil --remove 'Photos' --allhomes

#
# Podcasts
#
dockutil --remove 'Podcasts' --allhomes

#
# Reminders
#
dockutil --remove 'Reminders' --allhomes

#
# Safari
#
dockutil --remove 'Safari' --allhomes

#
# System Preferences
#
dockutil --remove 'System Preferences' --allhomes

#
# TV
#
dockutil --remove 'TV' --allhomes

#####################
#                   #
# OS Configurations #
#                   #
#####################

#
# Dock - Show recent applications in Dock
#
defaults write com.apple.dock show-recents -bool false

#
# Finder - Show all filename extensions
#
defaults write -g AppleShowAllExtensions -bool true

#
# Finder - Show these items on the desktop - CDs, DVDs, and iPods
#
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

#
# Finder - Show these items on the desktop - Connected servers
#
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

#
# Finder - Show these items on the desktop - External disks
#
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

#
# Finder - Show these items on the desktop - Hard disks
#
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

#
# Finder - Sort By - Name
defaults write -g com.apple.finder FXArrangeGroupViewBy -string "Name"

#
# Kill Finder, Dock & SystemUIServer for settings to be applied
#
killall Finder
killall Dock
killall SystemUIServer


#####################
#                   #
# Main applications #
#                   #
#####################

#
# Bitwarden
#
# https://bitwarden.com/
#
brew install --cask bitwarden
loginitems -a "Bitwarden"

#
# Brave Browser
#
# https://github.com/brave
#
brew install --cask brave-browser
dockutil --add "/Applications/Brave Browser.app" --position 2 --allhomes
loginitems -a "Brave Browser"
defaults write com.brave.Browser ExternalProtocolDialogShowAlwaysOpenCheckbox -bool true
defaults write com.brave.Browser DisablePrintPreview -bool true

#
# Commitizen
#
# https://commitizen-tools.github.io/commitizen/
#
brew install commitizen

#
# iTerm2
#
# https://iterm2.com
#
brew install --cask iterm2

# Oh My Zsh
#
# https://github.com/ohmyzsh/ohmyzsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#
# tmux
#
# https://github.com/tmux/tmux
#
brew install tmux

#
# tmuxifier
#
# https://github.com/jimeh/tmuxifier
#
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

#
# Yabai
#
# https://github.com/koekeishiya/yabai
#
brew install koekeishiya/formulae/yabai

#
# skhd
#
# https://github.com/koekeishiya/skhd
#
brew install koekeishiya/formulae/skhd

#
# Slack
#
# https://slack.com
#
brew install --cask slack
dockutil --add /Applications/Slack.app/ --allhomes

#
# Spotify
#
brew install --cask spotify
dockutil --add /Applications/Spotify.app --allhomes

#
# Telegram
#
brew install --cask telegram
dockutil --add /Applications/Telegram.app --allhomes

#
# TG Pro
#
brew install --cask tg-pro
loginitems -a "TG Pro"

#
# Vanilla
#
brew install --cask vanilla
loginitems -a "Vanilla"

#
# Visual Studio Code
#
brew install --cask visual-studio-code
dockutil --add /Applications/Visual\ Studio\ Code.app/ --allhomes

###################
#                 #
# Developer stuff #
#                 #
###################

#
# Docker
#
brew install --cask docker

#
# Docker Toolbox
#
brew install --cask docker-toolbox

#
# ESLint
#
# https://eslint.org/
#
brew install eslint

#
# Git
#
brew install git
git config --global user.name "Kazuto"
git config --global user.email $email
git config --global init.defaultBranch master
git config --global push.default current
git config --global pull.rebase true
git config --global difftool.prompt false
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --diff --wait $LOCAL $REMOTE"
git config --global core.hooksPath ~/.git/hooks
git config --global advice.addIgnoredFile false

#
# GitKraken
#
# https://www.gitkraken.com/
#
brew install --cask gitkraken
dockutil --add /Applications/GitKraken.app/ --allhomes

#
# Kitematic
#
# https://kitematic.com/
#
brew install --cask kitematic
dockutil --add /Applications/Kitematic.app/ --allhomes

#
# Postman
#
# https://www.postman.com
#
brew install --cask postman
dockutil --add /Applications/Postman.app/ --allhomes

#
# Prettier
#
# https://github.com/prettier/prettier
#
brew install prettier

#
# TablePlus
#
# https://tableplus.com/
#
brew install tableplus

#
# Supabase CLI
#
# https://supabase.com/docs/guides/cli
#
brew install supabase/tap/supabase

#
# Xcode
#
mas install 497799835
sudo xcodebuild -license accept

# Node stuff
npm i -g @vue/cli
npm i -g nodemon

######################
#                    #
# Command line tools #
#                    #
######################

#
# Bat
#
# https://github.com/sharkdp/bat
#
brew install bat

################
#              #
# Applications #
#              #
################

#
# Discord
#
# https://discord.com/
#
brew install --cask discord

#
# Firefox
#
# https://www.mozilla.org/en-CA/firefox
#
brew install --cask firefox

#
# Nextcloud
#
# https://nextcloud.com/
#
brew install --cask nextcloud
loginitems -a "Nextcloud"

#
# Rectangle
#
# https://rectangleapp.com/
#
brew install --cask rectangle
loginitems -a "Rectangle"

#
# Signal
#
# https://github.com/signalapp/Signal-Desktop
#
brew install --cask signal

#
# Mailspring
#
# https://getmailspring.com/
#
brew install --cask mailspring
dockutil --add /Applications/Mailspring.app/ --allhomes

##########################
# Restore configurations #
##########################

brew install mackup
mackup restore --force

#########
#       #
# Fonts #
#       #
#########

brew tap homebrew/cask-fonts
brew install --cask font-fira-sans
brew install --cask font-fira-code
brew install --cask font-arial
brew install --cask font-open-sans
brew install --cask font-roboto
brew install --cask font-roboto-condensed

##################################################
#                                                #
# File Type Default App                          #
#                                                #
# Find the app bundle identifier                 #
# mdls /Applications/Photos.app | grep kMDItemCF #
#                                                #
# Find the Uniform Type Identifiers              #
# mdls -name kMDItemContentTypeTree ~/init.lua   #
#                                                #
##################################################



duti -s com.microsoft.VSCode public.plain-text all #txt
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge8027pb all #lua
duti -s com.microsoft.VSCode net.daringfireball.markdown all #Markdown
duti -s com.brave.Browser public.svg-image all #svg
duti -s com.microsoft.VSCode public.shell-script all #Shell script
duti -s com.microsoft.VSCode com.apple.log all #log
duti -s com.microsoft.VSCode public.comma-separated-values-text all #CSV
duti -s com.microsoft.VSCode public.xml all #xml
duti -s com.microsoft.VSCode public.json all #json
duti -s com.microsoft.VSCode public.php-script all #phps
duti -s com.apple.Preview com.adobe.pdf all #pdf
duti -s net.langui.WebPViewer public.webp all #WebP
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge81g6pq all #SQL
duti -s com.apple.Preview org.openxmlformats.presentationml.presentation all #PPTX
duti -s com.microsoft.VSCode public.css all #CSS
duti -s com.microsoft.VSCode com.netscape.javascript-source all #JavaScript
duti -s com.microsoft.VSCode public.ruby-script all #Ruby
duti -s com.brave.Browser com.compuserve.gif all #gif

###################
#                 #
# Dock apps order #
#                 #
###################

dockutil --move 'Brave Browser' --position end --allhomes
dockutil --move 'Mailspring' --position end --allhomes
dockutil --move 'Slack' --position end --allhomes
dockutil --move 'Telegram' --position end --allhomes
dockutil --move 'Visual Studio Code' --position end --allhomes
dockutil --move 'iTerm' --position end --allhomes
dockutil --move 'TablePlus' --position end --allhomes
dockutil --move 'Kitematic' --position end --allhomes
dockutil --move 'GitKraken' --position end --allhomes
dockutil --move 'Postman' --position end --allhomes
dockutil --move 'Spotify' --position end --allhomes

###############
#             #
# Dock spacer #
#             #
###############

dockutil --add '' --type spacer --after 'Mailspring'
dockutil --add '' --type spacer --after 'Telegram'
dockutil --add '' --type spacer --after 'Visual Studio Code'
dockutil --add '' --type spacer --after 'Postman'

###############
#             #
# Zsh Plugins #
#             #
###############
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
/bin/mv -f /configs/zsh/{,.}* $HOME

#################
#               #
# Symlink Files #
#               #
#################

path="$(pwd)/configs"

if [ ! -f ~/.zshrc ]; then
  ln -s $(pwd)/zsh/.zshrc ~/.zshrc
fi

if [ ! -f ~/.aliases ]; then
  ln -s $(pwd)/zsh/.aliases ~/.aliases
fi

if [ ! -d ~/.config ]; then
  mkdir -p ~/.config;
fi

if [ ! -d ~/.config/nvim ]; then
  ln -s $(pwd)/nvim ~/.config/nvim
fi

if [ ! -d ~/.config/tmud ]; then
  mkdir -p ~/.config/tmux;
fi

if [ ! -f ~/.config/tmux/tmux.conf]; then
  ln -s $(pwd)/tmux/.tmux.conf ~/.config/tmux/tmux.conf
fi

if [ ! -d ~/.tmuxifier/layouts ]; then
  ln -s $(pwd)/tmux/layouts ~/.tmuxifier/layouts
fi

if [ ! -d ~/.config/yabai ]; then
  mkdir -p ~/.config/yabai;
fi

if [ ! -f ~/.config/yabai/yabairc ]; then
  ln -s $(pwd)/yabai/yabairc ~/.config/yabai/yabairc
fi

if [ ! -d ~/.config/skhd ]; then
  mkdir -p ~/.config/skhd;
fi

if [ ! -f ~/.config/skhd/skhdrc ]; then
  ln -s $(pwd)/skhd/skhdrc ~/.config/skhd/skhdrc
fi
#######
#     #
# END #
#     #
#######


mackup backup --force

mackup restore --force
