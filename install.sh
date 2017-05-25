#!/bin/bash

## Variables
dotfiles_dir=~/dotfiles

## Cleanup my home dir first
rm -rf ~/.bin
rm -rf ~/.bashrc
rm -rf ~/.cache
rm -rf ~/.composer
rm -rf ~/.config
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
ln -sf $dotfiles_dir/bin       ~/.bin
ln -sf $dotfiles_dir/config    ~/.config
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/vim       ~/.vim
ln -sf $dotfiles_dir/vimrc     ~/.vimrc

## Install fish theme
curl -Ls https://raw.github.com/rafaelrinaldi/pure/master/installer.fish > /tmp/pure_installer.fish
fish -c "source /tmp/pure_installer.fish; and install_pure"

