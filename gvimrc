" highlight FoldColumn guibg=#002B36 guifg=white
set vb t_vb=
" set clipboard+=unnamed
set guioptions=gtme
set antialias

" let g:airline_theme='solarized'

if has('mac')
  "set guifont=Dejavu\ Sans\ Mono\ for\ Powerline:h15
  " set guifont=Menlo:h15
  " set guifont=Fira\ Code:h14
  set guifont=JetBrains\ Mono:h15
  set lines=60 columns=230
  " set macmeta
elseif has('win32') || has('win64')
    set guifont=Lucida_Console:h12
    set lines=50 columns=150
else
  set guifont=Fira\ Code\ 11
end

" set lines=999 columns=999
