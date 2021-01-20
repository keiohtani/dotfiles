#!/bin/sh
cd $(dirname $0)/..
for dotfile in .?*; do
    if [[ -f $dotfile ]]; then
        ln -vis $PWD/$dotfile $HOME
    fi
done

ln -vis $PWD/.zsh $HOME

for config_dir in .config/*; do
    if [ -d $config_dir ]; then 
        echo $config_dir
        mkdir -p $HOME/$config_dir
    fi
    if [ $config_dir != '..' ] && [ $config_dir != '.' ]; then
        ln -vis $PWD/$config_dir/* $HOME/$config_dir
    fi
done

# create a file for local zsh settings
touch $HOME/.zshrc_local.zsh
