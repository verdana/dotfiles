#!/usr/bin/env bash
# Copyright (c) 2024-present Verdana Mu <verdana.cn@gmail.com>
# This source code is licensed under the MIT license found in the license file.

# errexit: Exit immediately if any command exits with a non-zero status
set -o errexit

# Workdir
cd "$(dirname "${BASH_SOURCE}")"
CWD=$(pwd)
echo $CWD

# terminfo
mkdir -p $HOME/.terminfo
tic -x -o $HOME/.terminfo $CWD/terminfo-24bit.src

## Create .config if missing
test -d .config || mkdir -p .config

function sync_symlinks() {
    local src=$1
    local dst="$HOME/.config/$src"

    # 若参数 $2 存在则使用 $2 作为目标路径
    if [ -n "$2" ]; then
        dst="$2"
    fi

    rm -rf "$dst"
    ln -sf "$CWD/config/$src" "$dst"
}

function install_pure_fish() {
    if ! command -v fish &> /dev/null; then
        echo "Fish shell is not installed, please install fish shell first"
        exit -1
    fi
	curl git.io/pure-fish --location --output /tmp/pure_installer.fish
	if [ $? -eq 0 ]; then
		fish -c "source /tmp/pure_installer.fish; and install_pure"
	else
		echo "Download failed, please check your network"
		exit -1
	fi
}

function install_brew_packages() {
    if which brew >/dev/null; then
        read -p "Install Homebrew packages? (y/n) " -n 1
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            brew bundle --no-lock --file "$CWD/Brewfile"
        fi
    else
        printf "\nHomebrew not installed, skipping package installation\n\n"
    fi
}

install_brew_packages
install_pure_fish

sync_symlinks "kitty"
sync_symlinks "nvim"
sync_symlinks "gitconfig" "$HOME/.gitconfig"
