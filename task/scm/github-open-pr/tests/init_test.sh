#!/usr/bin/env bash

(
    cd ../../../../scripts/tests
    ./init_secrets.sh catalog-token pr-token
    ./init_configmaps.sh
)