 if exists('g:vscode') 
	function! s:showCommands()
	    normal! gv
	    let startLine = line("v")
	    let endLine = line(".")
	    call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
	endfunction

	xnoremap <silent> <C-P> :<C-u>call <SID>showCommands()<CR>

endif


set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"source ~/.vimrc

" Run PlugClean to remove unused plugins
" Run PlugInstall to install new plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'asvetliakov/vim-easymotion'
Plug 'justinmk/vim-sneak' 
Plug 'machakann/vim-highlightedyank'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"Display
syntax on
set number

" Syntax/theme stuff
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif

"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu
"colorscheme onedark
colorscheme monokai_pro

" Set tab to use 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Highlight duration
let g:highlightedyank_highlight_duration = 250

"Keybinds
inoremap jj <ESC> 
nnoremap j gj
nnoremap k gk
let mapleader=","

" Set default register in vim to use system clipboard
set clipboard+=unnamedplus

" Set mouse scrolling
set mouse=a

" VsCode comment functions
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

