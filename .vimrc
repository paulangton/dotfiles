" Vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vimtex
Plug 'lervag/vimtex'

" vim LSP impl
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Async Linter
Plug 'https://github.com/w0rp/ale.git'

" Vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

" Syntax highlighting
syntax on
filetype on

" Dont forget Racket
if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

filetype plugin indent on

" Go syntax plugin
let g:go_fmt_command = "goimports"

" ALE Fixers
let g:ale_fixers = {
            \   'python': ['autopep8'],
            \   'go'    : ['gofmt'],
            \}

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'

" LSP
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
endif

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
