#!/bin/bash

./aptinstall.sh
./fonts.sh
./programs.sh
./symlink.sh

sudo apt upgrade -y

figlet "... Done!" | lolcat

