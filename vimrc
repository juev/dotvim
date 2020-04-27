let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aperezdc/vim-template'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'juev/vim-hugo'
Plug 'juev/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'latex-box-team/latex-box'
Plug 'ledger/vim-ledger'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/git-messenger.vim'
Plug 'rust-lang/rust.vim'
Plug 'sjl/badwolf'
Plug 'sjl/clam.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'wellle/targets.vim'

call plug#end()

let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Colors
set t_Co=256
set background=dark

set shortmess+=I

" Visual
if filereadable(expand("~/.vim/plugged/badwolf/README.markdown"))
    colorscheme badwolf
endif

" Keymap
set keymap=russian-jcukenmac iminsert=0 imsearch=0

" Keys
" let mapleader="\<Space>"
" let maplocalleader="\<Space>"
let mapleader=","
let maplocalleader=","

no <silent> <Leader>1 :set invnumber<CR>

" Toggle paste mode
no <silent> <Leader>4 :set invpaste<CR>:set paste?<CR>

" no <silent> <Leader>q :bw<CR>
" no <silent> <leader>w :w!<CR>
no <leader><leader> <C-^>

no j gj
no k gk

" Visual shifting (does not exit Visual mode)
vn < <gv
vn > >gv

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

nnoremap <leader>eg :vsplit ~/.gitconfig<cr>
nnoremap <leader>eh :vsplit ~/Projects/Github/hledger/2019.journal<cr>

" Clipboard functionality (paste from system)
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

vnoremap p "_dP
vnoremap <leader>d "_d
nnoremap <leader>d "_d

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline_powerline_fonts = 1

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
" let g:racer_cmd = "~/.cargo/bin/racer"

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altfile = 1

" fzf
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>s :Rg<Space>

nnoremap <leader>f :Files<CR>

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

" vim-template
let g:username = "Denis Evsyukov"
let g:email = "@juev"
let g:templates_no_autocmd = 1

" trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" vimgo
set mouse=a
set ttymouse=sgr
set updatetime=500
set balloondelay=250
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

inoremap <silent><expr> <c-space> coc#refresh()

" coc
let g:coc_global_extensions = ['coc-marketplace']
let g:coc_global_extensions+= ['coc-go', 'coc-rust-analyzer', 'coc-yaml', 'coc-lists']

" ale
let g:ale_yaml_yamllint_options = "{extends: relaxed, rules: {line-length: {max: 120}}}"
