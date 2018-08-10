# emacs
This is an emacs file which can be used on linux or mac osx

clone to ~ then in ~ run link command:
$ ln -s emacs/.emacs .emacs

you may have to remove the current .emacs file.

It's a good idea to set your editor, now:
in .bashrc or .bash_profile (<-only used at login) add:

export VISUAL=emacs  #fuck vim
export EDITOR="$VISUAL"

See size of homedir:
sudo du -m -d1 ~ | sort -nr
