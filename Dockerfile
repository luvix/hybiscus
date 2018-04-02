FROM ubuntu:xenial

LABEL maintainer="Leesuk \"Theodore\" Kim, Researcher in SungKyunKwan Univ.<leesuk.kim.skku@gmail.com>"

## volume
VOLUME [ "/hybiscus" ]

## preparation to install fsl

## install fsl
RUN apt-get update && apt-get install -y fsl-5.0-core

### Configure environment 
ENV FSLDIR=/usr/lib/fsl/5.0 
ENV FSLOUTPUTTYPE=NIFTI_GZ 
ENV PATH=$PATH:$FSLDIR 
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FSLDIR 

### Run configuration script for normal usage 
RUN echo ". /etc/fsl/5.0/fsl.sh" >> /root/.bashrc
RUN echo $FSLDIR
RUN flirt -version

## environment

## install afni
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y tcsh xfonts-base python-qt4       \
                        gsl-bin netpbm gnome-tweak-tool   \
                        libjpeg62 xvfb xterm vim curl     \
                        gedit evince                      \
                        libglu1-mesa-dev libglw1-mesa     \
                        libxm4 build-essential

## install matlab (install after entrypoint)