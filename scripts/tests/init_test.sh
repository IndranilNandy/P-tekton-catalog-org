#!/usr/bin/env bash

(
    cd secrets
    ./create_tekton_catalog_token_secret.sh
)

(
    cd configmaps
    ./init-configmaps.sh
)
