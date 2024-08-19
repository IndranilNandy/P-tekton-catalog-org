#!/usr/bin/env bash

# kubectl delete -f pipeline.yaml
kubectl delete -f ../../build-n-deploy-pipeline.yaml
kubectl delete -f ../../deploy-pipeline.yaml
kubectl delete -f ../../build-pipeline.yaml
kubectl delete -f serviceaccount.yaml
kubectl delete secret test-git-ssh-secret
kubectl delete secret test-docker-credentials
kubectl delete -f resources.yaml

(
    cd ../../scripts/tests
    ./tear_test.sh
)