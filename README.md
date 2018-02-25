# emacs
This is an emacs file which can be used on linux or mac osx

clone to ~ then in ~ run link command:
$ ln -s emacs/.emacs .emacs

you may have to remove the current .emacs file.

It's a good idea to set your editor, now:
in .bash_profile add:
export EDITOR=emacs

See size of homedir:
sudo du -m -d1 ~ | sort -nr
