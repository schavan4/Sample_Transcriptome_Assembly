#!/usr/bin/env bash
# getNGS.sh

# Retrieve the Rhodobacter spheroides NGS reads.
fasterq-dump --split-3 SRR12549453 -O "${1}thermo" -f	#Arguments specify the split mode, NGS identifier, and output directory
