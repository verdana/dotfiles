#!/bin/sh

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 30

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 30

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 10
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 10
sudo update-alternatives --set c++ /usr/bin/g++

