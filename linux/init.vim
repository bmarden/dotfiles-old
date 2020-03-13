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
call plug#end()

"Display
syntax on
set number

" Set tab to use 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Highlight duration
let g:highlightedyank_highlight_duration = 250

"Keybinds
:inoremap jj <ESC> 
let mapleader=","

" Set default register in vim to use system clipboard
set clipboard+=unnamed

" VsCode comment functions
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

