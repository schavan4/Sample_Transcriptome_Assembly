#!/usr/bin/env bash
# longOrfs_args.sh
# Usage: bash scripts/longOrfs_args.sh <transcriptome> <Output> 1>results/logs/longOrfs.log 2>results/logs/longOrfs.err

# <transcriptome> data/trinity_de_novo/Trinity.fasta
# <Output> results/trinity_de_novo.transdecoder_dir

TransDecoder.LongOrfs -t $1 -O $2
