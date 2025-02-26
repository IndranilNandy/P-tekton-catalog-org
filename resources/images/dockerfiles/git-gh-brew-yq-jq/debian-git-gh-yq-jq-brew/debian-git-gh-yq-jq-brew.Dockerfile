# Note: Buildkit cannot be used, because of the way we install brew. Use DOCKER_BUILDKIT=0
# DOCKER_BUILDKIT=0 docker build -t <image-name> .

FROM bitnami/git
LABEL author="indranil.nandy"

RUN apt update && \
    apt install build-essential procps curl file git jq -y && \
    apt upgrade git -y && \
    apt clean

RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
RUN echo >> ~/.bashrc && \
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

RUN /home/linuxbrew/.linuxbrew/bin/brew install yq
RUN /home/linuxbrew/.linuxbrew/bin/brew install gh

CMD [ "/bin/bash" ]