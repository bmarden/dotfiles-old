set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
    "source ~/.vimrc

" VScode stuff
if exists('g:vscode')
	function! s:showCommands()
		normal! gv
		let startLine = line("v")
		let endLine = line(".")
		call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
	endfunction

	xnoremap <silent> <C-P> :<C-u>call <SID>showCommands()<CR> 
endif

" VsCode comment functions
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

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
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/sonokai'
call plug#end()

" Additional vim directives added to
" 1. discourage use of arrow keys
" 2. ensure that tabbing is enabled when editing Makefiles
" 3. add sane indenting in C and C++ files
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" Syntax/theme stuff
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif 

" Display
syntax on
set number 

"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu
"colorscheme onedark
"colorscheme monokai_pro
let g:sonokai_style = 'andromeda'
colorscheme sonokai 
set background=dark
let g:lightline = {'colorscheme' : 'sonokai'}

" Highlight color
highlight Visual cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#0087af guifg=#000000

" Set tab to use 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
"autocmd FileType make set noexpandtab|set autoindent
"autocmd FileType c set tabstop=2|set shiftwidth=2|set expandtab|set autoindent
"autocmd FileType cpp set tabstop=2|set shiftwidth=2|set expandtab|set autoindent
"autocmd FileType yacc set tabstop=2|set shiftwidth=2|set expandtab|set autoindent
"autocmd FileType lex set tabstop=2|set shiftwidth=2|set expandtab|set autoindent
set clipboard+=unnamed,unnamedplus

" Keybindings
let mapleader=","
inoremap jj <ESC> 
nnoremap j gj
nnoremap k gk

" Mouse scrolling
set mouse=a

" highlightedyank duration
let g:highlightedyank_highlight_duration=200
