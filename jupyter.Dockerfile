ARG BASE_IMAGE=quay.io/jupyter/datascience-notebook:python-3.13

FROM ${BASE_IMAGE}

USER root

COPY environment.yaml /tmp/environment.yaml

# install dependencies
RUN mamba env update -n base -f /tmp/environment.yaml

ENV JUPYTER_ENABLE_LAB=yes

USER ${NB_USER}