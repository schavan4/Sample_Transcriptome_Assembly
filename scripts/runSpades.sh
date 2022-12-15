#!/usr/bin/env bash
# runSpades.sh

# following function takes in the left and right reads, then outputs the data in /rhodo/
dirPath=$1

mkdir -p "${dirPath}DNAseq/spades"
srrNum=$2

function Spades {
    spades.py \
    -1 "${dirPath}trimmed/paired/${srrNum}.R1.paired.fastq" \
    -2 "${dirPath}trimmed/paired/${srrNum}.R2.paired.fastq" \
    -o "${dirPath}DNAseq/spades"
}

Spades # runs the function Spades
