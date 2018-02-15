" Vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vimtex
Plug 'lervag/vimtex'

" Async Linter
Plug 'https://github.com/w0rp/ale.git'

" Initialize plugin system
call plug#end()

" Syntax highlighting
syntax on


" ALE Fixers
let g:ale_fixers = {
            \   'python': ['autopep8'],
            \}

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'


" Reformatting respecting latex paragraphs
map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR> 

" Change tab to 4 spaces
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Auto-wrap text at 80 characters
set tw=80
