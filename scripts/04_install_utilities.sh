#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Installing required Linux utilities"
echo "=========================================="

sudo apt update

sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    zip \
    pigz \
    gzip \
    tar \
    tree \
    htop \
    tmux \
    screen \
    nano \
    vim \
    jq

echo "=========================================="
echo "Checking installed utilities"
echo "=========================================="

git --version
curl --version
wget --version
pigz --version
tree --version

echo "=========================================="
echo "Utility installation completed"
echo "=========================================="
