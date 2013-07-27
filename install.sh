#!/usr/bin/env bash
if ! [ -d ~/.vim ]; then
  git clone https://github.com/Juev/dotvim.git ~/.vim
  git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  if ! [ -f ~/.vimrc ]; then
    ln -s ~/.vim/vimrc ~/.vimrc
  else
    echo "File ~/.vimrc already exist. Skipping."
  fi
  if ! [ -f ~/.gvimrc ]; then
    ln -s ~/.vim/gvimrc ~/.gvimrc
  else
    echo "File ~/.gvimrc already exist. Skipping."
  fi
  vim +BundleInstall +qall 2>/dev/null
else
  echo "Directory ~/.vim already exist. Skipping."
  vim +BundleUpdate +qall 2>/dev/null
fi
