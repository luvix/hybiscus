FROM ubuntu:xenial

LABEL maintainer="Leesuk \"Theodore\" Kim, Researcher in SungKyunKwan Univ.<leesuk.kim.skku@gmail.com>"

## volume
VOLUME [ "/hybiscus" ]

## preparation to install fsl
# RUN apt-get update; apt-get -y dist-upgrade
# RUN apt-get install -y python

## install fsl
COPY fslinstaller.py .
RUN python /fslinstaller.py 
# RUN echo FSLDIR= >> .bashrc
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