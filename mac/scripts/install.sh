#!/bin/bash

./symlink.sh
./brew.sh
./fonts.sh
./programs.sh

figlet "... Done!" | lolcat

