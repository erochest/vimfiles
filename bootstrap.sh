#! /usr/bin/env bash

if [[ "$OSTYPE" == "msys" ]]; then
    VIMFILES=~/vimfiles
else
    VIMFILES=~/.vim
fi

for i in ~/.vim ~/.vimrc ~/.gvimrc ~/vimfiles; do
    [ -e $i ] && mv $i $i.old
done

hg clone https://bitbucket.org/erochest/vimfiles $VIMFILES
cd $VIMFILES

rake install

# vim: set sw=4:
