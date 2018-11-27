#!/bin/bash

# run and print commands
#set -x


OS=$(uname -s)


case $OS in
    Darwin)
	echo "Mac - adding to .bashrc"
	echo 'if [ -f ~/.bash_aliases ]; then ' >> ~/.bashrc
	echo '    . ~/.bash_aliases'            >> ~/.bashrc
	echo 'fi'                               >> ~/.bashrc

	echo "Making .bash_profile find .bashrc"

	echo 'if [ -f ~/.bashrc ]; then'        >> ~/.bash_profile
	echo '    source ~/.bashrc'             >> ~/.bash_profile
	echo 'fi'                               >> ~/.bash_profile

	;;
    
    Linux)
	echo "Linux"
	;;
    *)
	echo "Unknown OS"
esac

# exit 0

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


echo
echo "Printing git config"
echo
git config -l
echo

echo "run git config -l to see git config"
echo "check .bash_profile and .bashrc for duplicates"
