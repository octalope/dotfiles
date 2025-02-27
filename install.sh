#!/usr/bin/env bash

# rename dir to .dotfiles
cd ..
mv ./dotfiles ./.dotfiles
cd ./.dotfiles

# clone vundle
mkdir .vim/bundle
git clone https://github.com/gmarik/vundle.git ./.vim/bundle/vundle.vim

# setup softlinks
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.gitconfig ~/.gitconfig

# install bundles
vim +BundleInstall +qall

# start vim
vim
