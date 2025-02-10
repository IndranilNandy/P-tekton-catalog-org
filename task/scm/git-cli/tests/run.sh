#!/usr/bin/env bash

kubectl apply -f resources.yaml

(
    cd ../../../../scripts/tests/secrets/yaml-generator

    echo -e
    echo -e "Creating configs/secrets"
    echo "echo -e \"$(cat git-ssh-auth-generic.sh.yaml)\"" | bash | kubectl apply -f -
    # echo "echo -e \"$(cat docker-credentials-generic.sh.yaml)\"" | bash | kubectl apply -f -
)

kubectl apply -f serviceaccount.yaml
kubectl create -f run.yaml

echo -e "Run tear_test.sh once the runs are completed, to restore your environment (configmaps etc)"