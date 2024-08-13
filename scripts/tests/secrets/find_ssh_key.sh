#!/usr/bin/env bash

findSSHKey() {
    find "$HOME/".ssh -name "*id_*[^pub]" >/tmp/sshKeyList

    count_of_sshKeyFiles=$(cat /tmp/sshKeyList | wc -l)

    ((count_of_sshKeyFiles == 0)) && echo -e "No SSH key file found in $HOME/.ssh. Exiting." && return 1

    if ((count_of_sshKeyFiles == 1)); then
        sshKeyFile="$(cat /tmp/sshKeyList)"
    else
        echo -e "Multiple sshKeyFiles found in $HOME/.ssh!"
        cat /tmp/sshKeyList | nl

        read -p "Which sshKeyFile to choose? Enter the number: " no
        sshKeyFile=$(cat /tmp/sshKeyList | nl | head -n$no | tail -n1 | cut -f2)
    fi
    rm /tmp/sshKeyList

    echo "$sshKeyFile" >/tmp/curSSHKey
    return 0
}

findSSHKey
