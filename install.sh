#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$HOME/$dotfile" $HOME
    fi
done
ln -Fis "$HOME/dotfile/.vim/colors" "$HOME/.config/nvim"

for nvim_file in nvim/*
do
    if [ $nvim_file != '..' ]
    then
        ln -Fis "$HOME/dotfile/nvim/init.vim" "$HOME/.config/nvim"
    fi
done
