#!/usr/bin/env bash

if [ ! $SHELL = "/bin/bash" ]
then
    echo "Not Bash. Exiting"
    exit
fi

OS=$(uname -s)
echo "OS is $OS"

if [ $OS == "Darwin" ]; then
    echo "macOS"
    echo "Bash no longer supported on Mac - calling old script"
    ./mac_bash_config.sh
    exit
fi

if [ ! $OS == "Linux" ]
    echo "Not Linux. Exiting..."
    exit
fi



echo "Installing bash completions:"
sudo apt install bash-completion

git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
if test -s $git_completion_script
then
    echo "git completions found"
    source $git_completion_script
else
    echo "Need to install git completions"
    echo "brew install bash-completion"
    echo "OR"
    echo "sudo apt-get install bash-completion"
fi


# Load git completions

echo
echo "Link bash_aliases and bc"
echo "Current directory: " $PWD
ln -s $PWD/.bash_aliases ~/.bash_aliases
ln -s $PWD/.bc ~/.bc


# These should only be run once, hence inclusion guards:
if ! grep -q "# ONLY ONCE" ~/.bashrc
then
    echo
    echo "Adding to bashrc"
    echo
    echo '# ONLY ONCE'                                >> ~/.bashrc
    echo 'set BC_ENV_ARGS=~/.bc; export BC_ENV_ARGS'  >> ~/.bashrc
    echo 'export PATH=$PATH:/usr/bin/llvm-config'     >> ~/.bashrc
    echo 'export VISUAL=nano'                         >> ~/.bashrc
    echo 'export EDITOR="$VISUAL"'                    >> ~/.bashrc
    echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
fi

# These should only be run once, hence inclusion guards:
# if ! grep -q "# WEATHER" ~/.bashrc
# then
#     echo
#     echo "Adding to bashrc"
#     echo
#     echo '# WEATHER'                                  >> ~/.bashrc
#     echo 'curl wttr.in?n'                             >> ~/.bashrc
#     echo 'curl wttr.in/sanfrancisco?n'                >> ~/.bashrc
# fi

echo
echo "sourcing bashrc"
source ~/.bashrc
echo
