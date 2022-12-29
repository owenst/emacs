#!/bin/zsh


indices=("0" "1" "2")
echo "Zsh starts arrays at index 1, Bash at 0"
echo "index 1 into [0,1,2] array is: ${indices[1]}"

if [ $SHELL = "/bin/zsh" ]
then
    echo "This is zsh!"
    if [ -d ~/.oh-my-zsh ]
    then
        whoami
        date
        echo "Looks like you have oh-my-zish installed!"
        echo  "Run 'alias' to see set up"
    else
        echo  "Consider installing oh-my-zsh"
        echo "https://ohmyz.sh/#install"
    fi
else
    echo "Install zsh! Then run this again!"
fi
