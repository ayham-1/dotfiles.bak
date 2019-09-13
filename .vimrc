set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'

call vundle#end() 
filetype plugin indent on 

" Setup theme. 
set t_Co=256

" Setup gruvbox
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_tabline=1
set background=dark
colorscheme gruvbox

" custom settings
set mouse=a
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" Setup global indentation. 
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent
"set cindent

" Language specific indentation.
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" tpp as cpp.
autocmd BufEnter *.tpp :setlocal filetype=cpp

" Setup airline.
let g:airline_powerline_fonts = 1

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" setup for indent line
let g:indentLine_char = '│'
set ttimeoutlen=50

" Insert mode exit key map
inoremap jk <ESC>
