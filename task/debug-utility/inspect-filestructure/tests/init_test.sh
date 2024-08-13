#!/usr/bin/env bash

(
    cd ../../../../scripts/tests
    ./init_secrets.sh catalog-token
    ./init_configmaps.sh
)