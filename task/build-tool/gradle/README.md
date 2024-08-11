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

    a. Set E_PROJECT_BUILD_DIR_CUSTOM as a location outside of the source-repo root directory. REMEMBER this location should NOT be a sub-directory of project root. In that case git-clone task will erase it (build) every time, and gradle incremental task will not be effective.
    b. Pass -PbuildDir=<custom-build-dir-loc> to TASKS params of gradle task. (see samples)
    c. Need to EXPLICITLY PASS all the three workspaces (static pvc) to enable all features and caching.
            - e-gradle-user-home-cache
            - e-gradle-project-build-cache
            - e-gradle-project-local-cache

### Enabling 'fresh build' setup

Use this setup for a fresh clean build scenario.

    a. DO NOT PASS the following two workspaces.
            - e-gradle-project-build-cache
            - e-gradle-project-local-cache
    b.  e-gradle-user-home-cache is MANDATORY. But, you may pass a 'dynamic pvc' to ensure that the cache dependencies are always downloaded afresh.
    c. E_PROJECT_BUILD_DIR_CUSTOM has no effect (hence, no need to pass), since we are not passing it using -PbuildDir to TASKS param of gradle task.

## Purpose of E_PROJECT_BUILD_DIR_CUSTOM

By default, gradle builds and stores binary in the 'build' folder of the project root folder.

But, since git-clone task by default cleans the workspace along with the 'build' folder, gradle incremental tasks doesn't work to speed up the build.

For faster build, we need to store the 'built binary' outside of the project root folder and mount it on other workspace.

    1. Set E_PROJECT_BUILD_DIR_CUSTOM (e.g. /tmp/project/build-artifacts/build)
    2. Pass '-PbuildDir=<custom-build-dir-location>' to TASKS parameter of gradle task.
    3. e-gradle-project-build-cache will automatically mount E_PROJECT_BUILD_DIR_CUSTOM.

## Purpose of workspace e-gradle-project-build-cache


        - Mounts E_PROJECT_BUILD_DIR_CUSTOM.
        - Holds project build to speed up successive builds using gradle incremental task.
        - Use this for usecases like caching build binaries to speed up 'gradle build' when you aren't using 'gradle clean build'
          This has to be done in conjunction with passing -PbuildDir=<custom-build-dir-location> to TASKS parameter of gradle task.
        - DO NOT SUPPLY THIS WORKSPACE from TaskRun/PipelineRun if you want to BUILD AFRESH.
        - Remember that if you don't pass -PbuildDir=<custom-build-dir-location>, and you provide this workspace, it will be mounted on E_PROJECT_BUILD_DIR_CUSTOM.
          But, the gradle build-binary will NOT be stored in this location, rather in PROJECT_DIR/build folder.
          So, effectively this workspace will NOT HOLD the build binary.

### Other possible setups

Following options are also available

    a. Only enable gradle dependency caching
        - Just pass 'e-gradle-user-home-cache' workspace
    b. Only enable gradle incremental tasks
        - Enable E_FAST_BUILD_SUPPORT (set it to "true")
        - Pass both 'e-gradle-project-build-cache' and 'e-gradle-project-local-cache' workspaces (static pvc).
        - Optionally, you may explicitly set E_PROJECT_BUILD_DIR
        - Pass a 'dynamic pvc' for e-gradle-user-home-cache which is MANDATORY workspace.
