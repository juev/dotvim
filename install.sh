#!/usr/bin/env bash
git clone https://github.com/Juev/dotvim.git ~/.vim
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
vim +BundleInstall +qall
