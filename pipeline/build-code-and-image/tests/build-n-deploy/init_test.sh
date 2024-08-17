#!/usr/bin/env bash

(
    cd ../../../../scripts/tests
    ./init_secrets.sh catalog-token git-ssh
    # ./init_secrets.sh catalog-token git-ssh docker
    ./init_configmaps.sh
)