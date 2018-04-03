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
RUN apt-get install -y tcsh 
### Make “tcsh” default shell (optional/recommended)
RUN chsh -s /usr/bin/tcsh

### Install R
RUN find / -name 'cshrc' > find_cshrc
RUN tcsh -c "printenv"
RUN tcsh -c "tail find_cshrc"
RUN tcsh -c "setenv R_LIBS $HOME/R"

