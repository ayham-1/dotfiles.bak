call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'dylanaraps/wal.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'mizlan/vim-and-cp'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'Vimjas/vim-python-pep8-indent'
" Debugging plugins
Plug 'realaltffour/comprog.nvim', { 'branch': 'test' }
"Plug '~/.config/nvim/plugged/comprog.nvim'
call plug#end()
filetype plugin indent on

" Setup theme.
set t_Co=256
"colorscheme wal
let g:airline_themes='onedark'

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
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:·
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
