FROM mambaorg/micromamba:1.5.8
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml
RUN micromamba install -y -n base -f /tmp/environment.yml && micromamba clean --all --yes
WORKDIR /pipeline
COPY scripts ./scripts
COPY workflow ./workflow
COPY config ./config
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "bash", "scripts/run_pipeline.sh"]
