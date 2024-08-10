# Description

Source: <https://github.com/tektoncd/catalog/blob/main/task/gradle/0.4/gradle.yaml>

## Usage

### Enabling 'fast build' setup

Use this setup to speed up code build by enabling-

1. gradle dependency caching (e-gradle-user-home-cache),
2. caching build-binary (e-gradle-project-build-cache),
3. supporting gradle incremental tasks (e-gradle-project-local-cache).

As of now due to some tekton variable substitution limitations E_FAST_BUILD_SUPPORT flag CAN NOT BE USED as a single point switch/entry to enable.

Need to follow these steps to enable all caching and features.

    a. Just by enabling this flag, gradle binary build location is customized so that a pvc can cache it.
    b. Need to EXPLICITLY PASS all the three workspaces to enable all features and caching.
            - e-gradle-user-home-cache
            - e-gradle-project-build-cache
            - e-gradle-project-local-cache

### Enabling 'fresh build' setup

Use this setup for a fresh clean build scenario.

    a. E_FAST_BUILD_SUPPORT="false" (default)
    b. DO NOT PASS the following three workspaces.
            - e-gradle-user-home-cache
            - e-gradle-project-build-cache
            - e-gradle-project-local-cache
    c. Optionally, you may explicitly set E_PROJECT_BUILD_DIR

### Other possible setups

Following options are also available

    a. Only enable gradle dependency caching
        - Just pass 'e-gradle-user-home-cache' workspace
    b. Only enable gradle incremental tasks
        - Enable E_FAST_BUILD_SUPPORT (set it to "true")
        - Pass both 'e-gradle-project-build-cache' and 'e-gradle-project-local-cache' workspaces.
        - Optionally, you may explicitly set E_PROJECT_BUILD_DIR
