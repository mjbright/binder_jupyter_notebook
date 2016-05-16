FROM andrewosh/binder-base

MAINTAINER Michael Bright <dockerfiles@mjbright.net>

USER root

RUN pip install --upgrade pip

# Install bash_kernel:
# Make sure not to create a cache dir else NB_UID switching
# will hit issues.
RUN jupyter kernelspec list

RUN pip install jupyter_client

RUN pip install --no-cache-dir bash_kernel

RUN git clone https://github.com/mjbright/metakernel
#RUN pip install setuptools
#RUN cd metakernel      && python ./setup.py
#RUN cd metakernel_bash && python ./setup.py
#RUN cd

RUN jupyter kernelspec list

RUN which python
RUN which pip

RUN python -m bash_kernel.install

USER main


