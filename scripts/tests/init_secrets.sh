#!/usr/bin/env bash

for arg in "$@"; do
    case "$arg" in
    catalog-token)
        (
            cd secrets
            ./create_tekton_catalog_token_secret.sh
        )
        ;;
    pr-token)
        (
            cd secrets
            ./create_pr_token_secret.sh
        )
        ;;
    git-ssh)
        (
            cd secrets
            ./find_ssh_key.sh
            ./find_known_hosts.sh
        )
        ;;
    docker)
        (
            cd secrets
            ./find_docker_cred.sh
        )
        ;;
    *) ;;
    esac
done
