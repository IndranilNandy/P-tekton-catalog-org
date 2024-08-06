#!/usr/bin/env bash

kubectl patch -n tekton-pipelines configmaps git-resolver-config --patch-file patch_files/default/git-resolver-config-default.yaml
kubectl patch -n tekton-pipelines configmaps feature-flags --patch-file patch_files/default/feature-flags-default.yaml
