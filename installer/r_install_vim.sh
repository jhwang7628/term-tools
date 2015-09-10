#!/bin/bash

PWD=`pwd`
# DST_DIR=${HOME}/opt

if [ ! -d ../package ]; then
    mkdir ../package
fi

echo "Entering package folder and download/install vim at $DST_DIR"
cd ../package

hg clone https://vim.googlecode.com/hg/ vim

cd vim

./configure # --prefix=${DST_DIR}
make
sudo make install

# for window swap developed by wesQ3 and sgriffin ( https://github.com/wesQ3/vim-windowswap; http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim )
git clone https://github.com/wesQ3/vim-windowswap ~/.vim/bundle/vim-windowswap 

cd ${PWD}
