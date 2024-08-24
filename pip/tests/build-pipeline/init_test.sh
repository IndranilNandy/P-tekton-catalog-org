#!/usr/bin/env bash

(
    cd ../../../scripts/tests
    ./init_secrets.sh catalog-token git-ssh pr-token
    ./init_configmaps.sh
)