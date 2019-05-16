#!/bin/bash

# run and print commands
#set -x


OS=$(uname -s)

# exit 0
ONLY_ONCE=
case $OS in
    Darwin)
        if ! grep -q "# ADD ALIASES" ~/.bashrc
        then

            echo "Mac - adding to .bashrc"
            echo '# ADD ALIASES'                    >> ~/.bashrc
            echo 'if [ -f ~/.bash_aliases ]; then ' >> ~/.bashrc
            echo '    . ~/.bash_aliases'            >> ~/.bashrc
            echo 'fi'                               >> ~/.bashrc
        fi
        if ! grep -q "# FIND BASHRC" ~/.bash_profile
        then
            echo "Making .bash_profile find .bashrc"
            echo '# FIND BASHRC'                    >> ~/.bash_profile
            echo 'if [ -f ~/.bashrc ]; then'        >> ~/.bash_profile
            echo '    source ~/.bashrc'             >> ~/.bash_profile
            echo 'fi'                               >> ~/.bash_profile
        fi

    ;;

    Linux)
    echo "Linux"
    ;;
    *)
    echo "Unknown OS"
esac




echo "Current directory: " $PWD
ln -s $PWD/.bash_aliases ~/.bash_aliases
ln -s $PWD/.bc ~/.bc

# These should only be run once:
if ! grep -q "# ONLY ONCE" ~/.bashrc
then
    echo
    echo "Adding to bashrc"
    echo
    echo '# ONLY ONCE'                                >> ~/.bashrc
    echo 'set BC_ENV_ARGS=~/.bc; export BC_ENV_ARGS'  >> ~/.bashrc
    echo 'export PATH=$PATH:/usr/bin/llvm-config'     >> ~/.bashrc
    echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
    echo 'export VISUAL=nano'                         >> ~/.bashrc
    echo 'export EDITOR="$VISUAL"'                    >> ~/.bashrc
fi
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
