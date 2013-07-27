#!/usr/bin/env bash
if ! [ -d ~/.vim ]; then
  echo "Create config directory"
  git clone https://github.com/Juev/dotvim.git ~/.vim
  git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  if ! [ -f ~/.vimrc ]; then
    echo "Create symlink to ~/.vimrc"
    ln -s ~/.vim/vimrc ~/.vimrc
  else
    echo "File ~/.vimrc already exist. Skipping."
  fi
  if ! [ -f ~/.gvimrc ]; then
    echo "Create symlink to ~/.gvimrc"
    ln -s ~/.vim/gvimrc ~/.gvimrc
  else
    echo "File ~/.gvimrc already exist. Skipping."
  fi
  echo "Install vim plugins"
  vim +BundleInstall +qall
else
  echo "Directory ~/.vim already exist. Skipping."
  vim +BundleUpdate +qall
fi
