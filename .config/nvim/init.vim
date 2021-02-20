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
colorscheme wal
let g:airline_themes='onedark'

" Setup Global Settings
set textwidth=80
let mapleader = " "
set nowrap
set clipboard+=unnamed


" Plugin Settings
autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>

" Leader keys
map <leader>e :bufdo e!<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Custom settings.
set mouse=a
set number
set encoding=utf-8
set backspace=indent,eol,start
set timeoutlen=50
syntax on
set rnu
