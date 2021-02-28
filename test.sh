#!/usr/bin/env bash

# source ./functions.sh

# # Symlink each file nvim directory  
# for f in $(find testDir -type f); do 
  
#   # Get the path 
#   path="$(dirname ${f})"

#   mkdir -p "$HOME/.config/$path"
    
#   linkDotfile $(pwd)/${f} "$HOME/.config/${f}"
# done

(cd $HOME/test && curl -fLo "Meslo LG S Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Regular/complete/Meslo%20LG%20S%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)