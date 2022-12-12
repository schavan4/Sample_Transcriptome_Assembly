#!/usr/bin/env bash
# runSpades.sh

# following function takes in the left and right reads, then outputs the data in /rhodo/
dirPath=$1

function Spades {
    spades.py \
    -1 "${dirPath}trimmed/paired/Thermo.R1.paired.fastq" \
    -2 "${dirPath}trimmed/paired/Thermo.R2.paired.fastq" \
    -o "${dirPath}thermo"
}

Spades # runs the function Spades
