# Description

Source: <https://github.com/tektoncd/catalog/blob/main/task/kaniko/0.6/kaniko.yaml>

## Note

If pipeline parameter 'build-artifacts-root' value is '.', then you should NOT pass parameter 'E_DOCKER_CONTEXT_CACHE_LOCATION' to kaniko task.
[ A volume cannot be mounted on '.' ].

Remember 'build-artifacts-root'='.' means the build artifacts are within project root folder, and git-clone task will erase them by default. Hence, build caching will not work.

Rather, a workable solution when the dockerfile copies folders directly from project root folder rather than any artifact folder outside root folder (build etc), then pass the context parameter as '.' (instead of "$(params.common.build-artifacts-root)"), and let the value of build-artifacts-root be set to its default.

e_project_build_artifact_root_cache will be mounted on E_DOCKER_CONTEXT_CACHE_LOCATION but would not be accessed anyways within dockerfile.
