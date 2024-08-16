# Scenario

In this case, dockerfile instructions copy build artifacts (like build), which can be mounted outside of the project root folder, so that it is not cleaned by tasks like git-clone before every run, and hence can be cached for using gradle incremental tasks feature to speed up successive 'gradle build'.

Since, dockerfile directly copies the build from this location, this location should be passed as dockerfile context ["$(params.build-artifacts-root)"].

e_project_build_artifact_root_cache will be always mounted on E_DOCKER_CONTEXT_CACHE_LOCATION ["$(params.build-artifacts-root)"].
Hence, pass 'context' value as "$(params.build-artifacts-root)".
