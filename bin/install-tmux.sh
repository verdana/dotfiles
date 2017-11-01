#!/bin/bash


# Remove if old tmux installed
if [[ "`dpkg -l | cut -d " " -f 3 | grep tmux`" == "tmux" ]]; then
    sudo apt-get -y remove tmux
fi

# Steps to build and install tmux from source on Ubuntu.
sudo apt-get -y install libevent-dev libncurses5-dev

VERSION=2.6
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
./configure
make
sudo make install
cd -
sudo rm -rf /usr/local/src/tmux-*
sudo mv tmux-${VERSION} /usr/local/src

## Logout and login to the shell again and run.
## tmux -V

