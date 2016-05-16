FROM andrewosh/binder-base

MAINTAINER Michael Bright <dockerfiles@mjbright.net>

USER root

RUN pip install --upgrade pip

# Install bash_kernel:
# Make sure not to create a cache dir else NB_UID switching
# will hit issues.
RUN pip install --no-cache-dir bash_kernel

RUN jupyter kernelspec list

RUN pip install jupter_client

RUN jupyter kernelspec list

RUN which python
RUN which pip

RUN python -m bash_kernel.install

USER main


