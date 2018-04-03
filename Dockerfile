FROM ubuntu:xenial

LABEL maintainer="Leesuk \"Theodore\" Kim, Researcher in SungKyunKwan Univ.<leesuk.kim.skku@gmail.com>"

## volume
VOLUME [ "/hybiscus" ]

## Install AFNI and dependency packages
### Install prerequisite packages
RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y tcsh xfonts-base python-qt4 gsl-bin netpbm gnome-tweak-tool  \
                        libjpeg62 xvfb xterm vim curl gedit evince                  \
                        libglu1-mesa-dev libglw1-mesa libxm4 build-essential
RUN apt-get update
RUN apt-get install -y gnome-terminal nautilus      \
                        gnome-icon-theme-symbolic

### Make “tcsh” default shell (optional/recommended)
RUN chsh -s /usr/bin/tcsh

### Install R
RUN find / -name 'cshrc'
RUN tcsh -c "setenv R_LIBS $HOME/R"

