#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo "nf-core/rnaseq Pipeline Summary"
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
# Project directories
# --------------------------------------------------

PROJECT_DIR="/data/RNAseq_Project"

RESULTS_DIR="${PROJECT_DIR}/results"

PIPELINE_INFO="${RESULTS_DIR}/pipeline_info"

echo
echo "Project Directory:"
echo "${PROJECT_DIR}"

echo
echo "Results Directory:"
echo "${RESULTS_DIR}"

echo
echo "=========================================="
echo "Checking pipeline output"
echo "=========================================="

if [ ! -d "${RESULTS_DIR}" ]; then
    echo "ERROR: Results directory not found."
    echo "The pipeline may not have completed successfully."
    exit 1
fi

echo "Results directory found."

echo
echo "=========================================="
echo "Pipeline Reports"
echo "=========================================="

if [ -f "${RESULTS_DIR}/multiqc/multiqc_report.html" ]; then
    echo "✓ MultiQC Report"
    echo "${RESULTS_DIR}/multiqc/multiqc_report.html"
else
    echo "✗ MultiQC Report not found"
fi

echo

if [ -f "${PIPELINE_INFO}/execution_report.html" ]; then
    echo "✓ Nextflow Execution Report"
    echo "${PIPELINE_INFO}/execution_report.html"
else
    echo "✗ Execution Report not found"
fi

echo

if [ -f "${PIPELINE_INFO}/execution_timeline.html" ]; then
    echo "✓ Nextflow Timeline"
    echo "${PIPELINE_INFO}/execution_timeline.html"
else
    echo "✗ Timeline not found"
fi

echo

if [ -f "${PIPELINE_INFO}/execution_trace.txt" ]; then
    echo "✓ Nextflow Trace"
    echo "${PIPELINE_INFO}/execution_trace.txt"
else
    echo "✗ Trace file not found"
fi

echo

if [ -f "${PIPELINE_INFO}/pipeline_dag.html" ]; then
    echo "✓ Pipeline DAG"
    echo "${PIPELINE_INFO}/pipeline_dag.html"
else
    echo "✗ Pipeline DAG not found"
fi

echo
echo "=========================================="
echo "Checking Salmon quantification files"
echo "=========================================="

find "${RESULTS_DIR}" -name "*.sf"

echo
echo "=========================================="
echo "Checking featureCounts files"
echo "=========================================="

find "${RESULTS_DIR}" -name "*featureCounts*"

echo
echo "=========================================="
echo "Checking STAR alignment files"
echo "=========================================="

find "${RESULTS_DIR}" -name "*.bam"

echo
echo "=========================================="
echo "Disk usage"
echo "=========================================="

du -sh "${RESULTS_DIR}"

echo
echo "=========================================="
echo "Top-level result folders"
echo "=========================================="

ls -lh "${RESULTS_DIR}"

echo
echo "=========================================="
echo "Pipeline Summary Completed"
echo "=========================================="

echo
echo "Key output files:"
echo "1. MultiQC report"
echo "2. STAR alignment BAM files"
echo "3. Salmon quantification files"
echo "4. featureCounts gene count files"
echo "5. Nextflow execution reports"

echo
echo "Pipeline completed successfully."
