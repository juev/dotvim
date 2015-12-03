let $LANG = 'en'
set runtimepath^=~/.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
"Add your bundles here
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shvechikov/vim-keymap-russian-jcukenmac'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/paredit.vim'

filetype plugin indent on
syntax on

set nocp hid aw ar ai nosi nocin lbr lz tf confirm ru cul sb spr mh
set wmnu wim=full swb=useopen so=8 siso=8
set noeb vb t_vb= fdc=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab nowrap
set laststatus=2 shortmess=atI showcmd
set gcr=a:blinkwait0,a:block-cursor
set nobackup nowritebackup noswapfile
set modeline modelines=0
set nrformats=
set backspace=eol,start,indent
set modelines=0
set tabstop=4 shiftwidth=4

scriptencoding utf-8
set encoding=utf-8
if has("unix")
  set shell=bash
endif

"set list
"set listchars=tab:\ ·,eol:¬
"set listchars=trail:·
"set listchars+=extends:»,precedes:«
"map <silent> <F12> :set invlist<CR>

" let g:syntastic_mode_map = { 'mode': 'passive',
"       \ 'active_filetypes': ['go'] }

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
let mapleader="-"
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

map <Leader>n :NERDTreeToggle<CR>

vmap Q gq
nmap Q gqap

nmap <leader>fef gg=G
"map w!! %!sudo tee > /dev/null %
