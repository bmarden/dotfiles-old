#!/bin/bash

./symlink.sh
./aptinstall.sh
./fonts.sh
./programs.sh

sudo apt upgrade -y

figlet "... Done!" | lolcat

