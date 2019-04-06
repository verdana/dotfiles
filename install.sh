#!/bin/bash

## Variables
basedir=$(dirname $(readlink -f $0))

## Cleanup my home dir first
rm -rf ~/.aria2
rm -rf ~/.bin
rm -rf ~/.bashrc
rm -rf ~/.cache
rm -rf ~/.composer
rm -rf ~/.config
rm -rf ~/.dircolors
rm -rf ~/.gitconfig
rm -rf ~/.history
rm -rf ~/.lesshst
rm -rf ~/.local
rm -rf ~/.pip
rm -rf ~/.proxychains
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.viminfo
rm -rf ~/.vimrc
rm -rf ~/.zcompdump
rm -rf ~/.zsh_prompt
rm -rf ~/.zshrc

## Create symlinks in home dir
ln -sf $basedir/aria2                  ~/.aria2
ln -sf $basedir/bin                    ~/.bin
ln -sf $basedir/config                 ~/.config
ln -sf $basedir/config/nvim            ~/.vim
ln -sf $basedir/config/nvim/init.vim   ~/.vimrc
ln -sf $basedir/dircolors              ~/.dircolors
ln -sf $basedir/gitconfig              ~/.gitconfig
ln -sf $basedir/proxychains            ~/.proxychains

## Clean up previous theme-pure installation
fish_dir="$basedir/config/fish"
rm -rf $fish_dir/conf.d/*
rm -rf $fish_dir/fish_variables
rm -rf $fish_dir/fishd.*
rm -rf $fish_dir/functions/_pure_*
rm -rf $fish_dir/functions/fish_*
rm -rf $fish_dir/functions/theme-pure/

## Install fish theme
curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
fish -c "source /tmp/pure_installer.fish; and install_pure"

## Reset config file
cd $basedir
git checkout -- config/fish/config.fish

## Create link
#cd $fish_dir
#ln -sf functions/theme-pure/conf.d

# vim: set fdm=manual ts=4 sw=4 tw=0 et :

