#!/usr/bin/env bash
# getRNAseq.sh

dirPath=$1

mkdir -p "${dirPath}thermo_RNAseq"

# ONLY Retrieving the WT control group RNAseq run for this assignment to save on compute time, as I did not find small-size QC runs were found on SRA Run Selector

fasterq-dump --split-3 "SRR12549443" -O "${dirPath}thermo_RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory

# To get all RNA seq runs of all treatment groups in the experiment
#for i in {40-52}
#do
#    fasterq-dump --split-3 "SRR125494${i}" -O "${dirPath}thermo_RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory
#done
