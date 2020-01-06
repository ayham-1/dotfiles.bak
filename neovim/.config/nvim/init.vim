call plug#begin()
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdTree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()
filetype plugin indent on

" Setup theme.
set t_Co=256
let g:airline_themes='onedark'

" Setup Global Indentation
set shiftwidth=4
set tabstop=4
set autoindent

" Language specific Indentation
autocmd Filetype cpp setlocal expandtab cindent smartindent tabstop=4 shiftwidth=4
autocmd Filetype python setlocal expandtab tabstop=8 shiftwidth=4

" .tpp as cpp
autocmd BufEnter *.tpp :setlocal filetype=cpp

" .py as python
autocmd BufEnter *.py :setlocal filetype=python

" Custom settings.
set mouse=a
set number
set encoding=utf-8
set backspace=indent,eol,start
set ttimeoutlen=50
syntax on

" KeyBinds.
inoremap <expr><C-j> pumvisible()? "\<C-n>":"\<C-j>"
inoremap <expr><C-k> pumvisible()? "\<C-p>":"\<C-k>"
nmap <C-n> :NERDTreeToggle<CR>
inoremap jk <ESC>

" open NERDTree automatically when neovim starts up on opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
