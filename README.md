# emacs
This repo is meant to replace your `~/.emacs.d` folder. It contains an `init.el` file (instead of a `.emacs` file) and several additional emacs customizations in `custom/`. It has been tested on linux and macOS. It also contains some shell scripts in `scripts/` for setting up a nice git and bash environment. The `init.el` file uses `use-package` to install many required packages, so the first time opening emacs may be slow and there may be some trouble shooting!

* clone to `~/.emacs.d` then in `scripts/` run
* chmod +x configure.sh
* ./configure.sh
  * this links .bash_aliases and sources the aliases and bashrc
  * you may have to remove the current .bashrc, .bash_aliases, .emacs or other files
* Install gnu-global to generate gtags for emacs as C++ IDE:
  * linux: `$ apt install global`
  * mac: `brew install global`
  * cd to project directory base: `$ gtags`
* After installing emacs, open emacs and installation will begin. Watch the setup and check *Messages* and *Warnings* and fix as appropriate
* To install emacs 26 (or 25) on Ubuntu 16.04 use kevin kelly's repo:
  * remove any emacs installation: `sudo apt remove emacs`
  * `sudo add-apt-repository ppa:kelleyk/emacs`
    * if add-apt-repository not installed: `apt-get install software-properties-common`
  * `sudo apt update`
  * `sudo apt install emacs26`
  * Now set an alias for this
    * alias emacs="emacs26"


## Packages:
### Installation
  * M-x package-refresh-contents
  * M-x package-install RET package_name RET
  
##  Notes:
See init.el for notes on the best shortcuts!
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
* in .bashrc or .bash_profile (<-only used at login) add:
* `export VISUAL=nano  #super fast for commits`
* `export EDITOR="$VISUAL"`

## Mac
* This was added to configure file:
* To use .bashrc in Mac, in .bash_profile add:
```
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```
* To use .bash_aliases:
```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```
* To use Alt/Option as Meta key: 
  * In terminal->preferences
  * Under profile->keyboard: scroll to bottom and click Use Option as Meta
  
## Notes on shell:
* in .bashrc or .bash_aliases:
* alias dirs="dirs -v"
* Then use
  * $ pushd ../path/to/new/dir
  * $ cd ~3 -> takes you to the directory at index 3 in stack
* To remove alias: `unalias dirs`


* See size of homedir:
* sudo du -m -d1 ~ | sort -nr

## Notes on git:
* nice git log graph:
* `git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"`

* save credentials for 3 days:
* `git config credential.helper 'cache --timeout 300000'`

* Change author:
* see `git_fix_author.sh` script -> modify to fix commit author
