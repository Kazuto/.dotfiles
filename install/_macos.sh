info "Installing prerequisites" --margin="1 0"

xcode-select --install 2> /dev/null || success "Xcode CLI is already installed"

install_deps() {
  info "$1" --margin="1 0 0 0"

  gum style --border normal --padding="0 1" --foreground="#777777" "${@:2}"
  # gum confirm "Install?" || return

  echo "${@:2}" | tr " " "\n" | while read -r app
do
  local app_name="${app##*/}"

  if [ "$(brew list | grep "$app_name")" != "" ] || [ "$(which "$app_name")" != "" ]
  then
    success "Already installed ($app_name)"
  else
    gum spin --spinner dot --title "Installing $app_name" brew install "$app"

    success "Installed $app_name"
  fi
done
}

install_deps "Install main applications" \
  "git" "commitizen" "iterm2" "neovim" "tmux"

install_deps "Installing CLI tools" \
  "bat" "exa" "supabase/tap/supabase" "trash" "wget"

install_deps "Installing code style tools" \
  "eslint" "phpstan" "prettier"

install_deps "Installing utility applications" \
  "alt-tab" "bartender" "dockutil" "duti" \
  "karabiner-elements" "nextcloud" "raycast" \
  "koekeishiya/formulae/skhd" "koekeishiya/formulae/yabai" 

install_deps "Installing messaging applications" \
  "discord" "mailspring" "slack" "telegram" 

install_deps "Installing web browsers" \
  "brave-browser" "firefox"

install_deps "Installing media applications" \
  "spotify"

install_deps "Installing security applications" \
  "bitwarden"

install_deps "Installing optional applications" \
  "docker" "docker-toolbox" \
  "postman" "tableplus" "visual-studio-code" 
