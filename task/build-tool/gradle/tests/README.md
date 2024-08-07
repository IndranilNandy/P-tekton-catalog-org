# Tekton Catalog [org]

Follow the instructions below to run tests, find samples etc.

## How to run tests

Each task/pipeline has a 'tests' folder.
To run the tests, just run the 'run.sh' file which will pre-configure the requirements.
Once, the run is over, to tear down the configurations, run 'tear_test.sh'

## Notes

Many tasks/pipelines are directly taken from Tekton Official Catalog - https://github.com/tektoncd/catalog

Corresponding README.md clearly specifies the 'source'.

We may have added 'additional/extra' parameters to some of those tasks. These parameters are prefixed with 'E_' for easy identification. Follow this guideline whenever you want to add 'additional' parameters to the existing tasks taken from Tekton Official Catalog.
