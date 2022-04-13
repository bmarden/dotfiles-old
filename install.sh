#!/usr/bin/env bash
set -o nounset  # Error when unset variables
set -o errexit  # Exit when error encountered

# Import functions
source functions.sh

# Get the OS type
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  dotfilePath="$HOME/dotfiles/linux"
  sudo apt update

  printf("Installing apt pakages...\n")
  # apt programs to install
  installAptPackage curl
  installAptPackage git
  installAptPackage vim 
  installAptPackage xclip
  installAptPackage valgrind
  # installAptPackage texlive-latex-extra
  installAptPackage htop
  # Python
  # sudo apt install -y python3-venv python3-pip

  # Install Dropbox
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

  # Install nvm
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash


  # Useless things
  # installAptPackage figlet
  # installAptPackage lolcat

  CUSTOM_NVIM_PATH=/usr/local/bin/nvim
  # Install neovim  
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  sudo mv nvim.appimage ${CUSTOM_NVIM_PATH}
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
linkDotfile "$dotfilePath/.zshrc" "$HOME/.zshrc"
linkDotfile "$dotfilePath/.gitconfig" "${HOME}/.gitconfig"
linkDotfile "$HOME/dotfiles/zsh/alias.zsh" "$HOME/zsh/alias.zsh"
linkDotfile "$HOME/dotfiles/zsh/env.zsh" "$HOME/zsh/env.zsh"
linkDotfile "$HOME/dotfiles/.p10k.zsh" "${HOME}/.p10k.zsh"
linkDotfile "$HOME/dotfiles/.tmux.conf" "${HOME}/.tmux.conf"

# Setup nvim configuration
setupNvim


figlet "... Done!" | lolcat
  