#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Installing Java 17"
echo "=========================================="

sudo apt update

sudo apt install -y openjdk-17-jdk

echo "=========================================="
echo "Checking Java installation"
echo "=========================================="

java -version

echo "=========================================="
echo "Java installation completed successfully"
echo "=========================================="
