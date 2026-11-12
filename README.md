# rnaseq-mini

A containerised RNA-seq quantification pipeline: FastQC → trimming → Salmon → a merged count table.

This repository is a **demo** for the EVERSE DashVERSE dashboards: it plays the part of a pipeline that ships as a
container and is driven by shell scripts, with no unit tests and no releases.

## Run

```sh
docker compose run --rm pipeline config/samples.tsv
```

or build the image yourself:

```sh
docker build -t rnaseq-mini .
docker run --rm -v "$PWD/data:/data" rnaseq-mini /data/samples.tsv
```

Settings live in `config/pipeline.yaml`.
