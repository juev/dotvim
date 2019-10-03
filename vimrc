let $LANG = 'en'
set runtimepath^=~/.vim

" vim-plug
call plug#begin('~/.vim/plugged')

"Add your bundles here
Plug 'MattesGroeger/vim-bookmarks'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'juev/vim-jekyll'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'racer-rust/vim-racer'
Plug 'sheerun/vim-polyglot'
Plug 'shvechikov/vim-keymap-russian-jcukenmac'
Plug 'sjl/badwolf'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

set autoread
set autowrite

" --- performance / buffer ---
set lazyredraw               " don't update the display while executing macros

set cursorline               " Highlight current line
set splitbelow splitright    " how to split new windows.
set mousehide                " When on, the mouse pointer is hidden when characters are typed.
set wildmenu
set wildmode=full
set scrolloff=4              " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=4          " Start scrolling n chars before end of screen.

" --- remove sounds effects ---
set noerrorbells
set visualbell
set t_vb=

" --- search / regexp ---
set magic                    " Enable extended regexes.
set hlsearch                 " highlight searches
set ignorecase smartcase     " make searches case-insensitive, unless they
                             " contain upper-case letters
set expandtab                " Expand tabs to spaces
set nowrap                   " no wrap lines

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set nomodeline                 " don't use modeline (security)
set nostartofline              " Make j/k respect the columns
set softtabstop=4              " Tab key results in # spaces
set tabstop=4                  " Tab is # spaces
set shiftwidth=4               " The # of spaces for indenting.

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" timeout
setglobal timeoutlen=250 ttimeoutlen=10

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

let g:jekyll_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Colors
set t_Co=256

" Visual
colorscheme badwolf

" Keymap
if filereadable(expand("~/.cache/dein/repos/github.com/shvechikov/vim-keymap-russian-jcukenmac/README.md"))
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

" no <space> :

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

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Keys for clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set signcolumn=yes

" Airline
" let g:airline#extensions#tabline#enabled = 1
if has('mac')
  let g:airline_powerline_fonts = 1
endif
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
au BufRead,BufNewFile */defaults/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */tasks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */handler/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */*_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */*ansible*/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */inventory/*.yml set filetype=yaml.ansible

" Diff
if &diff
    set cursorline
    map ] ]c
    map [ [c
    " hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    " hi DiffChange ctermbg=233  guibg=#ececec gui=none   cterm=none
    " hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
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

" Rust
let g:rustfmt_autosave = 1
let g:racer_cmd = "~/.cargo/bin/racer"

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
nmap <silent> <Leader>< <Plug>(ale_previous_wrap)
nmap <silent> <Leader>> <Plug>(ale_next_wrap)
nmap <silent> <Leader>? <Plug>(ale_detail)

let g:ale_pattern_options = {
\   '.*\.yaml$': {'ale_enabled': 0},
\   '.*\.yml$': {'ale_enabled': 0},
\}

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altfile = 1

" fzf
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>f :Files<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
