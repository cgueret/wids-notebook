# Based on https://raw.githubusercontent.com/jupyter/docker-stacks/master/datascience-notebook/Dockerfile
FROM jupyter/scipy-notebook

USER root
RUN conda update -n base conda
RUN conda install --quiet --yes \
    'jupyter_contrib_nbextensions' \
    'jupyter_nbextensions_configurator' \
    'pandas-profiling' && \
    'plotly' && \
    conda clean --all && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER $NB_USER
RUN jupyter nbextensions_configurator enable --user

VOLUME /home/$NB_USER
WORKDIR /home/$NB_USER
