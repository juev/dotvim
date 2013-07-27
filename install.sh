#!/usr/bin/env bash
if which vim >/dev/null; then
  if ! which git >/dev/null; then
    echo "Hey, where is git??"
    exit 1
  fi
  if ! [ -d ~/.vim ]; then
    echo "Create config directory"
    git clone https://github.com/Juev/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    if ! [ -f ~/.vimrc ]; then
      echo "Create symlink to ~/.vimrc"
      ln -s ~/.vim/vimrc ~/.vimrc
    else
      echo "File ~/.vimrc already exist. Skipping symlink."
    fi
    if ! [ -f ~/.gvimrc ]; then
      echo "Create symlink to ~/.gvimrc"
      ln -s ~/.vim/gvimrc ~/.gvimrc
    else
      echo "File ~/.gvimrc already exist. Skipping symlink."
    fi
    echo "Install Bundle"
    vim +BundleInstall! +qall
  else
    echo "Directory ~/.vim already exist. Skipping create config dir."
    if [ -d ~/.vim/bundle/vundle ]; then
      echo "Update Bundle"
      vim +BundleUpdate +qall
    else
      echo "And what?"
    fi
  fi
else
  echo "First install vim"
  exit 1
fi
