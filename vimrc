let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" --- performance / buffer ---
set hidden                   " can put buffer to the background without writing
set lazyredraw               " don't update the display while executing macros
set ttyfast                  " Send more characters at a given time.
                             " to disk, will remember history/marks.
" --- history / file handling ---
set autoread                 " reload files if changed externally

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
set switchbuf=useopen        " useopen	If included, jump to the first open window that
			                       " contains the specified buffer (if there is one).
set scrolloff=4              " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=4          " Start scrolling n chars before end of screen.

" --- remove sounds effects ---
set noerrorbells
set visualbell
set t_vb=

set foldcolumn=2             " Column with the specified width is shown at the side of the widow

" --- search / regexp ---
set magic                    " Enable extended regexes.
set hlsearch                 " highlight searches
set ignorecase smartcase     " make searches case-insensitive, unless they
                             " contain upper-case letters
set incsearch                " show the `best match so far' astyped

set expandtab                " Expand tabs to spaces
set smarttab                 " At start of line, <Tab> inserts shift width
                             " spaces, <Bs> deletes shift width spaces.
" set nowrap                   " wrap lines
set laststatus=2             " Always show status line
set guicursor=a:blinkwait0,a:block-cursor

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set nomodeline                 " don't use modeline (security)
set backspace=eol,start,indent " allow backspacing over everything.
set esckeys                    " Allow cursor keys in insert mode.
set nostartofline              " Make j/k respect the columns
set softtabstop=2              " Tab key results in # spaces
set tabstop=2                  " Tab is # spaces
set shiftwidth=2               " The # of spaces for indenting.

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

set viminfo='100,n$HOME/.vim/viminfo

mapclear

if !has("gui_running")
  set nocursorline
end

let g:jekyll_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,koi8-r

if has('mac') || has('unix')
  set shell=bash
endif

call plug#begin('~/.vim/plugged')

"Add your bundles here

Plug 'Juev/vim-jekyll'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aperezdc/vim-template'
Plug 'b4b4r07/vim-ansible-vault'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'henrik/rename.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'racer-rust/vim-racer'
Plug 'reedes/vim-one'
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'
Plug 'shvechikov/vim-keymap-russian-jcukenmac'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'will133/vim-dirdiff'
if has('mac') || has('unix')
  Plug 'editorconfig/editorconfig-vim'
end

call plug#end()

" Colors
set t_Co=256
syntax enable

if filereadable(expand("~/.vim/plugged/papercolor-theme/README.md"))
  set background=dark
  colorscheme PaperColor
endif

" Keymap
if filereadable(expand("~/.vim/plugged/vim-keymap-russian-jcukenmac/README.md"))
  set keymap=russian-jcukenmac iminsert=0 imsearch=0
endif
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Keys
" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

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

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Commentary
nmap <Leader>c :Commentary<CR>
vmap <Leader>c :Commentary<CR>

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Airline
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='papercolor'

" Vim-Rooter
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Anibsle
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

" Ansible-Vault
let g:ansible_vault_password_file = '~/.vault_pass'

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

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

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'haskell': ['hfmt'],
\}
let g:ale_linters = {
\   'haskell': ['stack-ghc', 'hlint'],
\}

nmap <silent> <Leader><  <Plug>(ale_previous_wrap)
nmap <silent> <Leader>>  <Plug>(ale_next_wrap)
nmap <silent> <Leader>? <Plug>(ale_detail)

" Clang-format
" map to <Leader>cf in C++ code
autocmd FileType c,cc,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cc,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cc,cpp,objc ClangFormatAutoEnable
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 0
let g:netrw_winsize = 25
autocmd FileType netrw setl bufhidden=wipe

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :History<CR>
nnoremap <leader>f :Files<CR>
