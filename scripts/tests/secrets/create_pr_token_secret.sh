#!/usr/bin/env bash

kubectl get secret github-open-pr-secret && exit 0

read -p "Enter the PAT for raising PR on target repo: " token

GITHUB_OPEN_PR_TOKEN="$token"
kubectl create secret generic github-open-pr-secret --from-literal=prSecretToken=$GITHUB_OPEN_PR_TOKEN

