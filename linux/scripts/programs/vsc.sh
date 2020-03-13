#!/bin/bash

sudo snap install --classic code

dest=$HOME/.config/Code/User/settings.json
dateStr=$(date +%Y-%m-%d-%H%M) 
if [ -f "${dest}" ]; then
	mv ${dest}{,.${dateStr}}
fi
ln -s $(pwd)/../../vsc_settings.json ${dest}

function install {
  name="${1}"
  code --install-extension ${name} --force
}

install batisteo.vscode-django
install bibhasdn.django-html 
install dart-dart-code.dart-code
install dart-code.flutter
install liviuschera.noctis
install dracula-theme.theme-dracula
install equinusocio.vsc-material-theme-icons
install faustinoaq.lex-flex-yacc-bison
install jolaleye.horizon-theme-vscode
install luniclynx.lex
install ms-python.python
install ms-vscode.cpptools
install vscodevim.vim
