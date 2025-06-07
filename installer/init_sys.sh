#!/bin/bash

PWD=`pwd`
ROOT_DIR=$PWD/..
CONFIG_PATH=$PWD/../config

sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

olddir=$ROOT_DIR/dotfiles_old
files=".alias .pythonstartup .vim startup.m .tmux.conf .vimrc .bashrc .gitignore_global .zshrc"

. ./install_vim_plugins.sh

if [ ! -d $olddir ]; then
    echo "Creating $olddir for backup of any existing dotfiles in $HOME"
    mkdir $olddir
    echo "...done"
fi

echo "Moving any existing dotfiles for $HOME to $olddir"
for file in $files; do
    mv $HOME/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -sf $CONFIG_PATH/$file $HOME/$file
done

echo "Backup old vim directory to $olddir"
if [ -d $olddir/.vim ]; then
    rm -rf $olddir/.vim
fi
mv $HOME/.vim $olddir/
echo "Creating symlink for vim directory at $HOME"

ln -sf $CONFIG_PATH/.vim $HOME/.vim
ln -s ${CONFIG_PATH}/mpv ${HOME}/.config/

## TODO need to use non sudo
# sudo apt-get install mercurial meld
# sudo apt-get install libevent-dev libncurses-dev pkg-config


git config --global user.name "Jui-Hsien Wang"
git config --global user.email "juiwang.cs@gmail.com"
