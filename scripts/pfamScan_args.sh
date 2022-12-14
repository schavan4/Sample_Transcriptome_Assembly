#!/usr/bin/env bash
# pfamScan.sh
# Usage: bash scripts/pfamScan.sh <dotmblout> <longestOrfs> 1>results/logs/pfamScan.log 2>results/logs/pfamScan.err

#<dotmblout> /results/pfam.domtblout
#<longestOrfs> /results/trinity_de_novo.transdecoder_dir/longest_orfs.pep

hmmscan --cpu 32 --domtblout $1 $2 $3
