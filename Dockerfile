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

### new user: hybiscus
### Make “tcsh” default shell (optional/recommended)
RUN useradd -ms /usr/bin/tcsh hybiscus

### Install AFNI binaries
RUN su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_ubuntu_16_64/@update.afni.binaries"
RUN su - hybiscus -c "tcsh @update.afni.binaries -package linux_ubuntu_16_64  -do_extras"

### Install R
RUN su - hybiscus -c "echo 'setenv R_LIBS ~/R' >> ~/.cshrc"
RUN su - hybiscus -c "mkdir ~/R"
RUN su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh"
RUN tcsh /home/hybiscus/@add_rcran_ubuntu.tcsh
RUN su - hybiscus -c "tcsh -c '~/abin/rPkgsInstall -pkgs ALL'"

### Make AFNI/SUMA profiles
RUN su - hybiscus -c "cp ~/abin/AFNI.afnirc ~/.afnirc"
RUN su - hybiscus -c "tcsh -c 'suma -update_env'"
### Prepare for Bootcamp
RUN su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/edu/data/CD.tgz"
RUN su - hybiscus -c "tar xvzf CD.tgz"
RUN su - hybiscus -c "cd CD && tcsh s2.cp.files . ~"

### Evaluate setup/system (important!) 이거 abin 아냐???
RUN su - hybiscus -c "python abin/afni_system_check.py -check_all > ~/out.afni_system_check.txt"

### Niceify terminal (optional, but goood)
RUN su - hybiscus -c "echo 'set filec'      >> ~/.cshrc"
RUN su - hybiscus -c "echo 'set autolist'   >> ~/.cshrc"
RUN su - hybiscus -c "echo 'set nobeep'     >> ~/.cshrc"

RUN su - hybiscus -c "echo 'alias ls ls --color=auto'   >> ~/.cshrc"
RUN su - hybiscus -c "echo 'alias ll ls --color -l'     >> ~/.cshrc"
RUN su - hybiscus -c "echo 'alias ls=\"ls --color\"'    >> ~/.bashrc"
RUN su - hybiscus -c "echo 'alias ll=\"ls --color -l\"' >> ~/.bashrc"

RUN su - hybiscus -c "tcsh -c 'afni -ver'"
