# Usage scenario

## Identifiers

| Labels       |              |
| ------------ | ------------ |
| event-type   | pull_request |
| event-action | reopened     |

## Interceptors

| Conditions/Checks                    |                             |
| ------------------------------------ | --------------------------- |
| CEL filter: only when PRs are reopened | body.action in ['reopened'] |
