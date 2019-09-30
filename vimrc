let $LANG = 'en'
set runtimepath^=~/.vim

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " call dein#add('jiangmiao/auto-pairs')
  call dein#add('MattesGroeger/vim-bookmarks')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('SirVer/ultisnips')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('airblade/vim-rooter')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('aperezdc/vim-template')
  call dein#add('b4b4r07/vim-ansible-vault')
  call dein#add('dense-analysis/ale')
  call dein#add('fatih/vim-go')
  call dein#add('godlygeek/tabular')
  call dein#add('guns/vim-sexp')
  call dein#add('honza/vim-snippets')
  call dein#add('juev/vim-jekyll')
  call dein#add('junegunn/fzf', { 'build': './install --bin', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/rainbow_parentheses.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('kshenoy/vim-signature')
  call dein#add('mileszs/ack.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('shvechikov/vim-keymap-russian-jcukenmac')
  call dein#add('sonph/onehalf', {'rtp': 'vim/'})
  call dein#add('thinca/vim-quickrun')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tomtom/tlib_vim')
  call dein#add('tpope/vim-apathy')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-sleuth')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-vinegar')
  call dein#add('tweekmonster/startuptime.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('wellle/targets.vim')
  call dein#add('will133/vim-dirdiff')
  call dein#add('wsdjeg/dein-ui.vim')
  if has('mac') || has('unix')
    call dein#add('editorconfig/editorconfig-vim')
  end

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" --- performance / buffer ---
" set hidden                   " can put buffer to the background without writing
set lazyredraw               " don't update the display while executing macros
set ttyfast                  " Send more characters at a given time.
                             " to disk, will remember history/marks.
" --- history / file handling ---
set autoread                 " reload files if changed externally
set autowrite                " autowite when changing file

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
set hlsearch                 " highlight searches
set ignorecase smartcase     " make searches case-insensitive, unless they
                             " contain upper-case letters
set incsearch                " show the `best match so far' astyped

set expandtab                " Expand tabs to spaces
set smarttab                 " At start of line, <Tab> inserts shift width
                             " spaces, <Bs> deletes shift width spaces.
set nowrap                   " no wrap lines
set laststatus=2             " Always show status line
set guicursor=a:blinkwait0,a:block-cursor

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

set viminfo='100,n$HOME/.vim/viminfo

" timeout
set timeoutlen=250 ttimeoutlen=0

" persistent undo
set undofile
set undodir=~/.vim/undodir

mapclear

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

if has('mac') || has('unix')
  set shell=bash
endif


" Colors
set t_Co=256
syntax enable

colorscheme default

if has("gui_running")
  if filereadable(expand("~/.cache/dein/repos/github.com/altercation/vim-colors-solarized/README.mkd"))
    set background=light
    set termguicolors
    colorscheme solarized
  endif
end

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

no <silent> <Leader>q :BW<CR>
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

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Airline
if has("gui_running")
  let g:airline_powerline_fonts = 1
end
" let g:airline#extensions#tabline#enabled = 1
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

" Ansible-Vault
let g:ansible_vault_password_file = '~/.vault_pass'

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
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading'
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

" Visual
colorscheme onehalfdark
autocmd ColorScheme * highlight Normal ctermfg=grey ctermbg=black
autocmd ColorScheme * highlight Comment ctermfg=33
let g:airline_powerline_fonts = 1

" Auto-Save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

