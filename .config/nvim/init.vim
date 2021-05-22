call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'
Plug 'glepnir/lspsaga.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Neovim Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" debugging
Plug 'puremourning/vimspector'

call plug#end()
filetype plugin indent on

" Setup lua
lua require("altffour")


" Setup theme.
set t_Co=256
hi Pmenu ctermbg=white
hi PmenuSel ctermbg=gray
hi PmenuSbar ctermbg=black
hi PmenuThumb ctermbg=black

" General
set textwidth=80
set clipboard+=unnamed
set autoread
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set magic

" LSP
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

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
let mapleader = " "
map <leader>e :bufdo e!<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Custom settings.
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
"set timeoutlen=50
syntax on
set rnu
