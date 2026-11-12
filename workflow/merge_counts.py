"""Merge the per-sample Salmon quant.sf files into one count table."""

import sys
from pathlib import Path

import pandas as pd


def merge(salmon_dir: Path) -> pd.DataFrame:
    columns = {}
    for quant in sorted(salmon_dir.glob("*/quant.sf")):
        table = pd.read_csv(quant, sep="\t", index_col="Name")
        columns[quant.parent.name] = table["NumReads"]
    return pd.DataFrame(columns)


if __name__ == "__main__":
    merge(Path(sys.argv[1])).to_csv(sys.argv[2], sep="\t")
