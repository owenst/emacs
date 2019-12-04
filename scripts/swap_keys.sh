#!/bin/bash

# make the caps lock key send Alt_L
# set -x 
echo "Usage:"
echo "0 : return to normal config"
echo "1 : make Caps Lock send Alt L"
echo "2 : swap Super and Alt_L"
echo "E.g.:"
echo "  $0 2"


if [ "$1" == "0" ]
then
    echo "returning keys to default"
    setxkbmap
elif [ "$1" == "1" ]
then
    echo "Making Caps Lock send Alt_L"
    xmodmap -e 'clear Lock'
    xmodmap -e "keysym Caps_Lock = Alt_L"
elif [ "$1" == "2" ]
then
    echo "Swapping Left Super and Left Alt"
    xmodmap -e 'remove mod1 = Alt_L'
    xmodmap -e 'remove mod4 = Super_L'
    xmodmap -e "keycode 133 = Alt_L"
    xmodmap -e "keycode 64 = Super_L"
    xmodmap -e 'add mod1 = Alt_L'
    xmodmap -e 'add mod4 = Super_L'
fi

echo "Run xev to check configuration"
