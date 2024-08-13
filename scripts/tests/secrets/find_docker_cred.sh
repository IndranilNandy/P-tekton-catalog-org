#!/usr/bin/env bash

findDockerCred() {
    find "$HOME/".docker -name "*.json" >/tmp/dockerCredList

    count_of_dcFiles=$(cat /tmp/dockerCredList | wc -l)

    ((count_of_dcFiles == 0)) && echo -e "No docker cred config file found in $HOME/.docker. Exiting." && return 1

    if ((count_of_dcFiles == 1)); then
        dcFile="$(cat /tmp/dockerCredList)"
    else
        echo -e "Multiple docker cred config files found in $HOME/.ssh!"
        cat /tmp/dockerCredList | nl

        read -p "Which docker cred config file to choose? Enter the number: " no
        dcFile=$(cat /tmp/dockerCredList | nl | head -n$no | tail -n1 | cut -f2)
    fi
    rm /tmp/dockerCredList

    echo "$dcFile" >/tmp/curDockerCred
    return 0
}

findDockerCred
