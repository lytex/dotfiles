#!/bin/bash

echo ".doom.d/org-html-themes
.zsh
.oh-my-zsh
.emacs.d
.cache/paru
.local/share/nvim
Downloads
.cargo/registry" > ~/.config/repoignore

cd ~
find . -iname ".git"  | sed 's/\.git//' | grep -v "$(cat ~/.config/repoignore)" | xargs -I _ setfattr -n user.xdg.tags -v repo "_"


cd ~/Work/1projects
find . -maxdepth 1 -mindepth 1 -type d | xargs -I _ setfattr -n user.xdg.tags -v project "_"
