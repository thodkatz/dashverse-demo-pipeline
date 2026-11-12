#!/usr/bin/env bash
set -euo pipefail
salmon quant -i results/index -l A -p "$2" \
  -1 results/trimmed/"$1"/*_val_1.fq.gz -2 results/trimmed/"$1"/*_val_2.fq.gz \
  -o results/salmon/"$1"
