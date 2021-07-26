call plug#begin()
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'dylanaraps/wal.vim'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'hoob3rt/lualine.nvim'
"Plug 'windwp/nvim-autopairs'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'lewis6991/gitsigns.nvim'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

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

" Debugger Remaps
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

" Setup lua
lua require("altffour")

" Setup theme.
set t_Co=256
let g:gruvbox_contrast_light="hard"
"let g:gruvbox_termcolors=16
"set background=light
colorscheme wal
"hi Pmenu ctermbg=gray
"hi PmenuSel ctermbg=white
"hi PmenuSbar ctermbg=black
"hi PmenuThumb ctermbg=black

" General
set textwidth=80
set clipboard+=unnamed
set autoread
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set magic
set tabstop=4

" LSP
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" LuaSnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Appearance
set number
set nowrap
set showbreak=↪
 " toggle invisible characters
set list
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:·
"set list
set ttyfast

" airline
let g:airline#extensions#tabline#enabled = 1

" Leader keys
let mapleader = " "
map <leader>e :bufdo e!<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Telescope
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

" Custom settings.
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
"set timeoutlen=50
syntax on
set rnu
