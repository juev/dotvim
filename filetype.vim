autocmd FileType * setlocal fo-=c fo-=r fo-=o ts=2 sts=2 sw=2 et
autocmd FileType markdown,vimwiki setlocal ts=4 sts=4 sw=4
" autocmd bufwritepost .vimrc source $MYVIMRC

" au FocusLost * :wa
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" open help in vertical split
au BufWinEnter *.txt if &ft == 'help' | wincmd H | endif
" au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
"     \| exe "normal! g`\"" | endif
