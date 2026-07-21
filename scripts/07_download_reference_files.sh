#!/usr/bin/env bash

echo "=========================================="
echo "Downloading Reference Genome and Annotation"
echo "=========================================="

# --------------------------------------------------
# Project directories
# --------------------------------------------------

PROJECT_DIR="/data/RNAseq_Project"

REFERENCE_DIR="${PROJECT_DIR}/reference"

mkdir -p "$REFERENCE_DIR"

cd "$REFERENCE_DIR"

echo "Reference files will be downloaded to:"
pwd

echo "=========================================="
echo "Downloading Oryza sativa reference genome"
echo "=========================================="

wget -c \
https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-62/fasta/oryza_sativa/dna/Oryza_sativa.IRGSP-1.0.dna_sm.toplevel.fa.gz

echo "=========================================="
echo "Downloading GTF annotation"
echo "=========================================="

wget -c \
https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-62/gtf/oryza_sativa/Oryza_sativa.IRGSP-1.0.62.gtf.gz

# --------------------------------------------------
# File locations
# --------------------------------------------------

FASTA="${REFERENCE_DIR}/Oryza_sativa.IRGSP-1.0.dna_sm.toplevel.fa.gz"

GTF="${REFERENCE_DIR}/Oryza_sativa.IRGSP-1.0.62.gtf.gz"

echo "=========================================="
echo "Checking downloaded reference genome"
echo "=========================================="

if [[ ! -f "${FASTA}" ]]; then
    echo "ERROR: Reference genome not found."
    echo "${FASTA}"
    exit 1
fi

echo "Reference genome downloaded successfully."

ls -lh "${FASTA}"

echo "=========================================="
echo "Checking downloaded annotation"
echo "=========================================="

if [[ ! -f "${GTF}" ]]; then
    echo "ERROR: Annotation file not found."
    echo "${GTF}"
    exit 1
fi

echo "Annotation file downloaded successfully."

ls -lh "${GTF}"

echo "=========================================="
echo "Testing compressed files"
echo "=========================================="

gzip -t "${FASTA}"

if [ $? -eq 0 ]; then
    echo "Reference genome passed gzip integrity test."
else
    echo "Reference genome is corrupted."
    exit 1
fi

gzip -t "${GTF}"

if [ $? -eq 0 ]; then
    echo "Annotation file passed gzip integrity test."
else
    echo "Annotation file is corrupted."
    exit 1
fi

echo "=========================================="
echo "Reference files downloaded successfully"
echo "=========================================="

echo "Reference Genome:"
echo "${FASTA}"

echo

echo "Annotation File:"
echo "${GTF}"

echo

echo "Files available in:"
echo "${REFERENCE_DIR}"

echo "=========================================="
echo "Reference download completed successfully."
echo "=========================================="
