#!/usr/bin/env bash

mkdir ./.vim/bundle
git clone https://github.com/gmarik/vundle.git ./.vim/bundle/vundle.vim
ln -s ./.vim ~/.vim
ln -s ./.vimrc ~/.vimrc

