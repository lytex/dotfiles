#!/bin/bash

sleep 300
i=0
status=0
export PATH="$PATH:/nix/var/nix/profiles/default/bin/"
while (( status == 0)); do
    sleep 1
    i=$((i+1))
    # /nix/var/nix/profiles/default/bin/nix-shell "<home-manager>" -A install
    echo retry $i
    output=$("$HOME/.nix-profile/bin/home-manager" switch 2>&1)
    status_home_manager=$?
    echo $output
    echo $output | grep -i failed
    home_manager_failed=$?
    sleep 5
    systemctl --user status "activitywatch-watcher-awatcher.service" | grep failed 
    aw1_failed=$?
    systemctl --user status "activitywatch-watcher-aw-watcher-afk.service" | grep failed 
    aw2_failed=$?
    echo "status_home_manager=$status_home_manager"
    echo "home_manager_failed=$home_manager_failed"
    echo "aw1_failed=$aw1_failed"
    echo "aw2_failed=$aw2_failed"
    if(( status_home_manager == 0 && home_manager_failed == 1 && aw1_failed == 1 && aw2_failed == 1)); then
        status=1
    else
        status=0
    fi
    echo "status=$status"
done
