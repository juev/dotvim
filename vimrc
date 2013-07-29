let $LANG = 'en'
set runtimepath^=~/.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Add your bundles here
Bundle 'vim-scripts/L9'
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'shvechikov/vim-keymap-russian-jcukenmac'

filetype plugin indent on
syntax on

set nocp hid aw ar ai nosi nocin lbr lz tf confirm ru cul sb spr mh
set wmnu wim=full swb=useopen so=8 siso=8
set noeb vb t_vb= fdc=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab "nowrap
set laststatus=2 shortmess=atI showcmd
set gcr=a:blinkwait0,a:block-cursor
set noto ttimeout ttimeoutlen=100
set nobackup nowritebackup noswapfile
set modeline modelines=0
set noesckeys
set nrformats=
set backspace=eol,start,indent
set modelines=0

set encoding=utf-8

set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:+
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  set listchars=tab:▸\ ,trail:. ",eol:¬ " alternative character for end of line -> ¶
endif
map <silent> <F12> :set invlist<CR>

let g:is_posix = 1

set t_Co=256
let g:solarized_termcolors=256    "default value is 16
" let g:solarized_visibility="low"    "default value is normal
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
let mapleader=","
no ' ,
ino <C-k> <Esc>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
nn <leader><leader> <c-^>

nmap <space> :

map j gj
map k gk

nn  <silent> vv    <C-w>v
nn  <silent> ss    <C-w>s
map <silent> <leader>0 <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

no <silent> <Leader>b :CtrlPBuffer<CR>
no <silent> <Leader>t :CtrlP<CR>

no <Leader>a :Ack<Space>

vmap Q gq
nmap Q gqap

nmap <leader>fef gg=G
cmap w!! %!sudo tee > /dev/null %
