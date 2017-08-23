filetype plugin indent on

" To first get vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \

"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround' " example: cs'<div>
" Plug 'xolox/vim-session'
" Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'

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
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

Plug 'othree/html5.vim', { 'for': 'html' }

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

" checking colors
Plug 'ap/vim-css-color'

" Latex
Plug 'lervag/vimtex'

" colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-two-firewatch'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'

" Plug 'trusktr/seti.vim'
" Plug 'whatyouhide/vim-gotham'
" Plug 'morhetz/gruvbox'
" Plug 'sjl/badwolf'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'cseelus/vim-colors-lucid'
" Plug 'cocopon/iceberg.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'larsbs/vimterial'
" Plug 'sstallion/vim-wtf'

call plug#end()

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1

" let ayucolor="light"
let ayucolor="mirage"
" let ayucolor="dark"
"
set bg=dark
colorscheme two-firewatch


if (has("termguicolors"))
    set termguicolors
endif

let g:airline_theme='tomorrow'
" let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

let g:airline_section_error = ''
let g:airline_section_warning = ''

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

"" sandwich
cmap w!! w !sudo tee % > /dev/null

" Move text up and down
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
vnoremap <C-k> :m-2<CR>gv
vnoremap <C-j> :m'>+<CR>gv

nnoremap <c-up>   :m-2<CR>
nnoremap <c-down> :m+<CR>
vnoremap <c-up>   :m-2<CR>gv
vnoremap <c-down> :m'>+<CR>gv

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

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>

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

" java autocomplete

autocmd FileType java setlocal omnifunc=javacomplete#Complete<Paste>

" javascript settings
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

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
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
	let g:tern_show_argument_hints = 'on_hold'
	let g:tern_show_signature_in_pum = 1

endif
autocmd FileType javascript setlocal omnifunc=tern#Complete

" ale options
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1

let g:ale_linters = {
			\   'html': ['htmlhint'],
			\}

" " IndentLine {{
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" " }}

" ripgrep search
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --color: Search color options
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
