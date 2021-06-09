echo
echo ".bash_aliases"
echo

alias dirs='dirs -v'

# OS specific aliases
OS=$(uname -s)
case $OS in
    Darwin)

	    echo "Adding Mac aliases"
	    alias ll='ls -lahFG'
	    ;;
    Linux)
	    echo "Adding Linux aliases"
        alias open=xdg-open
        alias ll='ls -lahF --color=auto'
        alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 && acpi -bi"
        alias spotify="spotify --force-device-scale-factor=2"
        ;;
    *)
	    echo "Unknown OS"
esac


# git
alias ggs="git status"
alias ggc="git commit -m"
alias gga="git add"
alias ggd="git diff"

# Adding in a git based colorful prompt

if [ $OS = "Darwin" ]
then
    echo "setting prompt on Mac"
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
fi
