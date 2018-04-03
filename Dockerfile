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
RUN chsh -s /usr/bin/tcsh && tcsh

### Install AFNI binaries
RUN cd
RUN curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_ubuntu_16_64/@update.afni.binaries
RUN tcsh @update.afni.binaries -package linux_ubuntu_16_64  -do_extras

### Install R
RUN tcsh -c "setenv R_LIBS $HOME/R"
RUN mkdir $R_LIBS
RUN tcsh -c "echo 'setenv R_LIBS ~/R' >> ~/.cshrc"
RUN curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh
RUN tcsh -c "@add_rcran_ubuntu.tcsh"
RUN tcsh -c "rPkgsInstall -pkgs ALL"

### Make AFNI/SUMA profiles
RUN cp $HOME/abin/AFNI.afnirc $HOME/.afnirc 
RUN tcsh suma -update_env
### Prepare for Bootcamp
RUN curl -O https://afni.nimh.nih.gov/pub/dist/edu/data/CD.tgz
RUN tar xvzf CD.tgz && cd CD
RUN tcsh s2.cp.files . ~ && cd ..

### Evaluate setup/system (important!)
RUN tcsh afni_system_check.py -check_all > ~/out.afni_system_check.txt

### Niceify terminal (optional, but goood)
RUN tcsh echo 'set filec' >> ~/.cshrc
RUN tcsh echo 'set autolist' >> ~/.cshrc
RUN tcsh echo 'set nobeep'   >> ~/.cshrc

RUN tcsh echo 'alias ls ls --color=auto' >> ~/.cshrc
RUN tcsh echo 'alias ll ls --color -l'   >> ~/.cshrc
RUN tcsh echo 'alias ls="ls --color"'    >> ~/.bashrc
RUN tcsh echo 'alias ll="ls --color -l"' >> ~/.bashrc

RUN tcsh echo afni -ver
