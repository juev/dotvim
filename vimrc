if has('win32') || has('win64')
  set runtimepath^=~/.vim
endif

source ~/.vim/vundle.vim

filetype off
filetype plugin on
syntax on

set nocp hid aw ar ai nosi nocin lbr lz tf confirm ru cul sb spr mh
set wmnu wim=full swb=useopen so=8 siso=8
set noeb vb t_vb= fdc=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab nowrap
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
set listchars=tab:▸\ ,trail:. ",eol:¬ " alternative character for end of line -> ¶
map <silent> <F12> :set invlist<CR>

let g:is_posix = 1

set t_Co=256
let g:solarized_termcolors=256    "default value is 16
" let g:solarized_visibility="low"    "default value is normal
syntax enable
set background=dark
colorscheme solarized

" Keys
set keymap=russian-jcukenmac iminsert=0 imsearch=0
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

let mapleader=","

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
