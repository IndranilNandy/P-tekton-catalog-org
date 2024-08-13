#!/usr/bin/env bash

findKnownHosts() {
    find "$HOME/".ssh -name "known_hosts" >/tmp/khList

    count_of_khFiles=$(cat /tmp/khList | wc -l)

    ((count_of_khFiles == 0)) && echo -e "No known_hosts file found in $HOME/.ssh. Exiting." && return 1

    if ((count_of_khFiles == 1)); then
        khFile="$(cat /tmp/khList)"
    else
        echo -e "Multiple known_hosts found in $HOME/.ssh!"
        cat /tmp/khList | nl

        read -p "Which known_hosts file to choose? Enter the number: " no
        khFile=$(cat /tmp/khList | nl | head -n$no | tail -n1 | cut -f2)
    fi
    rm /tmp/khList

    echo "$khFile" >/tmp/curKnownHosts
    return 0
}

findKnownHosts
