
#overwrite default ll alias:
alias dirs='dirs -v'

# OS specific aliases
OS=$(uname -s)
case $OS in
    Darwin)
	echo "Mac"
	alias ll='ls -lahFG'
	;;
    Linux)
	echo "Linux"
	alias open=xdg-open    	
	alias ll='ls -lahF'
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


# Adding in a git based colorful prompt
#set -x

# Load git completions
# Need to install bash-completion:
## Mac: $ brew install bash-completion
## Linux: sudo apt-get install bash-completion
##      UNCOMMENT BELOW ON MAC
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script
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
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) $ "'
export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

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



Mac
scripts [master] $ 
scripts [master] $ 
scripts [master] $ 
scripts [master] $ 
scripts [master] $ pwd
/Users/trevor/.emacs.d/scripts
scripts [master] $ ggs
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   .bash_aliases
	modified:   configure.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.emacs.desktop
	../.emacs.desktop.lock
	../ede-projects.el
	../elpa/
	../ido.last
	../network-security.data
	../projectile-bookmarks.eld
	../projectile.cache
	../recentf
	../recentf~
	.#.bash_aliases
	../semanticdb/
	../url/

no changes added to commit (use "git add" and/or "git commit -a")
scripts [master] $ gga .bash_aliases
scripts [master] $ gga configure.sh
scripts [master] $ ggs
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   .bash_aliases
	modified:   configure.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../.emacs.desktop
	../.emacs.desktop.lock
	../ede-projects.el
	../elpa/
	../ido.last
	../network-security.data
	../projectile-bookmarks.eld
	../projectile.cache
	../recentf
	../recentf~
	.#.bash_aliases
	../semanticdb/
	../url/

scripts [master] $ ggc "modified .bash_aliases"
[master c3234b0] modified .bash_aliases
 2 files changed, 5 insertions(+), 4 deletions(-)
scripts [master] $ git pull
Already up to date.
scripts [master] $ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 485 bytes | 485.00 KiB/s, done.
Total 5 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.        
To https://github.com/owenst/emacs.git
   0632ddf..c3234b0  master -> master
scripts [master] $ 
