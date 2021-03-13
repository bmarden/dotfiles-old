let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')
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

if plug_install
    PlugInstall --sync
endif
unlet plug_install

