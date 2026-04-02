" --- Plugins ---
call plug#begin('~/.vim/plugged')

" Syntax og støtte for C++ og Bash
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale' " Linting og feilsøking
Plug 'jiangmiao/auto-pairs' " Automatisk lukking av braces/parenteser

call plug#end()

" --- Grunnleggende instillinger ---
set nocompatible
filetype plugin indent on
syntax on

" Tab og Indent (2 spaces)
set tabstop=2       " Vis eksisterende tabs som 2 spaces
set shiftwidth=2    " Størrelse på automatisk indent
set expandtab       " Gjør tabs om til spaces
set softtabstop=2   " Gjør at 'backspace' sletter 2 spaces
autocmd FileType sh setlocal expandtab shiftwidth=2 tabstop=2

" Behold standard farger
colorscheme default

" --- C++ spesifikt ---
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" --- ALE (Linting) ---
" Dette gir deg beskjed om syntaksfeil i Bash og C++ mens du skriver
let g:ale_linters = {'cpp': ['gcc'], 'sh': ['shellcheck']}

" Kjører 'make' i bakgrunnen og åpner feilliste hvis det feiler
set makeprg=make
