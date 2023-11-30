#!/usr/bin/env bash
# Copyright (c) 2024-present Verdana Mu <verdana.cn@gmail.com>
# This source code is licensed under the MIT license found in the license file.

# nounset: Treat unset variables and parameters as an error when performing parameter expansion
# errexit: Exit immediately if any command exits with a non-zero status
set -o nounset -o errexit

# Workdir
cd "$(dirname "${BASH_SOURCE}")"
CWD=$(pwd)

# Homebrew
if which brew >/dev/null; then
	read -p "Install Homebrew packages? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		brew bundle --no-lock --file "$CWD/Brewfile"
	fi
else
	printf "\nHomebrew not installed! Skipping package installation..\n\n"
fi

exit 0

## Copy gitconfig
cp ~/dotfiles/git/config .gitconfig

## Create .config if missing
test -d .config || mkdir -p .config

function install_symlinks() {
	test -L .vim && rm -rf .vim
	test -L .vimrc && rm -rf .vimrc
	test -L .config/fish && rm -rf .config/fish
	test -L .config/nvim && rm -rf .config/nvim

	ln -sf ~/dotfiles/fish ~/.config/fish
	ln -sf ~/dotfiles/vim ~/.config/nvim
}

function install_pure() {
	curl git.io/pure-fish --location --output /tmp/pure_installer.fish
	if [ $? -eq 0 ]; then
		fish -c "source /tmp/pure_installer.fish; and install_pure"
	else
		echo "Download failed, please check your network"
		exit -1
	fi
}

install_pure
install_symlinks
