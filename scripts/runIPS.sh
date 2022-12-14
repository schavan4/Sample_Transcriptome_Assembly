#!/usr/bin/bash
# runIPS.sh
# Usage: bash scripts/runIPS.sh <data> <output> 1>results/logs/runIPS.log 2>results/logs/runIPS.err

interproscan.sh -cpu 2 -dp -f tsv -goterms -i $1 -o $2 -pa
