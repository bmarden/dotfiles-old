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

  ## Brew Packages ##
  # install better vim
  brew install neovim
  # vivid for cool LS_COLORS
  brew install vivid
  # GNU tools
  brew install gnu-sed
  brew install coreutils
  brew install grep
  brew install gnu-tar 
  brew install gawk     # dependency for asdf node-js
  brew install gpg      # dependency for asdf node-js
  # install jq for json
  brew install jq
  # asdf version manager
  brew install asdf
  # 1password cli
  brew install --cask 1password/tap/1password-cli
  # openvpn client
  brew install --cask openvpn-connect

  # Install MacOS Applications
  brew install --cask discord
  brew install --cask visual-studio-code
  brew install --cask iterm2
  brew install --cask google-chrome
  brew install --cask slack
  brew install --cask spotify
   
  # Add fonts tap
  brew tap homebrew/cask-fonts
  brew install font-jetbrains-mono-nerd-font
  brew install font-fira-code
  brew install font-hack-nerd-font

  ## Setup and install asdf plugins ##
  # nodejs
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest

  # golang
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
  asdf install golang latest
  asdf global golang latest


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

# Install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Setup nvim configuration
setup_neovim


figlet "... Done!" | lolcat
  
