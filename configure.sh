#!/bin/bash

# function to link
link(){
    ln -s $1 ~/$1
    source ~/$1
    }

# run and print commands
set -x

link .emacs
link .bash_aliases
link .bc
cp -u .bash_profile ..
source ../.bash_profile
source ../.bashrc

#configure git
git config user.name "owenst"
git config user.email "164865+owenst@users.noreply.github.com"
git config --global alias.hist "log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
git config credential.helper 'cache --timeout 300000'

echo ""
echo "Printing git config"
echo "------------------------------------------------------------------------------"
git config -l

