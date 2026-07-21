#!/usr/bin/env bash

echo "=========================================="
echo "Generating nf-core/rnaseq samplesheet"
echo "=========================================="

# --------------------------------------------------
# Define project directories
# --------------------------------------------------

PROJECT_DIR="/data/RNAseq_Project"

FASTQ_DIR="${PROJECT_DIR}/fastq"

METADATA_DIR="${PROJECT_DIR}/metadata"

SAMPLESHEET="${METADATA_DIR}/samplesheet.csv"

# --------------------------------------------------
# Check whether FASTQ directory exists
# --------------------------------------------------

if [ ! -d "$FASTQ_DIR" ]; then
    echo "ERROR: FASTQ directory not found."
    echo "$FASTQ_DIR"
    exit 1
fi

mkdir -p "$METADATA_DIR"

echo "Creating samplesheet..."

# --------------------------------------------------
# Write header
# --------------------------------------------------

echo "sample,fastq_1,fastq_2,strandedness" > "$SAMPLESHEET"

# --------------------------------------------------
# Find all Read 1 FASTQ files
# --------------------------------------------------

count=0

for R1 in "$FASTQ_DIR"/*_1.fastq.gz
do

    # Skip if no FASTQ files exist
    [ -e "$R1" ] || continue

    SAMPLE=$(basename "$R1" "_1.fastq.gz")

    R2="${FASTQ_DIR}/${SAMPLE}_2.fastq.gz"

    if [ ! -f "$R2" ]; then
        echo "WARNING: Missing pair for $SAMPLE"
        continue
    fi

    echo "${SAMPLE},${R1},${R2},auto" >> "$SAMPLESHEET"

    count=$((count+1))

done

echo "=========================================="
echo "Samplesheet successfully created!"
echo "=========================================="

echo "Output file:"
echo "$SAMPLESHEET"

echo

echo "Total paired-end samples detected: $count"

echo

echo "Preview of samplesheet:"
echo "------------------------------------------"

head "$SAMPLESHEET"

echo "------------------------------------------"
