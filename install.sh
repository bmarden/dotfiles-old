#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: install.sh <home_directory>"
  exit 1
fi

homedir=$1

#dotfiles directory
dotfiledir=${homedir}/dotfiles

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# List of files/folders to symlink in ${homedir}
files="zshrc bashrc"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (overwrites old dotfiles)
for file in ${files}; do 
  echo "Creating symlink to $file in home directory"
  ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download git autocomplete
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Powerlevel 10k installation
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Run brew install script
./brew.sh 

# Run vscode install script
./vscode.sh



