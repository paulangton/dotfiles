" Vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vim-tex
Plug 'lervag/vimtex'

" Async Linter
Plug 'https://github.com/w0rp/ale.git'

" Initialize plugin system
call plug#end()

" Syntax highlighting
syntax on

" Turn off callbacks for latex compiler
" let g:vimtex_compiler_latexmk={'callback' : 0}

" Change tab to 4 spaces
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Auto-wrap text at 80 characters
set tw=79
