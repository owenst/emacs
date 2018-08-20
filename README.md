# emacs
This is an emacs file which can be used on linux or mac osx

clone to ~ then in emacs/ run
chmod +x configure.sh
./configure.sh
which links .emacs and .bash_aliases and sources the aliases and bashrc
you may have to remove the current .emacs file.

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


See size of homedir:
sudo du -m -d1 ~ | sort -nr

## Notes on git:
nice git log graph:
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

save credentials for 3 days:
git config credential.helper 'cache --timeout 300000'

Change author:
see git_fix_author.sh script -> modify to fix commit author
