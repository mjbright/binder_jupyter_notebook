FROM andrewosh/binder-base

MAINTAINER Michael Bright <dockerfiles@mjbright.net>

USER root

RUN pip install --upgrade pip

# ---- As advised here:
#    https://github.com/binder-project/binder/issues/50
RUN pip install jupyter_client

# ---- Install bash_kernel:
# Make sure not to create a cache dir else NB_UID switching
# will hit issues.
RUN pip install --no-cache-dir bash_kernel

# ---- Clone my metakernel fork:
RUN git clone https://github.com/mjbright/metakernel

# ---- Install my metakernel fork:
#RUN pip install setuptools
RUN cd metakernel      && python ./setup.py install
RUN cd metakernel_bash && python ./setup.py install
RUN cd

# ---- Show installed kernels and python/pip versions:
RUN jupyter kernelspec list
RUN which python
RUN which pip

RUN python -m bash_kernel.install

USER main


