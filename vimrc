let $LANG = 'en'
set runtimepath^=~/.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
"Add your bundles here
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'henrik/rename.vim'
Plugin 'Juev/vim-jekyll'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/syntastic'
Plugin 'shvechikov/vim-keymap-russian-jcukenmac'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/paredit.vim'

if has('mac') || has('unix')
  Plugin 'editorconfig/editorconfig-vim'
  " For using this plugin, install https://github.com/powerline/fonts
  " Plugin 'bling/vim-airline'
  " let g:airline_powerline_fonts = 1
end

filetype plugin indent on
syntax on

set nocompatible hidden autowrite autoread autoindent nosmartindent nocindent 
set linebreak lazyredraw ttyfast confirm ruler cursorline splitbelow splitright mousehide
set wildmenu wildmode=full switchbuf=useopen scrolloff=8 sidescrolloff=8
set noerrorbells visualbell t_vb= foldcolumn=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab nowrap
set laststatus=0
set guicursor=a:blinkwait0,a:block-cursor
set nobackup nowritebackup noswapfile
set modeline modelines=0
set nrformats=
set backspace=eol,start,indent
set modelines=0
set tabstop=4 shiftwidth=4

scriptencoding utf-8
set encoding=utf-8
if has('mac') || has('unix')
  set shell=bash
endif

set t_Co=256
let g:solarized_termcolors=256    "default value is 16
syntax enable
set background=dark
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/README.mkd"))
  colorscheme solarized
endif

" Keys
if filereadable(expand("~/.vim/bundle/vim-keymap-russian-jcukenmac/README.md"))
  set keymap=russian-jcukenmac iminsert=0 imsearch=0
endif
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

mapclear
let mapleader="-"
no ' ,
ino <C-j> <Esc>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
nn <leader><leader> <c-^>

nmap <space> :

map j gj
map k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

nnoremap Y y$

nn  <silent> vv    <C-w>v
nn  <silent> ss    <C-w>s
map <silent> <leader>0 <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

vmap Q gq
nmap Q gqap

nmap <leader>fef gg=G
"map w!! %!sudo tee > /dev/null %

nmap <silent> <BS> :nohlsearch<CR>
nmap S :%s//g<LEFT><LEFT>

let g:jekyll_path = "~/Projects/juev.org/source"
