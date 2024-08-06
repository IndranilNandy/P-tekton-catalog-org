#!/usr/bin/env bash

kubectl get secret tekton-catalog-secret && exit 0

# export TEKTON_SECRET_TOKEN=${TEKTON_SECRET_TOKEN-$(head -c 24 /dev/random | base64)}
# echo -e "**************************************************************************"
# echo -e "Copy the value of webhookSecretToken to the github repo's webhook secret"
# echo -e "webhookSecretToken=$TEKTON_SECRET_TOKEN"
# echo -e "**************************************************************************"

read -p "Enter the PAT for tekton catalog: " token

TEKTON_CATALOG_ACCESS_TOKEN="$token"
echo "Token=$TEKTON_CATALOG_ACCESS_TOKEN"

kubectl create secret generic tekton-catalog-secret --from-literal=tektonCatalogToken=$TEKTON_CATALOG_ACCESS_TOKEN


