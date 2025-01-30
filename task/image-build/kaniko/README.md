# Description

Source: <https://github.com/tektoncd/catalog/blob/main/task/kaniko/0.6/kaniko.yaml>

## Note

If pipeline parameter 'build-artifacts-root' value is '.', then you should NOT pass parameter 'E_DOCKER_CONTEXT_CACHE_LOCATION' (or e_project_build_artifact_root_cache workspace as it is optional) to kaniko task.
[ A volume cannot be mounted on '.' ].

Remember 'build-artifacts-root'='.' means the build artifacts are within project root folder, and git-clone task will erase them by default. Hence, build caching will not work.

Generally, there is no need to do that, rather you should put build artifacts outside of the root folder to facilitate using caching to speedup build.