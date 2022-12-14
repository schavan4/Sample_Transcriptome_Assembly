#!/usr/bin/env bash
# alignPredicted_args.sh
# Usage: bash scripts/alignPredicted_args.sh <predictedProteins> 1>results/blastPep.outfmt6 2>results/logs/blastPep.err

# here, you are using many sequences; each will be run and compared to swissprot db
# let's make sure to run with -outfmt 6.  *NOTICE we are now using blastp*

#<predictedProteins> /results/predictedProteins/Trinity.fasta.transdecoder.pep


blastp -query $1 -db $2 -outfmt "6 qseqid sacc qlen slen length nident pident evalue stitle" -evalue 1e-10 -num_threads 32 
