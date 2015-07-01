#!/bin/bash

dir=~/Documents/dotfiles
files="bash_profile vimrc"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv ~/.$file $dir
    ln -s $dir/$file ~/.$file
done
