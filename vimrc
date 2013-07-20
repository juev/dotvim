runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
syntax on
filetype plugin indent on

set hid ai aw ar lbr lz tf confirm wmnu wim=full swb=useopen so=8 siso=8 noeb vb t_vb= fdc=1 nosb
set nohlsearch ignorecase smartcase incsearch
set laststatus=2 shortmess=atI showcmd
set gcr=a:blinkwait0,a:block-cursor
set timeoutlen=250
set nobackup nowritebackup noswapfile
set modeline modelines=0
set noesckeys
nnoremap / /\v
vnoremap / /\v

set encoding=utf-8

set list
set listchars=tab:▸\ ,trail:. ",eol:¬ " alternative character for end of line -> ¶
map <silent> <F12> :set invlist<CR>

set t_Co=256
let g:solarized_termcolors=256    "default value is 16
" let g:solarized_visibility="low"    "default value is normal
syntax enable
set background=dark
colorscheme solarized

" Keys
let mapleader=","
let localmapleader=",,"
" ino jj <ESC>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

set keymap=russian-jcukenmac iminsert=0 imsearch=0
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
nn <leader><leader> <c-^>

" nn ; :
" nn \ ;

map j gj
map k gk
" map <silent> // :noh<CR>

"Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

inoremap <S-TAB> <C-X><C-O>

nn  <silent> vv    <C-w>v
nn  <silent> ss    <C-w>s
map <silent> <D-0> <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

" let g:ctrlp_map = '<leader>t'
no <silent> <Leader>b :CtrlPBuffer<CR>
no <silent> <Leader>1 :CtrlPBuffer<CR>
no <silent> <Leader>2 :CtrlP<CR>
no <silent> <Leader>t :CtrlP<CR>

no <Leader>a :Ack<Space>
no <D-F>     :Ack<Space>

" don't use Ex-mode
nn Q <nop>

nmap <leader>fef ggVG=
cmap w!! %!sudo tee > /dev/null %

let g:is_posix = 1
" let g:Powerline_symbols = 'fancy'
let delimitMate_autoclose = 0

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
