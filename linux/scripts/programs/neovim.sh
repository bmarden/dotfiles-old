#!/bin/bash

sudo apt install -y neovim

nvimPath="${HOME}/.config/nvim"

if [ ! -d "${nvimPath}" ]; then
    mkdir -p ${nvimPath}
fi

if [ ! -f "${nvimPath}/init.vim" ]; then
    touch ${nvimPath}/init.vim
fi

echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ${nvimPath}/init.vim  
