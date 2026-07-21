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

echo
echo "=========================================="
echo "Checking installed utilities"
echo "=========================================="

git --version
curl --version | head -n 1
wget --version | head -n 1
pigz --version
tree --version

echo
echo "=========================================="
echo "Utility installation completed successfully"
echo "=========================================="
