#!/usr/bin/env bash

set -o nounset  # Error when unset variables
set -o errexit  # Exit when error encountered

# Import functions
source functions.sh

# Get the OS type
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  dotfilePath="$HOME/dotfiles/linux"
  sudo apt update

  printf "Installing apt packages...\n"
  # apt programs to install
  install_apt_pkg curl
  # install_apt_pkg git
  install_apt_pkg xclip
  # install_apt_pkg texlive-latex-extra
  install_apt_pkg htop
  install_apt_pkg neovim
  # Python
  # sudo apt install -y python3-venv python3-pip

  # Useless things
  install_apt_pkg figlet
  install_apt_pkg lolcat

  CUSTOM_NVIM_PATH=/usr/bin/nvim
  # Install neovim  
  # curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  # sudo mv nvim.appimage ${CUSTOM_NVIM_PATH}
  # chmod +x ${CUSTOM_NVIM_PATH}
  
  
  #set -u
  sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
  
  # Setup and install fonts
  mkdir -p $HOME/.local/share/fonts
  install_fonts $HOME/.local/share/fonts
  
  sudo apt upgrade -y

  
elif [[ $OSTYPE == "darwin"* ]]; then 
  dotfilePath="$HOME/dotfiles/mac"

  # Install Brew Packages
  brew install python3
  brew install neovim

  # Install MacOS Applications
  brew cask install discord
  brew cask install visual-studio-code
  brew cask install iterm2
  brew cask install google-chrome
   
  # Add fonts tap
  brew tap homebrew/cask-fonts
  brew install font-jetbrains-mono-nerd-font
  brew install font-fira-code

fi

# Setup zsh config
setupZsh

# create zsh directory if it doesn't exist
if [ ! -d $HOME/zsh ]; then
  mkdir $HOME/zsh
fi

# link dotfiles
link_dotfile "$dotfilePath/.zshrc" "$HOME/.zshrc"
link_dotfile "$dotfilePath/.gitconfig" "${HOME}/.gitconfig"
link_dotfile "$HOME/dotfiles/zsh/alias.zsh" "$HOME/zsh/alias.zsh"
link_dotfile "$HOME/dotfiles/zsh/env.zsh" "$HOME/zsh/env.zsh"
link_dotfile "$HOME/dotfiles/.p10k.zsh" "${HOME}/.p10k.zsh"
link_dotfile "$HOME/dotfiles/.tmux.conf" "${HOME}/.tmux.conf"

# Setup nvim configuration
setup_neovim


figlet "... Done!" | lolcat
  
