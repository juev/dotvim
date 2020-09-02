let $LANG = 'en'
set runtimepath^=~/.vim

set nocompatible             " Disable vi compatibility

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'aperezdc/vim-template'
Plug 'cespare/vim-toml'
Plug 'chaoren/vim-wordmotion'
Plug 'chrisbra/unicode.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'jceb/vim-orgmode'
Plug 'juev/vim-hugo'
Plug 'juev/vim-sensible'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'latex-box-team/latex-box'
Plug 'ledger/vim-ledger'
Plug 'markonm/traces.vim'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'rrethy/vim-illuminate'
Plug 'rust-lang/rust.vim'
Plug 'sjl/badwolf'
Plug 'sjl/clam.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tyru/caw.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'

call plug#end()

" plugin installed check
let s:plug = { 'plugs': get(g:, 'plugs', {}) }
function! s:plug.is_installed(name) abort
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

let g:hugo_path = "~/Projects/juev.org"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8 nobomb    " BOM often causes trouble, UTF-8 is awsum.
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Colors
set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif

set shortmess+=I

" Theme
if s:plug.is_installed('vim-colors-solarized')
  let g:solarized_termcolors=256
  colorscheme solarized
endif

" Keymap
set keymap=russian-jcukenmac iminsert=0 imsearch=0

" Keys
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Remap escape
inoremap <C-C> <Esc>

no <silent> <Leader>1 :set invnumber<CR>

" Toggle paste mode
set pastetoggle=<leader>z

" no <silent> <Leader>q :bw<CR>
" no <silent> <leader>w :w!<CR>
no <leader><leader> <C-^>

noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

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

nnoremap <leader>eg :e ~/.gitconfig<cr>
nnoremap <leader>eh :e ~/Projects/Github/hledger/2020.journal<cr>
nnoremap <leader>ev :e ~/.vim/vimrc<cr>

" Clipboard functionality (paste from system)
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

vnoremap p "_dP
vnoremap <leader>d "_d
nnoremap <leader>d "_d

noremap S :w<CR>

" Airline
let g:airline_detect_spell = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Ansible
let g:ansible_unindent_after_newline = 1

" vim-markdown
set conceallevel=2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1

" Rust
let g:rustfmt_autosave = 1

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altfile = 1

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END

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
let g:rooter_cd_cmd="lcd"

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
" set ttymouse=sgr
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" ale
" let g:ale_yaml_yamllint_options = "{extends: relaxed, rules: {line-length: {max: 120}}}"

" terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
