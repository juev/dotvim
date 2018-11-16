highlight FoldColumn guibg=#002B36 guifg=white
set vb t_vb=
" set clipboard+=unnamed
set guioptions=ce
set antialias

if has('mac')
  "set guifont=Dejavu\ Sans\ Mono\ for\ Powerline:h15
  set guifont=Menlo:h15
  " set macmeta
elseif has('win32') || has('win64')
    set guifont=Lucida_Console:h12
    set lines=50 columns=150
else
  set guifont=Fira\ Code\ 11
end

set lines=999 columns=999
