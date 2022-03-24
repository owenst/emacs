#!/bin/zsh

if [ $SHELL = "/bin/zsh" ]
then
    echo "This is zsh!"
    if [ -d ~/.oh-my-zsh ]
    then
        echo "Looks like you have oh-my-zish installed!"
        echo "\n\nThese are your aliases:"
        whoami
        date
        $alias
    else
        echo  "Consider installing oh-my-zsh"
        echo "https://ohmyz.sh/#install"
    fi
else
    echo "Install zsh! Then run this again!"
fi
