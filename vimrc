let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

"Add your bundles here
Plug 'MattesGroeger/vim-bookmarks'
Plug 'WolfgangMehner/bash-support'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'jceb/vim-orgmode'
Plug 'jreybert/vimagit'
Plug 'juev/vim-hugo'
Plug 'juev/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ledger/vim-ledger'
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

call plug#end()


let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Colors
set t_Co=256

" Visual
if filereadable(expand("~/.vim/plugged/badwolf/README.markdown"))
    colorscheme badwolf
endif

" Keymap
set keymap=russian-jcukenmac iminsert=0 imsearch=0

" Keys
let mapleader="\<Space>"
let maplocalleader="\<Space>"

no <silent> <Leader>1 :set invnumber<CR>
" ino <silent> <Leader>1 :set invnumber<CR>

" Toggle paste mode
no <silent> <Leader>4 :set invpaste<CR>:set paste?<CR>
" ino <silent> <Leader>4 <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
no <leader><leader> <C-^>

no j gj
no k gk

" Visual shifting (does not exit Visual mode)
vn < <gv
vn > >gv

nn Y y$

no <silent> <leader>0 <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

vn Q gq
nn Q gqap

nn <leader>fef gg=G

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

command! Q q
command! W w

cmap w!! w !sudo tee > /dev/null %

" format json by =j
vmap =j :%!python -m json.tool<CR>

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Ansible
let g:ansible_unindent_after_newline = 1

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
" nnoremap ; :Buffers<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>s :Rg<Space>

" This is the default extra key bindings
let g:fzf_layout = { 'down': '~40%' }

if executable('fd')
  let $FZF_DEFAULT_COMMAND = 'fd --type f --color=never'
endif

" vim-rooter
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" Better whitespace
let g:better_whitespace_filetypes_blacklist = ['vlime_input', 'quickrun', 'diff', 'gitcommit', 'unite', 'qf', 'help']
let g:better_whitespace_enabled = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" neomake
call neomake#configure#automake('nrwi', 500)

" org-mode
let g:org_agenda_files = ['~/Dropbox/Apps/org/inbox.org','~/Dropbox/Apps/org/private.org', '~/Dropbox/Apps/org/work.org']
