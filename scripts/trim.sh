#!/usr/bin/env bash
set -euo pipefail
trim_galore --paired --quality 20 --length 30 -o "results/trimmed/$1" "$2" "$3"
