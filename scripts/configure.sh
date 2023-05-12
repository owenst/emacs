#!/usr/bin/env bash

# debug - run and print commands
# set -x

# ADD ALIASES, FIND BASHRC and ONLY ONCE are inclusion guards
echo Creating alias file link
ln -s ~/.emacs.d/scripts/.aliases ~/.aliases

echo

if [ $SHELL = "/bin/zsh" ]
then
    echo "Running zsh config!"
    ZSH zsh_config.sh
elif [ $SHELL = "/bin/bash" ]
then
    echo "Running bash config!"
    ./bash_config.sh
fi

echo
echo
echo



#configure git

echo "Configuring git for work and locally for emacs repo"

# git config --global user.name "Trevor"
# git config --global user.email "trevor.owens@gmail.com"
# git config --global credential.helper 'cache --timeout 300000'
git config --global alias.hist "log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
git config user.name "owenst"
git config user.email "164865+owenst@users.noreply.github.com"


echo
echo "Printing git config"
echo "run git config -l to see git config"
echo
git config -l
echo

