let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'fatih/vim-go'
Plug 'juev/vim-hugo'
Plug 'ledger/vim-ledger'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Colors
set t_Co=256
set background=dark
" Theme
colorscheme badwolf

set shortmess+=I

" Keymap
set keymap=russian-jcukenmac iminsert=0 imsearch=0
set clipboard=unnamed
vnoremap p "_dP

" Keys
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Remap escape
inoremap <C-C> <Esc>

noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

" Visual shifting (does not exit Visual mode)
vn < <gv
vn > >gv

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

cmap w!! w !sudo tee > /dev/null %

" vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline_powerline_fonts = 1

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Netrw
let g:netrw_altfile = 1

" vim-rooter
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

" ledger
let g:ledger_bin = 'hledger'
let g:ledger_accounts_cmd = 'cat ~/.hledger-accounts'
let g:ledger_descriptions_cmd = 'cat ~/.hledger-descriptions'
