#!/bin/bash

# Install zsh

sudo apt install -y zsh

cd $HOME

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/bmarden/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/bmarden/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Powerlevel 10k installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/bmarden/.oh-my-zsh/custom/themes/powerlevel10k


