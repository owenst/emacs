This repo is meant to replace your `~/.emacs.d` folder. It contains an `init.el` file (instead of a `.emacs` file) and several additional emacs customizations in `custom/` for setting up a C++ IDE using Helm. It has been tested on linux and macOS. The `init.el` file uses `use-package` to install many required packages, so the first time opening emacs may be slow and there may be some trouble shooting!

* clone to `~/.emacs.d` 

It also contains some shell scripts in `scripts/` for setting up a nice git and bash environment. 

* chmod +x configure.sh && ./configure.sh
  * this links .bash_aliases and sources the aliases and bashrc
  * you may have to remove the current .bashrc, .bash_aliases, .emacs or other files
* Install gnu-global to generate gtags for emacs as C++ IDE:
  * linux: `$ apt install global`
  * mac: `brew install global`
  * cd to project directory base: `$ gtags`
* After installing emacs, open emacs and installation will begin. Watch the setup and check *Messages* and *Warnings* and fix as appropriate

## Install Emacs
On Ubuntu 18.04 use snap
  * `sudo snap install emacs --classic`
On macOS use [Emacs for Mac OSX](https://emacsformacosx.com)

## Install Packages in Emacs:
  * M-x package-refresh-contents
  * M-x package-install RET package_name RET
  
##  Emacs Keys:
See init.el for notes on the best shortcuts!
* Buffer Menu: C-x C-b: Dired like buffer menu
  * use D to mark for deletion, S to mark for save, X to execute, Q to quit
* Help: C-h ?: 
  * C-h f : search function
  * C-h k : search keybinding
  * C-h m : search functions available for current modes
  * C-h a PATTERN: apropos search for PATTERN
* Search under point: C-s . , C-r reverse search
* Rectangle select: C-x-SPACE select rectangle (rather than by line)
* Indent: C-M-\
  * C-x-SPACE to select rect then C-x-TAB (tab wth arrow keys or  < , >)
  * M-i indent whitespace to tab stop
* Repeat: C-u 4 : repeat the next command 4 times
* Revert Buffer when changed elsewhere: M-x revert-buffer 
* Emacs-Lisp
  * Eval region: M-x eval-region
  * Eval in mini-buffer M-:
  * Eval at point C-x C-e


## Remapping keys 
On MacOS do this in `System Preferences->Keyboard->Modifier Keys`
* To use Alt/Option as Meta key: 
  * In terminal->preferences
  * Under profile->keyboard: scroll to bottom and click Use Option as Meta


Debian based Linux: this command uses xmodmap on to remap keys. 
* chmod +x swap_keys.sh
* $ ./swap_keys.sh to print usage

[Remapping Keys - Ask Ubuntu](https://askubuntu.com/questions/296155/how-can-i-remap-keyboard-keys#296437)
* You can run $ xev , then type key and get output
* You can see current modifier and keycode settings using xmodmap -pm | -pke 

## Shell
For `zsh`, see `zsh_config.sh`
### Use .bashrc in macOS
* in .bashrc or .bash_profile (<-only used at login) add:
* `export VISUAL=nano  #super fast for commits`
* `export EDITOR="$VISUAL"`

### MacOS .bashrc tip
To use .bashrc in Mac, in .bash_profile add:
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
  
### Weather
  * [wttr.in](https://wttr.in/)
  * $ curl wttr.in or $ curl wttr.in/sanfrancisco?n
### dirs
* in .bashrc or .bash_aliases:
* alias dirs="dirs -v"
* Then use
  * $ pushd ../path/to/new/dir
  * $ cd ~3 -> takes you to the directory at index 3 in stack
* To remove alias: `unalias dirs`


### See size of homedir:
* sudo du -m -d1 ~ | sort -nr
* df -h 

## Git:
* nice git log graph:
* `git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"`

Git Change author:
* see `git_fix_author.sh` script -> modify to fix commit author
### Set up SSH key
* [Error: Permission denied - publickey](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey)
* [Add SSH key to git](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
