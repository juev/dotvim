let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible hidden autowrite autoread autoindent nosmartindent nocindent
set linebreak lazyredraw ttyfast confirm ruler cursorline splitbelow splitright mousehide
set wildmenu wildmode=full switchbuf=useopen scrolloff=8 sidescrolloff=8
set noerrorbells visualbell t_vb= foldcolumn=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab nowrap
set laststatus=2
set guicursor=a:blinkwait0,a:block-cursor
set nobackup nowritebackup noswapfile
set modeline modelines=0
set nrformats=
set backspace=eol,start,indent
set tabstop=4 shiftwidth=4
set viminfo='100,n$HOME/.vim/viminfo

mapclear

if !has("gui_running")
  set nocursorline
end

let g:jekyll_path = "~/Projects/juev.org/source"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

if has('mac') || has('unix')
  set shell=bash
endif

call plug#begin('~/.vim/plugged')

"Add your bundles here

Plug 'Juev/vim-jekyll'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aperezdc/vim-template'
Plug 'b4b4r07/vim-ansible-vault'
Plug 'bhurlow/vim-parinfer'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'henrik/rename.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install  --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'l04m33/vlime', {'rtp': '~/.vim/'}
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pearofducks/ansible-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'shvechikov/vim-keymap-russian-jcukenmac'
Plug 'sjl/badwolf'
Plug 'srcery-colors/srcery-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/startuptime.vim'
Plug 'vhdirk/vim-cmake'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
if has('mac') || has('unix')
  Plug 'editorconfig/editorconfig-vim'
end

call plug#end()

" Colors
set t_Co=256
syntax enable

if filereadable(expand("~/.vim/plugged/badwolf/README.markdown"))
  colorscheme badwolf
endif

" Keymap
if filereadable(expand("~/.vim/plugged/vim-keymap-russian-jcukenmac/README.md"))
  set keymap=russian-jcukenmac iminsert=0 imsearch=0
endif
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Keys
let g:mapleader=","
no ' ,
ino <C-j> <Esc>
vn <C-j> <Esc>

" Toggle paste mode
no <silent> <F4> :set invpaste<CR>:set paste?<CR>
ino <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :BW<CR>
no <silent> <leader>w :w!<CR>
no <leader><leader> <c-^>

no <space> :

no j gj
no k gk

" Visual shifting (does not exit Visual mode)
vn < <gv
vn > >gv

nn Y y$

nn <silent> vv    <C-w>v
nn <silent> ss    <C-w>s
no <silent> <leader>0 <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

vn Q gq
nn Q gqap

nn <leader>fef gg=G

nn <silent> <BS> :nohlsearch<CR>
nn S :%s//g<LEFT><LEFT>

cmap w!! w !sudo tee > /dev/null %

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Commentary
nmap <Leader>c :Commentary<CR>
vmap <Leader>c :Commentary<CR>

" NERDTree
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
set rtp+=~/.fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
set updatetime=100

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0

" Vim-Rooter
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Ansible-Vault
let g:ansible_vault_password_file = '~/.vault_pass'

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-template
let g:username = "Denis Evsyukov"
let g:templates_no_builtin_templates = 1
let g:templates_directory = ['~/.vim/templates/']

" DelimitMate
let delimitMate_expand_cr = 1

" Diff
if &diff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=233  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif
