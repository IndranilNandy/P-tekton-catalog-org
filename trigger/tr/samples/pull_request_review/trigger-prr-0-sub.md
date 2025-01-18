# Usage scenario

## Identifiers

| Labels       |                     |
| ------------ | ------------------- |
| event-type   | pull_request_review |
| event-action | submitted           |

## Interceptors

| Conditions/Checks                                                  |                                          |
| ------------------------------------------------------------------ | ---------------------------------------- |
| CEL filter: only when pull request reviews are submitted           | body.action in ['submitted']             |
| Check if test run requested (Comment should contain '/ok-to-test') | body.review.body.contains('/ok-to-test') |
