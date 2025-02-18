# Usage scenario

## Identifiers

| Labels       |              |
| ------------ | ------------ |
| event-type   | pull_request |
| event-action | closed       |

## Interceptors

| Conditions/Checks                                            |                                                                 |
| ------------------------------------------------------------ | --------------------------------------------------------------- |
| CEL filter: only when PRs are merged successfully and closed | body.action in ['closed'] && body.pull_request.merged in [true] |
