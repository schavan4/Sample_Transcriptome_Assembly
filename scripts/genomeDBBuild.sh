#!/usr/bin/env bash
# genomeDBBuild.sh
# Usage: bash scripts/genomeDBBuild.sh 1>results/logs/genomeDBBuild.log 2>results/logs/genomeDBBuild.err &

dirPath=$1

gmap_build -D $dirPath \
-d GmapDb \
"${dirPath}DNAseq/spades/contigs.fasta"
