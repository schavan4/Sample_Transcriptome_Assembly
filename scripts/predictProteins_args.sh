#!/usr/bin/env bash
# predictProteins_args.sh
# Usage: bash scripts/predictProteins.sh <transcriptome> <transdecoder_dir> <pfam> <blastp> 1>results/logs/predictProteins.log 2>results/logs/predictProteins.err

#<transcriptome> /data/trinity_de_novo/Trinity.fasta
#<Output> /results/trinity_de_novo.transdecoder_dir
#<pfam> /results/pfam.domtblout
#<blastp> /results/blastPep.outfmt6

TransDecoder.Predict \
    -t $1 \
    -O $2 \
    --retain_pfam_hits $3 \
    --retain_blastp_hits $4 
