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


cd ${PWD}
