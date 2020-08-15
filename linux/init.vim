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
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak' 
Plug 'machakann/vim-highlightedyank'
Plug 'justinmk/vim-syntax-extra'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'   
" Better syntax highlighting
Plug 'sheerun/vim-polyglot'
" Themes
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'ntk148v/vim-horizon'
Plug 'flrnd/candid.vim'
Plug 'sainnhe/sonokai'
call plug#end()

filetype plugin indent on

" Display
syntax on
set number

" Syntax/theme stuff
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"if (has("termguicolors"))
"    set termguicolors
"endif
set termguicolors
set background=dark

"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu

"colorscheme onedark
"colorscheme monokai_pro
"colorscheme candid

let g:sonokai_style = 'shusia'
colorscheme sonokai
let g:lightline = {'colorscheme' : 'sonokai'}

"colorscheme one
"let g:airline_theme='one'


" Change highlight color
highlight Visual term=reverse cterm=reverse guibg=Grey35

" Set tab to use 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab       " change tabs to spaces 

" Highlight duration
let g:highlightedyank_highlight_duration = 250

"Keybinds
inoremap jj <ESC> 
nnoremap j gj
nnoremap k gk
let mapleader=","
" For terminal mode
tnoremap <Esc> <C-\><C-n>:q!<CR>

" Navigate easier in NERD Tree
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

let g:NERDTreeWinSize=25
" Set default register in vim to use system clipboard
" set clipboard+=unnamedplus

" Set mouse scrolling
set mouse=a

" VsCode comment functions
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

if has('clipboard')
    set clipboard^=unnamed
endif

