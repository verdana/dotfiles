#!/bin/bash

## Variables
dotfiles_dir=$(dirname $(readlink -f $0))

## Cleanup my home dir first
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

##  Create symlinks in home dir
ln -sf $dotfiles_dir/aria2                  ~/.aria2
ln -sf $dotfiles_dir/bin                    ~/.bin
ln -sf $dotfiles_dir/config                 ~/.config
ln -sf $dotfiles_dir/config/nvim            ~/.vim
ln -sf $dotfiles_dir/config/nvim/init.vim   ~/.vimrc
ln -sf $dotfiles_dir/dircolors              ~/.dircolors
ln -sf $dotfiles_dir/gitconfig              ~/.gitconfig
ln -sf $dotfiles_dir/proxychains            ~/.proxychains
# ln -sf $dotfiles_dir/tmux.conf              ~/.tmux.conf

## Clean up previous theme-pure installation
fish_dir="$dotfiles_dir/config/fish"
rm -rf $fish_dir/functions/fish_prompt.fish*
rm -rf $fish_dir/functions/theme-pure

## Install fish theme
curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/tools/installer.fish > /tmp/pure_installer.fish
fish -c "source /tmp/pure_installer.fish; and install_pure"

## Reset config file
cd $dotfiles_dir
git checkout -- config/fish/config.fish

## Create link
cd $fish_dir
ln -sf functions/theme-pure/conf.d

# vim: set fdm=manual ts=4 sw=4 tw=0 et :

