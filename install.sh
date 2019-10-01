#!/usr/bin/env bash
if ! which vim >/dev/null; then
  echo "First install vim"
  exit 1
fi
if ! which git >/dev/null; then
  echo "Hey, where is git??"
  exit 1
fi
if ! [ -d ~/.vim ]; then
  echo "Create config directory"
  git clone https://github.com/juev/dotvim.git ~/.vim
  if ! [ -f ~/.vimrc ]; then
    echo "Create symlink to ~/.vimrc"
    ln -s ~/.vim/vimrc ~/.vimrc
  else
    echo "File ~/.vimrc already exist. Skipping creating symlink."
  fi
  if ! [ -f ~/.gvimrc ]; then
    echo "Create symlink to ~/.gvimrc"
    ln -s ~/.vim/gvimrc ~/.gvimrc
  else
    echo "File ~/.gvimrc already exist. Skipping creating symlink."
  fi

  echo "Install Plugins"
  vim +PlugUpgrade! +PlugInstall! +qall
else
  echo "Directory ~/.vim already exist. Skipping create config dir."
fi
