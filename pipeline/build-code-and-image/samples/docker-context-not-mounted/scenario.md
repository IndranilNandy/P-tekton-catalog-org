# Scenario

In this case, dockerfile instructions directly copy source folders from the project root folder, rather than copying build artifacts (e.g. build).
Hence, there is no need to cache this build for successive 'gradle build' runs to speed up.

There is no need to mount docker context on E_PROJECT_BUILD_ARTIFACT_ROOT_CACHE_LOCATION.
Hence, pass 'context' value as '.' without changing the default value for build-artifacts-root.

e_project_build_artifact_root_cache will be mounted on E_PROJECT_BUILD_ARTIFACT_ROOT_CACHE_LOCATION but would not be accessed anyways within dockerfile.
