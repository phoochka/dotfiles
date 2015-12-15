set nocompatible
syntax enable
set nu
set showcmd
set title
set cursorline

filetype plugin indent on

" To first get vim-plug: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ 
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Valloric/YouCompleteMe'

" Language specific plugs
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " outdated

" WTF is this I dont remember
Plug 'zefei/vim-colortuner'

" Integration with Simplenote
Plug 'mrtazz/simplenote.vim'

" colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

set t_Co=256
set background=dark

" let g:hybrid_use_Xresources = 1
colorscheme hybrid

let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

"" Patched font for Airline powerline fonts
set guifont=Powerline\ Consolas:h13
"" set guifont=Consolas:h13

"j/k should go up/down through VISIBLE lines, even if real lines wrap.
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"" Searching 
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive
set smartcase       " unless they contain at least one captial letter

" Move text up and down
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
vnoremap <C-k> :m-2<CR>gv
vnoremap <C-j> :m'>+<CR>gv

"" Whitespace settings for Python
"" set nowrap        " dont wrap lines
set shiftwidth=4    
set tabstop=4
set expandtab       " use spaces not tabs

set showmatch       " show matching paranthesis

" Navigate between splits with ctrl+hjkl
" noremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" move text up and down
nnoremap <c-up> :m-2<CR>
nnoremap <c-down> :m+<CR>
vnoremap <c-up> :m-2<CR>gv
vnoremap <c-down> :m'>+<CR>gv

"" enable jsx highlighting in js files
let g:jsx_ext_required = 0

let g:syntastic_javascript_checkers = ['eslint']

"" Hide pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"" auto open NERDTree if vim is started without any file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" NerdTree Toggle to Command+1. Works only in MacVim
map <D-1> :NERDTreeToggle<CR>

"" Read PDF files and wrap lines # NOT WOKRING :(
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"" Disable swapfiles (!!!)
set noswapfile

"" Stop beeping!!
set noeb vb t_vb=

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
