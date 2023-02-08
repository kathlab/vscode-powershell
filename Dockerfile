# syntax=docker/dockerfile-upstream:master-labs
FROM mcr.microsoft.com/powershell:lts-ubuntu-jammy

# args
ARG PROJECT="vscode-powershell"
ARG PACKAGES="git mc htop neovim git"

### install packages
RUN apt update && apt install -y ${PACKAGES}

## add default container user
RUN groupadd -g 1000 vscode
RUN useradd -rm -d /home/vscode -s /bin/bash -g root -G sudo -u 1000 vscode

## create vscode extension folders
RUN mkdir /home/vscode/.vscode-server
RUN mkdir /home/vscode/.vscode-server-insiders
RUN chown vscode:vscode /home/vscode/.vscode-server
RUN chown vscode:vscode /home/vscode/.vscode-server-insiders

WORKDIR /workspaces/${PROJECT}

## volumes

# vscode workspace
VOLUME [ "/workspaces/${PROJECT}" ]

# vscode extensions
VOLUME [ "/home/vscode/.vscode-server"]
VOLUME [ "/home/vscode/.vscode-server-insiders"]