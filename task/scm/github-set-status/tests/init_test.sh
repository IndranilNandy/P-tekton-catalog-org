#!/usr/bin/env bash

curdir="$(pwd)"
export curdir

(
    cd ../../../../scripts/tests
    ./init_secrets.sh catalog-token pr-token
    ./init_configmaps.sh
    ./init_github_pats.sh "$curdir"
)