#!/usr/bin/env bash
set -euo pipefail
fastqc -t "$4" -o results/qc "$2" "$3"
