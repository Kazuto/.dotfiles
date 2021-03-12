email="mail@kazuto.de"

#
# iTerm2
#
# https://iterm2.com
#
open https://iterm2.com/downloads/stable/latest
mv iTerm.app /Applications/
open iTerm
exit

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
nvm install v14.15.1
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
# Sound Control
#
brew install --cask sound-control

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
# Oh My Zsh
#
# https://github.com/ohmyzsh/ohmyzsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
# Kitematic
#
# https://kitematic.com/
#
brew install --cask kitematic

#
# massCode
#
# https://masscode.io/
#
brew install --cask masscode

#
# Postman
#
# https://www.postman.com
#
brew install --cask postman

#
# Prettier
#
# https://github.com/prettier/prettier
#
brew install prettier

#
# Sourcetree
#
# https://www.sourcetreeapp.com/
#
brew install sourcetree

#
# TablePlus
#
# https://tableplus.com/
#
brew install tableplus

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
# Rectangle
#
# https://rectangleapp.com/
#
brew install --cask rectangle

#
# Signal
#
# https://github.com/signalapp/Signal-Desktop
#
brew install --cask signal

#
# Thunderbird
#
# https://www.thunderbird.net/en-US/
#
brew install --cask thunderbird

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



duti -s com.colliderli.iina public.mpeg-4 all #mp4
duti -s com.colliderli.iina com.apple.quicktime-movie all #mov
duti -s com.microsoft.VSCode public.plain-text all #txt
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge8027pb all #lua
duti -s com.colliderli.iina public.avi all #avi
duti -s com.colliderli.iina public.3gpp all #3gp
duti -s com.apple.Preview com.nikon.raw-image all #NEF
duti -s com.microsoft.VSCode net.daringfireball.markdown all #Markdown
duti -s com.brave.Browser public.svg-image all #svg
duti -s net.kovidgoyal.calibre org.idpf.epub-container all # ePub
duti -s com.microsoft.VSCode public.shell-script all #Shell script
duti -s com.microsoft.VSCode com.apple.log all #log
duti -s com.microsoft.VSCode public.comma-separated-values-text all #CSV
duti -s com.microsoft.VSCode public.xml all #xml
duti -s com.microsoft.VSCode public.json all #json
duti -s com.microsoft.VSCode public.php-script all #php
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge81k3u all #terraform tf
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge81k3xxsvu1k3k all #terraform tfstate
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge81k3x0qf3hg all #terraform tfvars
duti -s com.colliderli.iina com.microsoft.waveform-audio all #wav
duti -s com.apple.Preview com.adobe.pdf all #pdf
duti -s com.colliderli.iina public.mp3 all #mp3
duti -s net.kovidgoyal.calibre dyn.ah62d4rv4ge80c8x1gq all #Kindle ebooks
duti -s com.colliderli.iina com.apple.m4a-audio all #M4A
duti -s net.langui.WebPViewer public.webp all #WebP
duti -s com.microsoft.VSCode dyn.ah62d4rv4ge81g6pq all #SQL
duti -s com.apple.Preview org.openxmlformats.presentationml.presentation all #PPTX
duti -s com.microsoft.VSCode public.css all #CSS
duti -s com.microsoft.VSCode com.netscape.javascript-source all #JavaScript
duti -s com.microsoft.VSCode public.ruby-script all #Ruby
duti -s com.apple.Preview public.standard-tesselated-geometry-format all #3d CAD
duti -s com.brave.Browser com.compuserve.gif all #gif

###################
#                 #
# Dock apps order #
#                 #
###################

dockutil --move 'Brave Browser' --position end --allhomes
dockutil --move 'Slack' --position end --allhomes
dockutil --move 'Spotify' --position end --allhomes
dockutil --move 'iTerm' --position end --allhomes
dockutil --move 'Visual Studio Code' --position end --allhomes

#######
#     #
# END #
#     #
#######


mackup backup --force

mackup restore --force