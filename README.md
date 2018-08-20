# emacs
This is an emacs file which can be used on linux or mac osx

clone to ~ then in ~ run link command:
ln -s emacs/.emacs .emacs
ln -s emacs/.bash_aliases .bash_aliases

you may have to remove the current .emacs file.

# .bashrc
in .bashrc or .bash_profile (<-only used at login) add:

export VISUAL=nano  #super fast for commits
export EDITOR="$VISUAL"

in .bashrc or .bash_aliases:
alias dirs="dirs -v"
Then use
* $ pushd ../path/to/new/dir
* $ cd ~3 -> takes you to the directory at index 3 in stack


See size of homedir:
sudo du -m -d1 ~ | sort -nr
