let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'benwainwright/fzf-project'
Plug 'buoto/gotests-vim'
Plug 'fatih/vim-go'
Plug 'juev/vim-hugo'
Plug 'juev/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'ledger/vim-ledger'
Plug 'lifepillar/vim-solarized8'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has("nvim")
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'kyazdani42/nvim-web-devicons'

    " git
    Plug 'nvim-lua/plenary.nvim'
    Plug 'sindrets/diffview.nvim'
    Plug 'TimUntersberger/neogit'
endif

call plug#end()

let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

set mouse=a                     "Enable mouse mode
set termguicolors

set viminfofile=~/.vim/cache/viminfo

" Colors
set t_Co=256

if has('gui_running')
    set background=light
    colorscheme solarized8
else
    set background=dark
    colorscheme badwolf
endif
set shortmess+=I

" Keymap
set keymap=russian-jcukenmac iminsert=0 imsearch=0
" set clipboard=unnamed
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

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

cmap w!! w !sudo tee > /dev/null %

" fzf
nmap <Leader>h :History<cr>
nmap <Leader>f :Files<cr>
nmap <Leader>b :Buffers<cr>
let g:fzf_preview_window = []

" vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline_powerline_fonts = 1
if has('gui_running')
    let g:airline_theme='solarized'
endif

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
let g:ledger_accounts_cmd = 'cat ~/Projects/Github/hledger/tools/hledger-accounts'
let g:ledger_descriptions_cmd = 'cat ~/Projects/Github/hledger/tools/hledger-descriptions'

let g:fzfSwitchProjectWorkspaces = [ '~/Projects' ]
let g:fzfSwitchProjectProjectDepth = 3
nmap <Leader>p :FzfSwitchProject<cr>

" Telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Neogit
nnoremap <silent> ;g <cmd>Neogit<cr>
