#!/usr/bin/env bash

kkubectl apply -f pipeline.yaml
kubectl create -f run.yaml

echo -e "Run tear_test.sh once the runs are completed, to restore your environment (configmaps etc)"