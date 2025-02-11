#!/usr/bin/env bash

kubectl delete -f prereq-provider.yaml
kubectl delete -f ../../pr-pipeline.yaml
kubectl delete -f serviceaccount.yaml
kubectl delete secret test-git-ssh-secret
# kubectl delete secret test-docker-credentials
kubectl delete -f resources.yaml

(
    cd ../../../../scripts/tests
    ./tear_test.sh
)