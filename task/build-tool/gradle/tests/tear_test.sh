#!/usr/bin/env bash

kubectl delete -f pipeline.yaml
kubectl delete -f resources.yaml

(
    cd ../../../../scripts/tests
    ./tear_test.sh
)