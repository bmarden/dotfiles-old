#!/usr/bin/env bash

if ["$#" -ne 1]; then
  echo "Usage: install.sh <home_directory>"
  exit 1
fi

homedir=$1

#dotfiles directory

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
