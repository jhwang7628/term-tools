#/bin/bash

PWD=`pwd` 
CONFIG_PATH=$PWD/../config

olddir=$HOME/dotfiles_old
files=".alias .pythonstartup .vim .screenrc startup.m .tmux.conf .vimrc"

echo "Creating $olddir for backup of any existing dotfiles in $HOME"
mkdir $olddir
echo "...done"

echo "Moving any existing dotfiles for $HOME to $olddir" 
for file in $files; do
    mv $HOME/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -sf $CONFIG_PATH/$file $HOME/$file
done

echo "Backup old vim directory to $olddir" 
mv $HOME/.vim $olddir/
echo "Creating symlink for vim directory at $HOME" 

ln -sf $CONFIG_PATH/Dotfiles/vim-files/vim $HOME/.vim

