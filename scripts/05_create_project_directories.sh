#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="/data/RNAseq_Project"

echo "=========================================="
echo "Creating RNA-seq project directories"
echo "=========================================="

sudo mkdir -p "${PROJECT_DIR}"

sudo chown -R "$USER":"$USER" "${PROJECT_DIR}"

mkdir -p "${PROJECT_DIR}/fastq"
mkdir -p "${PROJECT_DIR}/reference"
mkdir -p "${PROJECT_DIR}/metadata"
mkdir -p "${PROJECT_DIR}/scripts"
mkdir -p "${PROJECT_DIR}/results"
mkdir -p "${PROJECT_DIR}/work"
mkdir -p "${PROJECT_DIR}/logs"
mkdir -p "${PROJECT_DIR}/tmp"
mkdir -p "${PROJECT_DIR}/downloads"

echo "=========================================="
echo "Project directory structure"
echo "=========================================="

tree "${PROJECT_DIR}"

echo "=========================================="
echo "Directories created successfully"
echo "=========================================="
