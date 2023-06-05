#!/bin/bash

. "$PWD/util/message.sh"

email="mail@kazuto.de"

COLOR="#C084FC"

gum style \
  --border rounded \
  --padding "1" \
  --margin "1" \
  --border-foreground $COLOR \
  --foreground $COLOR \
  "Dotfile setup script v1.0.0"

if ! [ -f ~/.ssh/id_ed25519 ]
then
  info "Generating SSH keys" --margin="1 0"

  ssh-keygen -t ed25519 -C $email
  ssh-add -K ~/.ssh/id_ed25519
  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
  ssh-keyscan -t rsa github.lab >> ~/.ssh/known_hosts
fi

OS=$(gum choose --header "Please choose your operating system" "macOS" "Linux")

# if [ "$OS" == "macOS" ]
# then
#   . "$PWD/_macos.sh"
# fi

source "$PWD/_bootstrap.sh"
