#!/usr/bin/bash
# prepareForIPS.sh
# Usage: bash prepareForIPS.sh <lines> <data> <output> 1>results/logs/prepareForIPS.log 2>results/logs/prepareForIPS.err

lines=$1

head "-${lines}" $2 | sed 's/*//' > $3
