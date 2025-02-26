# Alpine based images are smaller compared to Debian based images
FROM mikefarah/yq

# alpine/git size will be bigger
# FROM alpine/git

LABEL author="indranil.nandy"

USER root
RUN apk add --no-cache bash github-cli jq

ENTRYPOINT [ "/bin/sh" ]
# CMD [ "/bin/bash" ]