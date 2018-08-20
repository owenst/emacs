#!/bin/bash

# run and print commands
set -x 
ln -s .emacs ../.emacs
ln -s .bash_aliases ../.bash_aliases
source ../.bash_aliases
source ../.bashrc

#configure git
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config credential.helper 'cache --timeout 300000'
