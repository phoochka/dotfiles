filetype plugin indent on

" To first get vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \

"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
" Plug 'xolox/vim-session'
" Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'

" Vim Airline and Airline Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'itchyny/lightline.vim'
" Plug 'cocopon/lightline-hybrid.vim'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Linting
Plug 'w0rp/ale'

" deoplete autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language specific plugs
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

Plug 'wting/rust.vim', { 'for': 'rust' }

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}


" Latex
Plug 'lervag/vimtex'


" colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'rakr/vim-one'
Plug 'trusktr/seti.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'easysid/mod8.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender'
Plug 'cseelus/vim-colors-lucid'
Plug 'albertorestifo/github.vim'
Plug 'cocopon/iceberg.vim'
Plug 'zanglg/nova.vim'

call plug#end()

set t_Co=256
" set background=dark

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme mod8

" set termguicolors
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check.
"For Neovim 0.1.5+ and Vim 7.4.1799+
if (has("termguicolors"))
    set termguicolors
endif

let g:airline_theme='tomorrow'
" let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0


set guifont=Consolas:h13

" let g:lightline = {
"       \ 'colorscheme': 'hybrid',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'modified' ],
"       \             [ 'absolutepath'] ]
"       \ },
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ }
"       \ }
"
" set laststatus=2

"" Make comments in italcis
" highlight Comment cterm=italic

syntax enable
set nocompatible
set nu
set showcmd
set title
set cursorline

"j/k should go up/down through VISIBLE lines, even if real lines wrap.
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"" Searching
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive
set smartcase       " unless they contain at least one capital letter

" Move text up and down
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
vnoremap <C-k> :m-2<CR>gv
vnoremap <C-j> :m'>+<CR>gv

"" Whitespace settings for Python
set shiftwidth=4
set tabstop=4
set expandtab       " use spaces not tabs

"" set nowrap        " don't wrap lines
set showmatch       " show matching parenthesis

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

"" Hide pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"" Disable swapfiles (!!!)
set noswapfile

"" Stop beeping
set noeb vb t_vb=

"" Change working directory and print it
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"" Read epubs
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto


" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" deoplete settings
let g:deoplete#enable_at_startup = 1
" set completeopt-=preview
autocmd CompleteDone * pclose

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" deoplete javascript
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

endif
  autocmd FileType javascript setlocal omnifunc=tern#Complete
