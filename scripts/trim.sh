#!/usr/bin/env bash
# trim.sh

# path to the Trimmomatic program folder within our environment that contains the Illumina adapters
# this is only for Discovery - local systems will typically have a path like: /usr/local/programs/Trimmomatic-0.39-2/
# following code makes the required directories for output files

PATH_TO_TRIMMOMATIC="/shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2"
# following function takes in the left and right reads and outputs paired and unpaired trims of the left and right reads
dirPath=$1
srrNum=$2

mkdir -p "${dirPath}trimmed/unpaired"
mkdir -p "${dirPath}trimmed/paired"

function trim {
    trimmomatic PE \
    -threads 1 -phred33 \
    "${dirPath}DNAseq/${srrNum}_1.fastq" \
    "${dirPath}DNAseq/${srrNum}_2.fastq" \
    "${dirPath}trimmed/paired/${srrNum}.R1.paired.fastq" \
    "${dirPath}trimmed/unpaired/${srrNum}.R1.unpaired.fastq" \
    "${dirPath}trimmed/paired/${srrNum}.R2.paired.fastq" \
    "${dirPath}trimmed/unpaired/${srrNum}.R2.unpaired.fastq" \
    HEADCROP:0 \
    ILLUMINACLIP:$PATH_TO_TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trim
