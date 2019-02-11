## Pre-requisites

The distribution is designed to work with Vim >= 7.3.

The distribution also requires `git`.

## Installation

**Mac** or **Linux**:

    $ curl https://raw.githubusercontent.com/juev/dotvim/master/install.sh | sh

or shorter:

    $ curl vim.juev.org | sh

Manual install:

    $ git clone https://github.com/Juev/dotvim.git ~/.vim
    $ git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ ln -s ~/.vim/gvimrc ~/.gvimrc
    $ vim +PlugUpgrade! +PlugInstall! +qall

Done!

**Windows**:

    > git clone https://github.com/Juev/dotvim.git %USERPROFILE%\.vim
    > cd %USERPROFILE%\.vim
    > install.cmd
    > copy vimrc %USERPROFILE%\_vimrc
    > copy gvimrc %USERPROFILE%\_gvimrc

## Appearance

![macvim](http://juev.s3.amazonaws.com/macvim.png "MacVim")
