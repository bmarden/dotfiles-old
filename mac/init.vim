source $HOME/.config/nvim/vim-plugins/plugins.vim
if exists('g:vscode')
    source $HOME/.config/nvim/vscode_settings.vim
    source $HOME/.config/nvim/vim-plugins/plug-config/easymotion.vim
		nmap <Tab> :Tabnext<CR>
		nmap <S-Tab> :Tabprev<CR>
endif

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

hi Visual term=reverse cterm=reverse guibg=Grey35
" Set tab to use 4 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

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
