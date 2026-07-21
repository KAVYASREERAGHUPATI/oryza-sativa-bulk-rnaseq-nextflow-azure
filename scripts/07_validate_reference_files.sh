#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="/data/RNAseq_Project"

FASTA="${PROJECT_DIR}/reference/Oryza_sativa.IRGSP-1.0.dna_sm.toplevel.fa.gz"
GTF="${PROJECT_DIR}/reference/Oryza_sativa.IRGSP-1.0.62.gtf.gz"

echo "=========================================="
echo "Checking reference genome"
echo "=========================================="

if [[ ! -f "${FASTA}" ]]; then
    echo "ERROR: Reference genome not found:"
    echo "${FASTA}"
    exit 1
fi

echo "Reference genome found:"
ls -lh "${FASTA}"

echo "=========================================="
echo "Checking annotation file"
echo "=========================================="

if [[ ! -f "${GTF}" ]]; then
    echo "ERROR: GTF annotation file not found:"
    echo "${GTF}"
    exit 1
fi

echo "Annotation file found:"
ls -lh "${GTF}"

echo "=========================================="
echo "Testing gzip files"
echo "=========================================="

gzip -t "${FASTA}"
gzip -t "${GTF}"

echo "=========================================="
echo "Reference files are valid"
echo "=========================================="
