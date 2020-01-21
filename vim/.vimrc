set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8			  " for vim-devicons

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rakr/vim-one'
Plugin 'python-mode/python-mode'
Plugin 'morhetz/gruvbox'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vbe0201/vimdiscord'

call vundle#end() 
call glaive#Install()
filetype plugin indent on 

" Setup Glaive
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Setup theme. 
set t_Co=256
let g:airline_theme='onedark'

" Setup gruvbox
let g:gruvbox_bold=0
let g:gruvbox_italic=0
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
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent
"set cindent

" Language specific indentation.
autocmd Filetype cpp setlocal expandtab cindent smartindent tabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab tabstop=8 shiftwidth=4 softtabstop=4

" tpp as cpp.
autocmd BufEnter *.tpp :setlocal filetype=cpp

" .py as python
autocmd BufEnter *.py :setlocal filetype=python

" Setup airline.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" setup for indent line
let g:indentLine_char = '│'
set ttimeoutlen=50

" Insert mode exit key map
inoremap jk <ESC>
