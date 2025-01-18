# Usage scenario

## Identifiers

| Labels       |              |
| ------------ | ------------ |
| event-type   | pull_request |
| event-action | opened       |

## Interceptors

| Conditions/Checks                    |                           |
| ------------------------------------ | ------------------------- |
| CEL filter: only when PRs are opened | body.action in ['opened'] |
