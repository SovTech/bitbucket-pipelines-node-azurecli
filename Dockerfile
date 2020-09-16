# Version 1.0.1
FROM node:lts-alpine

# Install base and dev packages
RUN apk update
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Install build packages
RUN apk add make && apk add curl && apk add openssh && apk add git && apk add jq

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install azure-cli
RUN apk -Uuv add groff less gcc musl-dev openssl-dev libssl-dev libffi-dev python-dev python-pip

RUN curl -L https://aka.ms/InstallAzureCliBundled -o azure-cli_bundle.tar.gz
RUN tar -xvzf azure-cli_bundle.tar.gz
RUN azure-cli_bundle_*/installer
ENV PATH=$PATH:/root/bin

RUN yarn global add typescript

CMD ["/bin/bash"]