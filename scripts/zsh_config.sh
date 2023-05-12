#!/bin/zsh


# indices=("0" "1" "2")
# echo "Zsh starts arrays at index 1, Bash at 0"
# echo "index 1 into [0,1,2] array is: ${indices[1]} (0 for zsh, 1 for bash)"

if [ $SHELL = "/bin/zsh" ]
then
    echo "zsh detected!"
else
    echo "Install zsh! Then run this again!"
fi


if [ ! -d ~/.oh-my-zsh ]
then
    echo  "Installing oh-my-zsh"
    echo "https://ohmyz.sh/#install"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -d ~/.oh-my-zsh ]
then
    echo "oh-my-zish detected!"
    echo
    echo "Adding aliases to .zshrc"
    if ! grep -q "# ADD ALIASES" ~/.zshrc
    then
        echo "adding my aliases to .zshrc"
        echo ''                                 >> ~/.zshrc
        echo '# ADD ALIASES'                    >> ~/.zshrc
        echo 'echo sourcing .aliases in .zshrc' >> ~/.zshrc
        echo 'source $HOME/.aliases'            >> ~/.zshrc
    fi
else
    echo "May need to run script again to recognize oh-my-zsh install"
fi

source ~/.zshrc
echo "Run 'alias' to see set up"
