#!/usr/bin/env bash

(
    cd ../../../../scripts/tests
    ./init_test.sh
)

kubectl create -f run.yaml