#!/bin/bash
if [ -d ${HOME}/.oh-my-zsh ]; then
    echo "ln -s `pwd`/../zsh/themes/my_blinks.zsh-theme ${HOME}/.oh-my-zsh/themes"
    ln -s `pwd`/../zsh/themes/my_blinks.zsh-theme ${HOME}/.oh-my-zsh/themes
fi
