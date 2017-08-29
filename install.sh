#!/bin/bash

## Variables
dotfiles_dir=~/dotfiles

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
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.viminfo
rm -rf ~/.vimrc
rm -rf ~/.zcompdump
rm -rf ~/.zsh_prompt
rm -rf ~/.zshrc

##  Create symlinks in home dir
ln -srf $dotfiles_dir/bin                    ~/.bin
ln -srf $dotfiles_dir/config                 ~/.config
ln -srf $dotfiles_dir/config/nvim            ~/.vim
ln -srf $dotfiles_dir/config/nvim/init.vim   ~/.vimrc
ln -srf $dotfiles_dir/dircolors              ~/.dircolors
ln -srf $dotfiles_dir/gitconfig              ~/.gitconfig
ln -srf $dotfiles_dir/tmux.conf              ~/.tmux.conf

## Clean up previous theme-pure installation
fish_dir="$dotfiles_dir/config/fish"
rm -rf $fish_dir/functions/fish_prompt.fish*
rm -rf $fish_dir/functions/theme-pure

## Install fish theme
curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/installer.fish > /tmp/pure_installer.fish
fish -c "source /tmp/pure_installer.fish; and install_pure"

## Reset config file
git checkout -- config/fish/config.fish

# vim: set fdm=manual ts=4 sw=4 tw=0 et :

