nextflow run nf-core/rnaseq \
    -profile docker \
    -c config/nextflow.config \
    --input /data/RNAseq_Project/metadata/samplesheet.csv \
    --outdir /data/RNAseq_Project/results \
    --fasta /data/RNAseq_Project/reference/Oryza_sativa.IRGSP-1.0.dna_sm.toplevel.fa.gz \
    --gtf /data/RNAseq_Project/reference/Oryza_sativa.IRGSP-1.0.62.gtf.gz \
    --aligner star_salmon \
    -resume
