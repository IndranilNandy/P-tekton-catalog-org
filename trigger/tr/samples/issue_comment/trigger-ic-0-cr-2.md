# Usage scenario

## Identifiers

| Labels       |               |
| ------------ | ------------- |
| event-type   | issue_comment |
| event-action | created       |
| author-assoc | collaborator  |

## Interceptors

| Conditions/Checks                                                   |                                                     |
| ------------------------------------------------------------------- | --------------------------------------------------- |
| CEL filter: only when issue comments are created                    | body.action in ['created']                          |
| CEL filter: Only commented by COLLABORATOR                          | body.comment.author_association in ['COLLABORATOR'] |
| Check if test run requested (Comment should end with '/ok-to-test') | body.comment.body.trim().endsWith('/ok-to-test')    |
