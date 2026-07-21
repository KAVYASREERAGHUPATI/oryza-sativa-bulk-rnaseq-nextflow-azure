#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "Generating nf-core/rnaseq samplesheet"
echo "=========================================="

# --------------------------------------------------
# Check whether the data disk is mounted
# --------------------------------------------------

if ! mountpoint -q /data; then
    echo "ERROR: The data disk is not mounted at /data."
    echo "Please run 00_prepare_data_disk.sh first."
    exit 1
fi

# --------------------------------------------------
# Define project directories
# --------------------------------------------------

PROJECT_DIR="/data/RNAseq_Project"

FASTQ_DIR="${PROJECT_DIR}/fastq"

METADATA_DIR="${PROJECT_DIR}/metadata"

SAMPLESHEET="${METADATA_DIR}/samplesheet.csv"

mkdir -p "${METADATA_DIR}"

echo "Creating samplesheet..."

# --------------------------------------------------
# Write header
# --------------------------------------------------

echo "sample,fastq_1,fastq_2,strandedness" > "${SAMPLESHEET}"

# --------------------------------------------------
# Find all Read 1 FASTQ files
# --------------------------------------------------

count=0

for R1 in "${FASTQ_DIR}"/*_1.fastq.gz
do
    [ -e "$R1" ] || continue

    SAMPLE=$(basename "$R1" "_1.fastq.gz")

    R2="${FASTQ_DIR}/${SAMPLE}_2.fastq.gz"

    if [ ! -f "$R2" ]; then
        echo "WARNING: Missing pair for ${SAMPLE}"
        continue
    fi

    echo "${SAMPLE},${R1},${R2},auto" >> "${SAMPLESHEET}"

    count=$((count + 1))

done

echo
echo "=========================================="
echo "Samplesheet successfully created!"
echo "=========================================="

echo "Output file:"
echo "${SAMPLESHEET}"

echo
echo "Total paired-end samples detected: ${count}"

echo
echo "Preview of samplesheet"
echo "------------------------------------------"

head "${SAMPLESHEET}"

echo "------------------------------------------"
