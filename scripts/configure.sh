#!/bin/bash

# run and print commands
# set -x

# exit 0

# ADD ALIASES, FIND BASHRC and ONLY ONCE are inclusion guards

OS=$(uname -s)

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

echo "Configuring git for work and locally for emacs repo"
git config --global user.name "Trevor"
git config --global user.email "trevor@airspace.co"
git config --global alias.hist "log --pretty=format:'%h %ad | [%an] %s%d' --graph --date=short"
git config --global credential.helper 'cache --timeout 300000'
git config user.name "owenst"
git config user.email "164865+owenst@users.noreply.github.com"


echo
echo "Printing git config"
echo
git config -l
echo

echo "run git config -l to see git config"