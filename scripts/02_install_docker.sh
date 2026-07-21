#!/usr/bin/env bash

echo "=========================================="
echo "Checking Docker installation..."
echo "=========================================="

if command -v docker >/dev/null 2>&1; then
    echo "Docker is already installed."
    docker --version
else
    echo "Docker is not installed."
    echo "Installing Docker..."

    sudo apt update
    sudo apt install -y docker.io

    echo "Starting and enabling Docker service..."
    sudo systemctl enable --now docker

    echo "Adding current user to Docker group..."
    sudo usermod -aG docker "$USER"

    echo "Refreshing Docker group membership..."
    newgrp docker
fi

echo "=========================================="
echo "Verifying Docker installation..."
echo "=========================================="

docker --version
docker run --rm hello-world

echo "=========================================="
echo "Listing running Docker containers..."
echo "=========================================="

docker ps

echo "=========================================="
echo "Installing bioinformatics tools..."
echo "=========================================="

sudo apt update

sudo apt install -y \
    sra-toolkit \
    pigz \
    parallel

echo "=========================================="
echo "Installing Azure CLI..."
echo "=========================================="

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "=========================================="
echo "Azure CLI installed successfully."
echo "=========================================="

echo "Please sign in to Azure by running:"
echo "az login"

echo "=========================================="
echo "Installation completed successfully."
echo "=========================================="
