#!/usr/bin/env bash
set -euo pipefail
[ -d results/index ] || salmon index -t "$(python -c "import yaml;print(yaml.safe_load(open('config/pipeline.yaml'))['reference'])")" -i results/index -p "$1"
