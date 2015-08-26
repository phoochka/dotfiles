set nocompatible
syntax enable
set nu
set showcmd

filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'

" colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'bling/vim-airline'

"" Vim fuzzy file finder ctrlp
Plug 'kien/ctrlp.vim'

Plug 'zefei/vim-colortuner'

call plug#end()

let g:neocomplcache_enable_at_startup = 1

filetype plugin indent on

set t_Co=256
set background=dark

colorscheme hybrid
""" if has("gui_running") colorscheme gruvbox endif

let g:airline_theme='tomorrow'

set guifont=Consolas:h13

"" Searching 
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive
set smartcase       " unless they contain at least one captial letter

"" Whitespace settings for Python
" set nowrap        " dont wrap lines
set shiftwidth=4    " a tab is two spaces
set tabstop=4
set expandtab       " use spaces not tabs

set showmatch       " show matching paranthesis

"" Hide pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"" auto open NERDTree if vim is started without any file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" NerdTree Toggle to Command+1. Works only in MacVim
map <D-1> :NERDTreeToggle<CR>




"" Read PDF files and wrap lines # NOT WOKRING :(
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"" Stop beeping!!
set noeb vb t_vb=
