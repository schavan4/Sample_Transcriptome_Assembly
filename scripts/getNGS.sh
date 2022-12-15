#!/usr/bin/env bash
# getNGS.sh

dirPath=$1
srrNum=$2

# Retrieve the Rhodobacter spheroides NGS reads.
fasterq-dump --split-3 $srrNum -O "${dirPath}DNAseq" -f	#Arguments specify the split mode, NGS identifier, and output directory
