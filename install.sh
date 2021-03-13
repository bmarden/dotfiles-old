#!/usr/bin/env bash
set -o nounset  # Error when unset variables
set -o errexit  # Exit when error encountered

# Import functions
source functions.sh

# Get the OS type
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  dotfilePath='linux/'
  sudo apt update


  # apt programs to install
  installAptPackage curl
  installAptPackage git
  installAptPackage vim 
  installAptPackage xclip
  installAptPackage valgrind
  installAptPackage texlive-latex-extra
  installAptPackage htop
  # Python
  sudo apt install -y python3-venv python3-pip

  # Useless things
  installAptPackage figlet
  installAptPackage lolcat

  CUSTOM_NVIM_PATH=/usr/local/bin/nvim
  # Install neovim  
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /tmp/nvim.appimage
  sudo mv /tmp/nvim.appimage ${CUSTOM_NVIM_PATH}
  chmod +x ${CUSTOM_NVIM_PATH}
  
  
  set -u
  sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
  
  # Setup and install fonts
  mkdir -p $HOME/.local/share/fonts
  installFonts $HOME/.local/share/fonts
  
  sudo apt upgrade -y

  
elif [[ $OSTYPE == "darwin"* ]]; then 
  dotfilePath='mac/'

  # Install Brew Packages
  brew install python3
  brew install --HEAD neovim
  brew upgrade neovim --fetch-HEAD

  # Install MacOS Applications
  brew cask install discord
  brew cask install visual-studio-code
  brew cask install iterm2
  brew cask install dropbox
  brew cask install google-chrome
   
  # Add fonts tap
  brew tap homebrew/cask-fonts
  brew install font-jetbrains-mono-nerd-font
  brew install font-fira-code
  

fi

# link dotfiles
linkDotFile "$dotfilePath/.zshrc" "$HOME/.zshrc"
linkDotfile "$dotfilePath/.gitconfig" "${HOME}/.gitconfig"
linkDotfile .p10k.zsh "${HOME}/.p10k.zsh"
linkDotfile .inputrc "${HOME}/.inputrc"
linkDotfile .tmux.conf "${HOME}/.tmux.conf"

# Setup nvim configuration
setupNvim

figlet "... Done!" | lolcat
  