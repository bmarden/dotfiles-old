#!/bin/bash

sudo snap install --classic code

function install {
  name="${1}"
  code --install-extension ${name} --force
}

# Language packs
install faustinoaq.lex-flex-yacc-bison
install luniclynx.lex
install ms-python.python
install ms-vscode.cpptools

# Django stuff
install batisteo.vscode-django
install bibhasdn.django-html 

# Flutter/Dart
install dart-dart-code.dart-code
install dart-code.flutter
install jeroen-meijer.pubspec-assist
install nash.awesome-flutter-snippets

# Markdown
install yzhang.markdown-all-in-one
install davidanson.vscode-markdownlint

# Utility
install coenraads.bracket-pair-colorizer
install usernamehw.errorlens
install mhutchie.git-graph
install asvetliakov.vscode-neovim

# Themes/Styling
install liviuschera.noctis
install dracula-theme.theme-dracula
install equinusocio.vsc-material-theme-icons
install jolaleye.horizon-theme-vscode
install pkief.material-icon-theme
install asvetliakov.vscode-neovim
install monokai.theme-monokai-pro-vscode
install jeff-hykin.better-cpp-syntax
