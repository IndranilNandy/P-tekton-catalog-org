#!/usr/bin/env bash

req_perms_file="${1}"/github.perms

while IFS= read -u 4 -r line; do
    repo=$(echo $line | awk '{ print $1 }')
    perm=$(echo $line | awk '{ print $2 }')

    repo_name_sanitized=$(echo $repo | sed "s/\//-/" | tr [:upper:] [:lower:])
    pat_name=gh-"$repo_name_sanitized"-"$perm"-pat
    echo pat_name $pat_name

    kubectl get secret "$pat_name" && continue

    echo -e Repo=$repo
    echo -e Required permission=$perm

    read -p "Enter the PAT: " token
    GITHUB_PAT="$token"
    kubectl create secret generic "$pat_name" --from-literal=tokenKey=$GITHUB_PAT
done 4< <(grep -v "^$" "$req_perms_file" | grep -v "^ *#")
