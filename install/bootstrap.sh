#!/bin/bash

#
# Inspiration taken from Andrew Burgess
# https://github.com/andrew8088
#
# See: https://github.com/andrew8088/dotfiles/blob/742d9cf7d6d9b1334b2820228f7bd2a758af9367/install/bootstrap.sh
#

COLOR="#C084FC"

DIR="$(dirname "$(pwd -P)")"
PROP="links.prop"
FILES="$(find -H "$DIR" -maxdepth 2 -name "$PROP" -not -path '*.git*')"

set -e

gum style \
  --border rounded \
  --padding "1" \
  --margin "1" \
  --border-foreground $COLOR \
  --foreground $COLOR \
  "Dotfile Setup"

success () {
  gum style --foreground "#84CC16" " $1"
}

warning () {
  gum style --foreground "#FB923C" " $1"
}

link () {
  local src="$1"
  local dst="$2"

  local overwrite=
  local backup=
  local skip=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then
      choose_method
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "Removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "Moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "Skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]
  then
    ln -s "$1" "$2"

    return
  fi
}

choose_method () {
  warning "Target already exists $dst ($(basename "$src"))!"

  CHOICE=$(gum choose "Overwrite" "Overwrite All" "Backup" "Backup All" "Skip" "Skip All")

  case "$CHOICE" in
    "Overwrite" ) 
      overwrite=true;;
    "Overwrite All" )
      overwrite_all=true;;
    "Backup" )
      backup=true;;
    "Backup All" )
      backup_all=true;;
    "Skip" )
      skip=true;;
    "Skip All" )
      skip_all=true;;
    *)
      ;;
  esac
}

create_symlink () {
  local src dst dir

  src=$(eval echo "$1" | cut -d ':' -f 1)
  dst=$(eval echo "$1" | cut -d ':' -f 2)
  dir=$(dirname "$dst")

  mkdir -p "$dir"
  link "$src" "$dst"
}

setup () {
  local overwrite_all=false
  local backup_all=false
  local skip_all=false

  echo "$FILES" | while read -r file
  do
    cat < "$file" | while read -r line
    do
      create_symlink "$line"
    done
  done
}

setup
