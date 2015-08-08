#!/bin/bash

install_tig() 
{
    if ! hash tig 2>/dev/null; then 
        echo "Installing tig"
        if [ ! -d ../package ]; then 
            mkdir ../package 
        fi
        cd ../package 
        git clone https://github.com/jonas/tig.git
        cd tig
        ./autogen.sh 
        ./configure --prefix=${HOME}/opt
        make 
        make install
    else 
        echo "Tig is installed. Do nothing."
    fi

        
}



install_tig
