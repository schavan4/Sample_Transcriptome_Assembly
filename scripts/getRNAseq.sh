#!/usr/bin/env bash
# getRNAseq.sh

dirPath=$1

mkdir -p "${dirPath}thermo_RNAseq"

# To get all RNA seq runs of all treatment groups in the experiment
for i in {40..52}
do
    fasterq-dump --split-3 "SRR125494${i}" -O "${dirPath}thermo_RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory
done
