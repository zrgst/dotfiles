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

" Tab og Indent (4 spaces)
set tabstop=4       " Vis eksisterende tabs som 4 spaces
set shiftwidth=4    " Størrelse på automatisk indent
"set expandtab       " Gjør tabs om til spaces
"set softtabstop=4   " Gjør at 'backspace' sletter 4 spaces

" Behold standard farger
colorscheme default

" --- C++ spesifikt ---
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
set makeprg=make

" --- ALE (Linting) ---
" Dette gir deg beskjed om syntaksfeil i Bash og C++ mens du skriver
let g:ale_linters = {'cpp': ['gcc'], 'sh': ['shellcheck']}
