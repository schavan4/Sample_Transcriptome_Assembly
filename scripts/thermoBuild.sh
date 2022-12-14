#!/usr/bin/env bash
# thermoBuild.sh
# Usage: bash scripts/thermoBuild.sh 1>results/logs/thermoBuild.log 2>results/logs/thermoBuild.err &

dirPath=$1

mkdir -p "${dirPath}ThermusGmapDb"

gmap_build -D $dirPath \
-d ThermusGmapDb \
"${dirPath}thermo/contigs.fasta"
