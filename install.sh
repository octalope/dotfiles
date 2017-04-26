#!/usr/bin/env bash

mkdir ~/dotfiles/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/dotfiles/.vim/bundle/vundle.vim
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc


