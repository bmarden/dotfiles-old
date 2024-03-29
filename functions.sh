#!/bin/bash

function link_dotfile() {
	dotfile=${2}
	dest=${3}
	dateStr=$(date +%Y-%m-%d-%H%M)

	if [ -h ${dest} ]; then
		# Existing symlink
		echo "Removing existing symlink: ${dest}"
		rm "${dest}"

	elif [ -f "${dest}" ]; then
		# Existing file
		echo "Backing up existing file: ${dest}"
		mv "${dest}"{,.${dateStr}}
	
	elif [ -d "${dest}" ]; then
		# Existing dir
		echo "Backing up existing dir: ${dest}"
		mv "${dest}"{,.${dateStr}}
	fi

	echo "Creating new symlink from ${dotfile} to  ${dest}"
	ln -s "${dotfile}" "${dest}"
}

function setupZsh() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install -y zsh

    # set zsh as default shell
    chsh -s $(which zsh)
  fi
}

function setup_neovim() {
  # Symlink each file nvim directory  
  for f in $(find nvim -type f); do 
    
    # Create the directory if it doesn't exist
    config_path="$(dirname ${f})"
    echo $config_path
    mkdir -p "$HOME/.config/$config_path"
    
    link_dotfile $(pwd)/${f} "$HOME/.config/${f}"
  done
}

function install_fonts() {
  path=${1} 
  
  (cd ${path} && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf)
  (cd ${path} && curl -fLo "Meslo LG S Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Regular/complete/Meslo%20LG%20S%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)
  (cd ${path} && curl -fLo "Meslo LG S Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Italic/complete/Meslo%20LG%20S%20Italic%20Nerd%20Font%20Complete%20Mono.ttf)
  (cd ${path} && curl -fLo "Meslo LG S Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Bold/complete/Meslo%20LG%20S%20Bold%20Nerd%20Font%20Complete%20Mono.ttf)
  (cd ${path} && curl -fLo "Meslo LG S Bold Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Bold-Italic/complete/Meslo%20LG%20S%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf)
  (cd ${path} && curl -fLo "Fira Code Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Fira Code Medium Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Fira Code Light Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Fira Code Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Fira Code Retina Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf )
  (cd ${path} && curl -fLo "Hack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Hack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf)
  (cd ${path} && curl -fLo "Hack Bold Italic Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf)
}

function install_apt_pkg() {
  # Disable auto fail on error here
  set +e

  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
  
  # Re enable fail on error
  set -e
}

function test_func() {
  echo $1
  echo $2
  echo $3
}

$1 "$@"
