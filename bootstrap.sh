#! /bin/bash

## preparation to install fsl

wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py

## preparation to install afni

add-apt-repository universe
apt-get update
apt-get install -y tcsh xfonts-base python-qt4       \
                        gsl-bin netpbm gnome-tweak-tool   \
                        libjpeg62 xvfb xterm vim curl     \
                        gedit evince                      \
                        libglu1-mesa-dev libglw1-mesa     \
                        libxm4 build-essential

## install fsl

python fslinstaller.py

## install afni


## install matlab


## install anaconda3
