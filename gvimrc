highlight FoldColumn guibg=#002B36 guifg=white
set vb t_vb=
set clipboard+=unnamed
set go=aAce
set antialias

if has('mac')
  " set guifont=Menlo:h15
  set guifont=Menlo:h14
  " set macmeta
elseif has('win32') || has('win64')
    set guifont=Lucida_Console:h12
    set lines=50 columns=150
else
  set guifont=Terminus\ 18
end

