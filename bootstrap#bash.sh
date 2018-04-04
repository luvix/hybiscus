#! /bin/sh
## Install FSI, AFNI and dependency packages
### setup environment for installation
apt-get update; apt-get -y upgrade
apt-get install -y software-properties-common
add-apt-repository universe
apt-get update
apt-get install -y tcsh xfonts-base python-qt4 gsl-bin netpbm gnome-tweak-tool  \
                        libjpeg62 xvfb xterm vim curl gedit evince                  \
                        libglu1-mesa-dev libglw1-mesa libxm4 build-essential
apt-get update
apt-get install -y gnome-terminal nautilus      \
                        gnome-icon-theme-symbolic

### new user: hybiscus
useradd -m hybiscus

### Make “tcsh” default shell (optional/recommended)
su hybiscus -c "chsh -s /usr/bin/tcsh"

sudo tcsh bootstrap#tcsh.sh
