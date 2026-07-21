ACCESSION_FILE="/data/RNAseq_Project/metadata/sra_accessions.txt"

while read SRR
do
    echo "Downloading $SRR"

    prefetch "$SRR"

    fasterq-dump "$SRR" \
        --split-files \
        --threads 8 \
        --outdir .

    pigz -p 8 "${SRR}_1.fastq"
    pigz -p 8 "${SRR}_2.fastq"

done < "$ACCESSION_FILE"
