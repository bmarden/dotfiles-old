
dest=${HOME}/Library/ApplicationSupport/Code/User
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
install asvetliakov.vscode-neovim
install azemoh.one-monokai
install code.flutter 
install coenraads.bracket-pair-colorizer
install dart-code.dart-code
install dart-code.flutter
install davidanson.vscode-markdownlint 
install eamodio.gitlens 
install formulahendry.code-runner 
install jeff-hykin.better-cpp-syntax
install jeff-hykin.xd-theme
install johnpapa.vscode-peacock 
install pkief.material-icon-theme
install s3gf4ult.monokai-vibrant
install tomphilbin.gruvbox-themes
install visualstudioexptteam.vscodeintellicode
install usernamehw.errorlens
install mhutchie.git-graph
