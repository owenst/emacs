#!/bin/bash

# run and print commands
set -x 
ln -s .emacs ../.emacs
ln -s .bash_aliases ../.bash_aliases
source ../.bash_aliases
source ../.bashrc

#configure git
<<<<<<< HEAD
git config user.name "owenst"
git config user.email "164865+owenst@users.noreply.github.com"
git config --global alias.hist "log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
git config credential.helper 'cache --timeout 300000'

echo ""
echo "Printing git config"
echo "------------------------------------------------------------------------------"
git config -l
=======
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config credential.helper 'cache --timeout 300000'
>>>>>>> e52aad0fa071f1619c0952607430b0e7d897a5d0
