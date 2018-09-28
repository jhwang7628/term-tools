#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/opt/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.6

# create our directories
mkdir -p $HOME/opt $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget -O tmux-${TMUX_VERSION}.tar.gz https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz 
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz 
wget http://invisible-island.net/datafiles/release/ncurses.tar.gz

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=$HOME/opt --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses.tar.gz
cd ncurses-6.1
./configure --prefix=$HOME/opt
make
make install
cd ..

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/opt/include -I$HOME/opt/include/ncurses" LDFLAGS="-L$HOME/opt/lib -L$HOME/opt/include/ncurses -L$HOME/opt/include"
CPPFLAGS="-I$HOME/opt/include -I$HOME/opt/include/ncurses" LDFLAGS="-static -L$HOME/opt/include -L$HOME/opt/include/ncurses -L$HOME/opt/lib" make
cp tmux $HOME/opt/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/opt/bin/tmux is now available. You can optionally add $HOME/opt/bin to your PATH."
