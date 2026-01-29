#!/bin/bash

sleep 600
/nix/var/nix/profiles/default/bin/nix-shell "<home-manager>" -A install
i=0
status=0
while (( ! status ))
do sleep 1
    i=$((i+1))
    echo retry $i
    output=$("$HOME/.nix-profile/bin/home-manager" switch 2>&1)
    echo $output
    echo $?
    echo $output | grep -i failed
    status=$?
done
