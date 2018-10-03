#!/bin/bash

# run and print commands
#set -x

ln -s ~/emacs/.emacs ~/.emacs
ln -s ~/emacs/.bash_aliases ~/.bash_aliases
ln -s ~/emacs/.bc ~/.bc

# These should only be run once:
echo 'set BC_ENV_ARGS=~/.bc; export BC_ENV_ARGS' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/bin/llvm-config' >> ~/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc

#configure git
git config user.name "owenst"
git config user.email "164865+owenst@users.noreply.github.com"
git config --global alias.hist "log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
git config credential.helper 'cache --timeout 300000'

echo "run git config -l to see git config"

