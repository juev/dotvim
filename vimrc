runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
syntax on
filetype plugin indent on

set hid ai aw ar lbr lz confirm wmnu wim=full swb=useopen so=8 vb fdc=1
set hlsearch ignorecase smartcase incsearch
set laststatus=2 shortmess=atI showcmd
set gcr=a:blinkwait0,a:block-cursor
set timeoutlen=250
set nobackup nowritebackup noswapfile
set modeline modelines=5

set list
set listchars=tab:\ ⌁,trail:.,extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

let g:solarized_termcolors=256    "default value is 16
" let g:solarized_visibility="low"    "default value is normal
syntax enable
set background=dark
colorscheme solarized

let g:is_posix = 1

" Keys
let mapleader=","
" let localmapleader="	"

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

set keymap=russian-jcuken iminsert=0 imsearch=0

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>

map j gj
map k gk
map <silent> // :noh<CR>

" ino jk      <Esc>

nn  <silent> vv    <C-w>v
nn  <silent> ss    <C-w>s
map <silent> <D-0> <C-w>o

vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

nnoremap <D-/> :TComment<CR>
vnoremap <D-/> :TComment<CR>

" let g:ctrlp_map = '<leader>t'
nno <silent> <Leader>b :CtrlPBuffer<CR>
nno <silent> <Leader>1 :CtrlPBuffer<CR>
nno <silent> <Leader>2 :CtrlP<CR>
nno <silent> <Leader>t :CtrlP<CR>

nmap <leader>fef ggVG=
cmap w!! %!sudo tee > /dev/null %

let g:Powerline_symbols = 'fancy'
