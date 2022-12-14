#!/usr/bin/env bash
# runQuast.sh

# following function runs quast to assess the genome assembly quality
dirPath=$1

function Quast {
    quast.py "${dirPath}thermo/spades/contigs.fasta"
}

Quast
