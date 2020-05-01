#!/bin/bash

sudo snap install --beta --classic nvim

cd ../..

dotfilesDir=$(pwd)

nvimPath="${HOME}/.config/nvim/"
dateStr=$(date +%Y-%m-%d-%H%M)


if [ ! -d "${nvimPath}" ]; then
	mkdir -p ${nvimPath}

elif [ -h "${nvimPath}/init.vim" ]; then
	# Existing symlink
	echo "Removing existing symlink: ${nvimPath}"
	rm ${nvimPath}/init.vim

elif [ -f "${nvimPath}/init.vim" ]; then
	# Existing file
	echo "Backing up init.vim"
	mv "${nvimPath}/init.vim" "${nvimPath}/init.vim_${dateStr}"
fi

echo "Creating new symlink for init.vim"
ln -s "${dotfilesDir}/init.vim" ${nvimPath}


#elif [ ! -f "${nvimPath}/init.vim" ]; then
#    touch ${nvimPath}/init.vim
#fi
#
#echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
#let &packpath = &runtimepath
#source ~/.vimrc" > ${nvimPath}/init.vim  
