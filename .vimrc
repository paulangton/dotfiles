" Vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'lervag/vimtex'


" Initialize plugin system
call plug#end()

syntax on

" Change tab to 4 spaces
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Auto-wrap text at 80 characters
set tw=79
