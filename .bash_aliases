
#overwrite default ll alias:
alias ll='ls -alhF'
alias dirs='dirs -v'

# OS specific aliases
OS=$(uname -s)
case $OS in
    Darwin)
	echo "Mac"
	;;
    Linux)
	echo "Linux"
	alias open=xdg-open    	
	alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 && acpi -bi"
	;;
    *)
	echo "Unknown OS"
esac


# git
alias ggs="git status"
alias ggc="git commit -m"
alias gga="git add"
alias ggd="git diff"


