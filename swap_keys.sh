#!/bin/bash

# make the caps lock key send Alt_L
set -x 
echo "Send 1 as option to swap keys"

if [ $1 ]
then
    xmodmap -e 'clear Lock'
    xmodmap -e "keysym Caps_Lock = Alt_L"
else
    setxkbmap
fi

echo "Run xev to check if Caps_Lock sends Alt_L"
