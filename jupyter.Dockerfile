ARG BASE_IMAGE=quay.io/jupyter/datascience-notebook:python-3.13

FROM ${BASE_IMAGE}

USER root

COPY environment.yaml /tmp/environment.yaml

# install dependencies
RUN mamba env update -n base -f /tmp/environment.yaml
RUN pip install jupyter-matlab-proxy
RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MATLAB_RUNTIME_INSTALL_DIR}/runtime/glnxa64
RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MATLAB_RUNTIME_INSTALL_DIR}/bin/glnxa64
RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MATLAB_RUNTIME_INSTALL_DIR}/sys/os/glnxa64
RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MATLAB_RUNTIME_INSTALL_DIR}/extern/bin/glnxa64
RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${MATLAB_RUNTIME_INSTALL_DIR}/sys/opengl/lib/glnxa64;

USER ${NB_USER}