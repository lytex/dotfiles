#!/bin/bash

sleep 0
i=0
status=0
while (( ! status ))
do sleep 1
    i=$((i+1))
    /nix/var/nix/profiles/default/bin/nix-shell "<home-manager>" -A install
    echo retry $i
    output=$("$HOME/.nix-profile/bin/home-manager" switch 2>&1)
    status=$?
    echo $output
    echo "status home-manager = $status"
    if (( status == 0 )); then
        echo $output | grep -i failed
        status=$?
        echo "status grep = $status"
    else
        status=0
    fi
    if (( status == 0 )); then
        systemctl --user status "activitywatch-watcher-awatcher.service" | grep failed 
        status=$?
        echo "status grep 2 = $status"
    else
        status=0
    fi

done
