#!/usr/bin/env bash
# getNGS.sh

dirPath=$1

# Retrieve the Rhodobacter spheroides NGS reads.
fasterq-dump --split-3 SRR12549453 -O "${dirPath}thermo" -f	#Arguments specify the split mode, NGS identifier, and output directory
