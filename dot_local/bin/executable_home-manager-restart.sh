#!/bin/bash

sleep 300
set -o pipefail
/nix/var/nix/profiles/default/bin/nix-shell "<home-manager>" -A install
i=0
status=0
while (( ! status ))
do sleep 1
    i=$((i+1))
    echo retry $i
    "$HOME/.nix-profile/bin/home-manager" switch 2>&1 | grep -i failed
    status=$?
    echo "status=$status"
    if (( status != 1)); then
        status=0
    fi
done
