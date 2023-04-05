FROM golang:1.19.3

ARG USERNAME=AI1411

ENV TZ Asia/Tokyo
RUN useradd -s /bin/bash -m ${USERNAME} \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        less \
        unzip \
        zsh \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && apt-get install --no-install-recommends -y \
        iputils-ping \
        jq
ENV GO111MODULE on
WORKDIR /go/src/
CMD ["go", "build", "main.go"]
CMD ["go", "run", "."]