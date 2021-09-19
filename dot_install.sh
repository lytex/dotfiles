#/usr/bin/env bash

function install-package () {
# Install packages one at a time so that if I have to modify the installation of a particular package:
# 1. There is a centralized place to modify the way to install that package
# 2. By using only the first argument $1, it nags you into installing a package at a time,
# with the goal of avoiding installing several packages at once and making more difficult modify the way to install one of these packages

case $1 in
    git)
        apt-get install git
        ;;
    python3-pip)
        apt-get install python3-pip
        ;;
    zsh)
        apt-get install zsh
        ;;
    fzf)
        apt-get install fzf
        ;;
    xclip)
        apt-get install xclip
        ;;
    feh)
        apt-get install feh
        ;;
    xdotool)
        apt-get install xdotool
        ;;
    *)
        echo "Package $1 couldn't be installed using install-package" >&2
        exit 1
esac
}


function install-fura-mono() {}

function install-fira-code() {}

function install-fantasque-sans-mono() {}

ZSH_CUSTOM="~/.oh-my-zsh/custom"
function install-oh-my-zsh () {
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/https://github.com/zsh-users/zsh-syntax-highlighting"
}
