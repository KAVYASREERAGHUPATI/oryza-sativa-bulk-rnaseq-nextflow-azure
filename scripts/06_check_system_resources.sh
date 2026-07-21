#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Operating system"
echo "=========================================="

cat /etc/os-release

echo
echo "=========================================="
echo "CPU information"
echo "=========================================="

lscpu

echo
echo "=========================================="
echo "Memory information"
echo "=========================================="

free -h

echo
echo "=========================================="
echo "Disk information"
echo "=========================================="

df -h

echo
echo "=========================================="
echo "Mounted disks"
echo "=========================================="

lsblk

echo
echo "=========================================="
echo "Azure data disk status"
echo "=========================================="

if mountpoint -q /data; then
    echo "✓ Azure data disk is mounted at /data"
else
    echo "✗ Azure data disk is NOT mounted at /data"
    echo "Run 00_prepare_data_disk.sh before continuing."
fi

echo
echo "=========================================="
echo "Java version"
echo "=========================================="

java -version || true

echo
echo "=========================================="
echo "Docker version"
echo "=========================================="

docker --version || true

echo
echo "=========================================="
echo "Nextflow version"
echo "=========================================="

nextflow -version || true
