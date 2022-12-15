#!/usr/bin/env bash
# getRNAseq.sh

dirPath=$1
srrNum=$2
srrMin=$3
srrMax=$4

mkdir -p "${dirPath}RNAseq"

# To get all RNA seq runs of all treatment groups in the experiment
for i in {$srrMin..$srrMax}
do
    fasterq-dump --split-3 "${srrNum}${i}" -O "${dirPath}RNAseq" -f	#Arguments specify the split mode, RNA-seq read identifier, and output directory
done
