let plugPath="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
  " auto-install vim-plug
if empty(plugPath)
  silent !curl -fLo plugPath --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(plugPath)
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/vim-easy-align'
	Plug 'machakann/vim-highlightedyank'
	Plug 'tpope/vim-repeat'
	" Surround 
	Plug 'tpope/vim-surround'

	if exists('g:vscode')
		Plug 'asvetliakov/vim-easymotion'
	else
		" Themes
		Plug 'joshdick/onedark.vim'
		Plug 'ayu-theme/ayu-vim'
		Plug 'sainnhe/sonokai'

		" Status line
		Plug 'itchyny/lightline.vim'
		Plug 'justinmk/vim-sneak'
	  Plug 'justinmk/vim-syntax-extra'
		" Fancy start screen for vim
		Plug 'mhinz/vim-startify'
		" 
		Plug 'alvan/vim-closetag'
		" Auto pairs for ( [ {
		Plug 'jiangmiao/auto-pairs'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
