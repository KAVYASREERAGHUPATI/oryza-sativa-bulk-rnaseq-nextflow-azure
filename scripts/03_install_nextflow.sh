#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Checking Java"
echo "=========================================="

java -version

echo "=========================================="
echo "Installing Nextflow"
echo "=========================================="

cd /tmp

curl -s https://get.nextflow.io | bash

sudo mv nextflow /usr/local/bin/nextflow

sudo chmod +x /usr/local/bin/nextflow

echo "=========================================="
echo "Checking Nextflow installation"
echo "=========================================="

nextflow -version

echo "=========================================="
echo "Nextflow installation completed"
echo "=========================================="
