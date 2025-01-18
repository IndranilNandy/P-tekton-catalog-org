# Usage scenario

## Identifiers

| Labels     |      |
| ---------- | ---- |
| event-type | push |

## Interceptors

| Conditions/Checks                                                                                             |                                                                                           |
| ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Extract repo information                                                                                      |                                                                                           |
| Accept push triggers only for certain branches ('dev' here)                                                   | extensions.branch_name in ['dev']                                                         |
| Extract the changed files first                                                                               |                                                                                           |
| Check if the changed files require the Pipeline to be triggered (changes should be in 'src' or 'docker' here) | extensions.changed_files.matches('src/') \|\| extensions.changed_files.matches('docker/') |

## Notes

1. To request 'create a PR" along with the push event, 'commit message' should contain '\ok-to-create-pr'.
