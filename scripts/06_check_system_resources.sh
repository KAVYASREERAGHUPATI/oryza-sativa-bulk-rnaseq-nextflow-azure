#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Operating system"
echo "=========================================="

cat /etc/os-release

echo "=========================================="
echo "CPU information"
echo "=========================================="

lscpu

echo "=========================================="
echo "Memory information"
echo "=========================================="

free -h

echo "=========================================="
echo "Disk information"
echo "=========================================="

df -h

echo "=========================================="
echo "Mounted disks"
echo "=========================================="

lsblk

echo "=========================================="
echo "Java version"
echo "=========================================="

java -version || true

echo "=========================================="
echo "Docker version"
echo "=========================================="

docker --version || true

echo "=========================================="
echo "Nextflow version"
echo "=========================================="

nextflow -version || true
