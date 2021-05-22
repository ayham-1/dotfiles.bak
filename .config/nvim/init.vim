call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

" Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()
filetype plugin indent on

" Setup theme.
set t_Co=256
"colorscheme wal

" General
set textwidth=80
let mapleader = " "
set clipboard+=unnamed
set autoread
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set magic

" Appearance
set number
set nowrap
set showbreak=↪
 " toggle invisible characters
set list
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:·
set list
set ttyfast

" Leader keys
map <leader>e :bufdo e!<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Custom settings.
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
set timeoutlen=50
syntax on
set rnu
