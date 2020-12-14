#!/bin/bash

cd ..

dotfilesDir=$(pwd) 

function linkDotfile {
	dotfile=${1}
	dest=${2}
	dateStr=$(date +%Y-%m-%d-%H%M)

	if [ -h ~/${1} ]; then
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

	echo "Creating new symlink: ${dest}"
	ln -s "${dotfilesDir}/${1}" "${dest}"
}

linkDotfile .zshrc "${HOME}/.zshrc"
linkDotfile .gitconfig "${HOME}/.gitconfig"
linkDotfile init.vim "${HOME}/.config/nvim/init.vim"
linkDotfile .p10k.zsh "${HOME}/.p10k.zsh"
linkDotfile vscode_settings.json "${HOME}/Library/Application Support/Code/User/settings.json" 
linkDotfile vscode_settings.vim "${HOME}/.config/nvim/"
linkDotfile .inputrc "${HOME}/.inputrc"
linkDotfile .tmux.conf "${HOME}/.tmux.conf

