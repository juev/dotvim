" au FileType * setlocal fo-=c fo-=r fo-=o ts=2 sts=2 sw=2 et
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby ts=2 sts=2 sw=2 et sta
au BufRead,BufNewFile {*.txt,*.md,*.mkd,*.markdown}                   setlocal spell spelllang=ru,en wrap linebreak
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
"
" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" c/cpp
autocmd FileType c,cpp,objc ClangFormatAutoEnable

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

