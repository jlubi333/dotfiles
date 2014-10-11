#!/bin/bash

dir=~/dotfiles
old_dir=~/.dotfiles_old
files="vimrc vim tmux.conf"

mkdir -p $old_dir
cd $dir
for file in $files; do
    mv ~/.$file ~/$old_dir
    ln -s $dir/$file ~/.$file
done

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
