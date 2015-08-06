#!/bin/bash


DST_DIR=${HOME}/opt

if [ ! -d ../package ]; then 
    mkdir ../package 
fi

echo "Entering package folder"
cd ../package 

echo "Retrieving tmux"
wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz

tar -xvf tmux-2.0.tar.gz

rm tmux*.tar.gz

cd tmux*

echo "Compile and install at prefix ${DST_DIR}"
export CPPFLAGS="-I${HOME}/opt/include"
export LDFLAGS="-L${HOME}/opt/lib"
./configure --prefix=${DST_DIR}
make 
make install


