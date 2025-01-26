#!/usr/bin/env bash

kubectl get -n tekton-pipelines configmaps feature-flags -o yaml | yq 'pick([.data | key])' > /tmp/feature-flags-original.yaml
kubectl get -n tekton-pipelines-resolvers configmaps git-resolver-config -o yaml | yq 'pick([.data | key])' > /tmp/git-resolver-config-original.yaml

kubectl patch -n tekton-pipelines configmaps feature-flags --patch-file patch_files/custom/feature-flags-customized.yaml
kubectl patch -n tekton-pipelines-resolvers configmaps git-resolver-config --patch-file patch_files/custom/git-resolver-config-customized.yaml
