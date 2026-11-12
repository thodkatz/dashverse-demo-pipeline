#!/usr/bin/env bash
# Run every step for every sample in the sheet given as $1.
set -euo pipefail
SHEET=${1:-config/samples.tsv}
THREADS=$(python -c "import yaml;print(yaml.safe_load(open('config/pipeline.yaml'))['threads'])")
mkdir -p results/qc results/trimmed results/salmon
bash scripts/index.sh "$THREADS"
tail -n +2 "$SHEET" | while IFS=$'\t' read -r sample r1 r2; do
  bash scripts/qc.sh "$sample" "$r1" "$r2" "$THREADS"
  bash scripts/trim.sh "$sample" "$r1" "$r2"
  bash scripts/quant.sh "$sample" "$THREADS"
done
python workflow/merge_counts.py results/salmon results/counts.tsv
