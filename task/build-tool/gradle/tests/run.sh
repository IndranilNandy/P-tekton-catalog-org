#!/usr/bin/env bash

(
    cd ../../../../scripts/tests
    ./init_test.sh
)

kubectl apply -f resources.yaml
kubectl create -f run.yaml

echo -e "Run tear_test.sh once the runs are completed, to restore your environment (configmaps etc)"