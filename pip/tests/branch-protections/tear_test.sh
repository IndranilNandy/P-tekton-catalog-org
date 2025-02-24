#!/usr/bin/env bash

kubectl delete -f serviceaccount.yaml

(
    cd ../../../scripts/tests
    ./tear_test.sh
)