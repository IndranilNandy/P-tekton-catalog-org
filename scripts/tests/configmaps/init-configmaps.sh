#!/usr/bin/env bash

kubectl patch -n tekton-pipelines configmaps git-resolver-config --patch-file patch_files/custom/git-resolver-config-customized.yaml
kubectl patch -n tekton-pipelines configmaps feature-flags --patch-file patch_files/custom/feature-flags-customized.yaml
