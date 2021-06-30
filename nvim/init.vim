if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/highlight-yank.vim

if exists('g:vscode')
  source $HOME/.config/nvim/vscode_settings.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
else
  " Theme
  source $HOME/.config/nvim/themes/sonokai.vim
  "source $HOME/.config/nvim/themes/amora.vim 

  " Plugin configurations
  source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
endif
