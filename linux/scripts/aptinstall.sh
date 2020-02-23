#!/bin/bash

sudo apt update

function install {
	which $1 &> /dev/null

	if [ $? -ne 0 ]; then
		echo "Installing: ${1}..."
		sudo apt install -y $1
	else
		echo "Already installed: ${1}"
	fi
}

# apt programs to install
install firefox
install brave-browser
install curl
install git
install vim 
install xclip
install bison
install flex 
install valgrind

# Useless things
install figlet
install lolcat


