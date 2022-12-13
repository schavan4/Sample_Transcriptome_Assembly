#!/usr/bin/env bash
# getRNAseq.sh

dirPath=$1

# Retrieve the Thermus thermophilus RNA-seq reads.
fasterq-dump --split-3 SRR12549440 -O "${dirPath}thermo_RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory
