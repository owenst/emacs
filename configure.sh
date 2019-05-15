#!/bin/bash

# run and print commands
#set -x


OS=$(uname -s)

# exit 0

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



ln -s ~/emacs/.emacs ~/.emacs
apt-get install emacs

if [ ! -d "~/.emacs.d/" ]; then
    echo "making ~/.emacs.d/"
    mkdir ~/.emacs.d/
fi

if [ ! -d "~/.emacs.d/custom" ]; then
    echo "making ~/.emacs.d/custom"
    mkdir ~/.emacs.d/custom/
fi
echo "linking custom setup files"
ln -s  ~/emacs/custom/setup-editing.el ~/.emacs.d/custom/
ln -s  ~/emacs/custom/setup-cedet.el ~/.emacs.d/custom/
ln -s  ~/emacs/custom/setup-helm.el ~/.emacs.d/custom/
ln -s  ~/emacs/custom/setup-helm-gtags.el ~/.emacs.d/custom/

ln -s ~/emacs/.bash_aliases ~/.bash_aliases
ln -s ~/emacs/.bc ~/.bc

# These should only be run once:
echo 'set BC_ENV_ARGS=~/.bc; export BC_ENV_ARGS'  >> ~/.bashrc
echo 'export PATH=$PATH:/usr/bin/llvm-config'     >> ~/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
echo 'export VISUAL=nano'                         >> ~/.bashrc
echo 'export EDITOR="$VISUAL"'                    >> ~/.bashrc
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
