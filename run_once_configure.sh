#!/bin/bash

is_root() { [ "$EUID" -ne 0 ] }

is_command() {
    command -v "$1" &>/dev/null
}

install-package () {
# Install packages one at a time so that if I have to modify the installation of a particular package:
# 1. There is a centralized place to modify the way to install that package
# 2. By using only the first argument $1, it nags you into installing a package at a time,
# with the goal of avoiding installing several packages at once and making more difficult modify the way to install one of these packages

case $1 in
    git)
        sudo apt-get install -y git
        ;;
    python3-pip)
        sudo apt-get install -y python3-pip
        ;;
    timeout)
        sudo apt-get install -y inotify-tools
    zsh)
        sudo apt-get install -y zsh
        ;;
    fzf)
        sudo apt-get install -y fzf
        ;;
    xclip)
        sudo apt-get install -y xclip
        ;;
    feh)
        sudo apt-get install -y feh
        ;;
    xdotool)
        sudo apt-get install -y xdotool
        ;;
    *)
        echo "Package $1 couldn't be installed using install-package" >&2
        exit 1
esac
}

for cmd in "git" "inotifywait" "timeout"; do
    is_command "$cmd" || install-package "$cmd"
done

git clone https://github.com/lytex/orgzly-integrations "${XDG_DATA_HOME:-$HOME/.local/share}/orgzly-integrations"
