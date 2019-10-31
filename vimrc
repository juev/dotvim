let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

"Add your bundles here
Plug 'MattesGroeger/vim-bookmarks'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'juev/vim-hugo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ledger/vim-ledger'
Plug 'ntpeters/vim-better-whitespace'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/clever-f.vim'
Plug 'robertbasic/vim-hugo-helper'
Plug 'roxma/vim-tmux-clipboard'
Plug 'sheerun/vim-polyglot'
Plug 'shvechikov/vim-keymap-russian-jcukenmac'
Plug 'sjl/badwolf'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/bash-support.vim'

call plug#end()

" --- performance / buffer ---
set hidden                   " can put buffer to the background without writing
set lazyredraw               " don't update the display while executing macros
set ttyfast                  " Send more characters at a given time.
                             " to disk, will remember history/marks.
" --- history / file handling ---
set autoread                 " reload files if changed externally
set autowrite                " reload files if changed externally

set autoindent smartindent   " auto/smart indent
set cindent                  " Enables automatic C program indenting.
set nocopyindent             " Do not copy previous indentation on auto indent
set ruler                    " Show the line and column number of the cursor position,
                             " separated by a comma.
set cursorline               " Highlight current line
set splitbelow splitright    " how to split new windows.
set mousehide                " When on, the mouse pointer is hidden when characters are typed.
set wildmenu                 " Hitting TAB in command mode will
set wildmode=full            " Complete first full match, next match, etc.  (the default)
set switchbuf=useopen        " useopen If included, jump to the first open window that
                          " contains the specified buffer (if there is one).
set scrolloff=4              " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=4          " Start scrolling n chars before end of screen.

" --- remove sounds effects ---
set noerrorbells
set visualbell
set t_vb=

set foldcolumn=0             " Column with the specified width is shown at the side of the widow

" --- search / regexp ---
set magic                    " Enable extended regexes.
set hlsearch               " highlight searches
set ignorecase smartcase     " make searches case-insensitive, unless they
                             " contain upper-case letters
set incsearch                " show the `best match so far' astyped

set expandtab                " Expand tabs to spaces
set smarttab                 " At start of line, <Tab> inserts shift width
                             " spaces, <Bs> deletes shift width spaces.
set nowrap                   " no wrap lines
set laststatus=2             " Always show status line
" set guicursor=a:blinkwait0,a:block-cursor

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set nomodeline                 " don't use modeline (security)
set backspace=eol,start,indent " allow backspacing over everything.
set nostartofline              " Make j/k respect the columns
set softtabstop=4              " Tab key results in # spaces
set tabstop=4                  " Tab is # spaces
set shiftwidth=4               " The # of spaces for indenting.

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" timeout
setglobal timeoutlen=250 ttimeoutlen=10

set viminfo='100,n$HOME/.vim/viminfo

" persistent undo
set undofile
set undodir=~/.cache/vim/undodir

" clipboard system by default
" set clipboard+=unnamedplus

if exists('+breakindent')
  set breakindent showbreak=\ +
endif

if exists('+macmeta')
  setglobal macmeta
endif

let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

if has('mac') || has('unix')
  set shell=bash
endif

" Colors
set t_Co=256

" Visual
if filereadable(expand("~/.vim/plugged/badwolf/README.markdown"))
  colorscheme badwolf
endif

" Keymap
if filereadable(expand("~/.vim/plugged/vim-keymap-russian-jcukenmac/README.md"))
  set keymap=russian-jcukenmac iminsert=0 imsearch=0
endif
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Keys
" Change mapleader (easier to type), at the top since its used everywhere
let mapleader="\<Space>"
let maplocalleader="\<Space>"

no ' ,

" Toggle paste mode
no <silent> <F4> :set invpaste<CR>:set paste?<CR>
ino <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
no <leader><leader> <c-^>

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

" nn <silent> <BS> :noh<CR> :let @/=""<CR>
nn <silent> <BS> :noh<CR>
nn S :%s//g<LEFT><LEFT>

command! Q q
command! W w

cmap w!! w !sudo tee > /dev/null %

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

map <Leader>ev :edit $MYVIMRC<CR>
map <Leader>es :source $MYVIMRC<CR>

" Keys for clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set signcolumn=yes

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#ale#enabled = 1

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Ansible
let g:ansible_unindent_after_newline = 1

" Diff
if &diff
    set cursorline
    map ] ]c
    map [ [c
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
    set diffopt+=iwhite
    set diffexpr=""
endif

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1

" Rust
let g:rustfmt_autosave = 1
let g:racer_cmd = "~/.cargo/bin/racer"

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altfile = 1

" fzf
nnoremap ; :Buffers<CR>
nnoremap ;; <c-^>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>s :Rg<Space>

" This is the default extra key bindings
let g:fzf_layout = { 'down': '~40%' }

" vim-rooter
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Better whitespace
let g:better_whitespace_filetypes_blacklist = ['vlime_input', 'quickrun', 'diff', 'gitcommit', 'unite', 'qf', 'help']
let g:better_whitespace_enabled = 1

" Ale
set omnifunc=ale#completion#OmniFunc
let g:ale_pattern_options = {
\   '.*\.yaml$': {'ale_enabled': 0},
\   '.*\.yml$': {'ale_enabled': 0},
\}

" clever_f
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000
