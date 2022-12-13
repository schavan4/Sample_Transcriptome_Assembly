#!/usr/bin/env bash
# getRNAseq.sh

dirPath=$1

# Retrieve the Thermus thermophilus RNA-seq reads.
for i in {40-52}
do
  fasterq-dump --split-3 "SRR125494${i}" -O "${dirPath}thermo_RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory
done
