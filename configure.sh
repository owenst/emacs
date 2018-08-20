#!/bin/bash

# run and print commands
set -x 
ln -s .emacs ../.emacs
ln -s .bash_aliases ../.bash_aliases
source ../.bash_aliases
source ../.bashrc
