" Plug stuff
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak' 

call plug#end()

"Keybinds
:inoremap jk <ESC> 
let mapleader=","

"Display
syntax on
set number

"let &t_ti.="\<Esc>[1 q"
"let &t_SI.="\<Esc>[5 q"
"let &t_EI.="\<Esc>[1 q"
"let &t_te.="\<Esc>[0 q"

