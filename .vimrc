set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" all plugin
Plugin 'vhdirk/vim-cmake'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rainglow/vim'
Plugin 'Raimondi/delimitMate'
Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()        " enable this line after the installation of glaive
filetype plugin indent on    " required

" custom setting
set mouse=a
set number
set relativenumber
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" indent for global
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent
"set cindent

autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Setup airline
let g:airline_powerline_fonts = 1

" use google style for clang-format
Glaive codefmt clang_format_style='google'

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" setup for colorscheme
set t_Co=256
set background=dark
colorscheme legacy

" setup for indent line
let g:indentLine_char = '│'
set ttimeoutlen=50

" Insert mode exit key map
inoremap jk <ESC>
