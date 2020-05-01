#!/bin/bash

cd programs/

./docker.sh
./python.sh
./vsc.sh
./z_shell.sh
./neovim.sh
./flutter.sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
