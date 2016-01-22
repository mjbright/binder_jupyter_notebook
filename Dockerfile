FROM andrewosh/binder-base

MAINTAINER Michael Bright <dockerfiles@mjbright.net>

USER root

#RUN pip install --upgrade pip

# Install bash_kernel:
# Make sure not to create a cache dir else NB_UID switching
# will hit issues.
RUN pip3 install --no-cache-dir bash_kernel && \
    python3 -m bash_kernel.install

USER main


