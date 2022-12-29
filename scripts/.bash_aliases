echo
echo ".bash_aliases"
echo


# Aliases
alias ll='ls -lAh'
alias ggs="git status"
alias ggc="git commit -m"
alias gga="git add"
alias ggd="git diff"

if [ $OS == "Darwin" ]; then
    echo "Setting mac specific aliases: emacs, atmux, mp"
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias atmux="autossh -M 0 -t \"towens\" \"tmux -CC new-session -AD -s main\""
    alias atmux-ports="autossh -M 0 -L 6006:localhost:6006 -L 8888:localhost:8888 -t \"towens\" \"tmux -CC new-session -AD -s main\""
    # For mp-cli for AWS setup
    alias mp=/Users/towens/code/mp-cli/.venv/bin/mp
elif [ $OS == "Linux" ]; then
    echo "Linux specific aliases"
    alias dirs='dirs -v'
    alias open=xdg-open
    alias ll='ls -lahF --color=auto'
    alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 && acpi -bi"
    alias spotify="spotify --force-device-scale-factor=2"
    alias gpumonitor='watch -n 0.5 --color gpustat --color'
fi




# determines if the git branch you are on is clean or dirty
# git_prompt ()
# {
#     if ! git rev-parse --git-dir > /dev/null 2>&1; then
#         return 0
#     fi
#     # Grab working branch name
#     git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
#     # Clean or dirty branch
#     if git diff --quiet 2>/dev/null >&2; then
#         git_color="${c_git_clean}"
#     else
#         git_color=${c_git_dirty}
#     fi
#     echo " [$git_color$git_branch${c_reset}]"
# }
# alias gpumonitor='watch -n 0.5 --color gpustat --color'

# git
alias ggs="git status"
alias ggc="git commit -m"
alias gga="git add"
alias ggd="git diff"
