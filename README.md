# emacs
This is an emacs file which can be used on linux or mac osx

clone to ~ then in emacs/ run
chmod +x configure.sh
./configure.sh
which links .emacs and .bash_aliases and sources the aliases and bashrc
you may have to remove the current .emacs file.

##  Notes:
* Move:   C-f, C-b, C-a, C-e
* Move:   M-f, M-b, M-a, M-e
* Kill chain:   C-k, C-y, M-y	
* Buffer Menu: C-x C-b: Dired like buffer menu
  * use D to mark for deletion, S to mark for save, X to execute, Q to quit
* Help: C-h: help. C-h a PATTERN: apropos search for PATTERN
* Search under point: C-s . , C-r reverse search
* Rectangle: C-x-SPACE select rectangle (rather than by line)
* Indent: C-M-\
  * C-x-SPACE to select rect then C-x-TAB (tab wth arrow keys or  < , >)
  * M-i indent whitespace to tab stop
* Repeat: C-u 4 : repeat the next command 4 times
* Revert Buffer when changed elsewhere: M-x revert-buffer 
* Packages:
  * M-x package-refresh-contents
  * M-x package-install RET package_name RET
* IMPORTANT PACKAGES:
* IDO: Interactively do things
  * Helps searching for files and through buffers (C-x C-f and C-x b)
  * Use arrows and RET; C-d to go to dired menu in folder
  * Use M-s to search or M-d to go to dired for menu
* Emacs-Lisp
  * Eval region: M-x eval-region
  * Eval in mini-buffer M-:
  * Eval at point C-x C-e


## remapping keys with xmodmap:
* chmod +x swap_keys.sh
* $ ./swap_keys.sh to print usage
* https://askubuntu.com/questions/296155/how-can-i-remap-keyboard-keys#296437
* You can run $ xev , then type key and get output
* You can see current modifier and keycode settings using xmodmap -pm | -pke 

# .bashrc
in .bashrc or .bash_profile (<-only used at login) add:

export VISUAL=nano  #super fast for commits
export EDITOR="$VISUAL"

## Notes on shell:
in .bashrc or .bash_aliases:
alias dirs="dirs -v"
Then use
* $ pushd ../path/to/new/dir
* $ cd ~3 -> takes you to the directory at index 3 in stack

### Mac
To use .bashrc in Mac, in .bash_profile add:
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


See size of homedir:
sudo du -m -d1 ~ | sort -nr

## Notes on git:
nice git log graph:
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

save credentials for 3 days:
git config credential.helper 'cache --timeout 300000'

Change author:
see git_fix_author.sh script -> modify to fix commit author
