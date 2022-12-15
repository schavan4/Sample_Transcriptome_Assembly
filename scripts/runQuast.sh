#!/usr/bin/env bash
# runQuast.sh

# following function runs quast to assess the genome assembly quality
dirPath=$1

function Quast {
    quast.py "${dirPath}DNAseq/spades/contigs.fasta"
}

Quast
