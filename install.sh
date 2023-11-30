#!/bin/bash

## Prepare proxy first if is WSL

#if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
#fi

## Home directory
cd ~

## Remove old symlinks
rm -rf .vim
rm -rf .vimrc

cp dotfiles/app/git/config .gitconfig

## Create .config if missing
test -d .config || mkdir -p .config

ln -sf ~/dotfiles/fish .config/fish
ln -sf ~/dotfiles/app/nvim .config/nvim

## Install fish theme
curl git.io/pure-fish --location --output /tmp/pure_installer.fish
fish -c "source /tmp/pure_installer.fish; and install_pure"

function clean_symlinks() {
	rm -rf .vim
	rm -rf .vimrc
	# test if .vim is symlink, then remove it
}
