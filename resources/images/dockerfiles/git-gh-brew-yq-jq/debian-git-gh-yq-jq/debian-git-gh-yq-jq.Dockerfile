# Debian based images are larger compared to Alpine based images
FROM bitnami/git
LABEL author="indranil.nandy"

RUN (type -p wget >/dev/null || (apt update && apt-get install wget -y)) \
    && mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh jq -y \
    && apt clean

ADD https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 /usr/bin/yq
RUN chmod +x /usr/bin/yq

CMD [ "/bin/bash" ]