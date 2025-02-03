#!/usr/bin/env bash

# req_perms_file="${1}"/github.perms
# export req_perms_file
# (
#     cd ghpats
#     ./create_github_pats.sh "$req_perms_file"
# )

./ghpats/create_github_pats.sh "${1}"

