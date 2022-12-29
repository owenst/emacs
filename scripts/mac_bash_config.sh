#!/usr/bin/env bash

if [ $SHELL = "/bin/bash" ] && [ $OS == "Darwin" ]
then
    echo "Mac and Bash! Old school!"
else
    echo "Not bash on macOS. Exiting."
    exit
fi

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


# Mac specific aliases
alias ll='ls -lahFG'



# Bash Completions
echo "Installing bash completions:"
brew install bash-completion


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


# MAC PROMPT
echo "Setting git based prompt on Mac with Bash"
# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'
# source $BASH_IT/bash_it.sh

# PS1 is the variable for the prompt you see everytime you hit enter
# PROMPT_COMMAND='PS1="`basename "$VIRTUAL_ENV"` ${c_path}\W${c_reset}$(git_prompt) $ "'
PROMPT_COMMAND='PS1="$(in_pyvenv)${c_path}\W${c_reset}$(git_prompt) $ "'
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if in a virtual environment
in_pyvenv ()
{
    if [ -z $VIRTUAL_ENV ] ; then
        return 0
    else
        echo "(`basename "$VIRTUAL_ENV"`) "
    fi
}

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
    # Grab working branch name
    git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    # Clean or dirty branch
    if git diff --quiet 2>/dev/null >&2; then
        git_color="${c_git_clean}"
    else
        git_color=${c_git_dirty}
    fi
    echo " [$git_color$git_branch${c_reset}]"
}
