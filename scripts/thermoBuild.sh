#!/usr/bin/env bash
# thermoBuild.sh
# Usage: bash scripts/thermoBuild.sh 1>results/logs/thermoBuild.log 2>results/logs/thermoBuild.err &

dirPath=$1

gmap_build -D dirPath \
-d ThermusGmapDb \
"${dirPath}thermo/GCA_001417965.1_Aiptasia_genome_1.1_genomic.fna
