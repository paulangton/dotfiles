syntax on

" latexsuite configuration
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Change tab to 4 spaces
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Auto-wrap text at 80 characters
set tw=79
