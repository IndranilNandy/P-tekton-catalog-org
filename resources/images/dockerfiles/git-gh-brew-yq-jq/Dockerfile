FROM bitnami/git
LABEL author="indranil.nandy"

RUN apt update && apt install build-essential procps curl file git jq -y && apt upgrade git -y && apt clean
RUN CI=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
RUN echo >> ~/.bashrc
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
RUN CI=1 /home/linuxbrew/.linuxbrew/bin/brew install yq
RUN CI=1 /home/linuxbrew/.linuxbrew/bin/brew install gh
CMD [ "/bin/bash" ]