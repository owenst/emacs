#.bash_profile
#PATH should look something like this:

export SPECTRUM_REDIS_URL='redis://localhost:6379'

export EDITOR=nano

# Load git completions
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

#run source .bash_profile after any changes
#set path variables for java environment
export JAVA_HOME=$(/usr/libexec/java_home)
export JRE_HOME=$(/usr/libexec/java_home)
export PATH=${PATH}:${JAVA_HOME}/bin
export PATH=${PATH}:/usr/local/go/bin

#Python stuff
PATH="${PATH}:/usr/local/lib/python2.7/site-packages"
export WORKON_HOME=~/Environments
export PROJECT_HOME=~/code
source /usr/local/bin/virtualenvwrapper.sh
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Setting startup file for Python. See blog.e-shell.org/221
# export PYTHONSTARTUP=~/.pythonrc.py
#PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/2.7/bin"
#PYTHONPATH="/usr/local/bin:/usr/local/lib/python2.7/site-packages"
#there is and emacs X client script "emacs" in /usr/local/bin
#export PATH=${PATH}:"/Users/trevor/.emacs.d/vendor/pycheckers"

#libsvm
PATH=${PATH}":/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/bin:"
PATH=${PATH}:"/usr/bin/libsvm-3.21/tools"
PATH=${PATH}:"/Library"
PATH=${PATH}:"/Library/TeX/texbin"

export PATH
alias sb="cd /Users/trevor/code/spectrum-backend && workon spectrum"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
