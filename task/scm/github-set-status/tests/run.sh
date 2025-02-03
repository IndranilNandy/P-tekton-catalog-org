#!/usr/bin/env bash

kubectl create -f run.yaml

echo -e "Run tear_test.sh once the runs are completed, to restore your environment (configmaps etc)"