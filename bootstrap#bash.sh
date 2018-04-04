
## "Leesuk \"Theodore\" Kim, Researcher in SungKyunKwan Univ.<leesuk.kim.skku@gmail.com>"

## Install AFNI and dependency packages
### Install prerequisite packages
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

### Make “tcsh” default shell (optional/recommended)
chsh -s /usr/bin/tcsh

### Install AFNI binaries
cd
curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_ubuntu_16_64/@update.afni.binaries
tcsh @update.afni.binaries -package linux_ubuntu_16_64  -do_extras

### Install R
export R_LIBS=$HOME/R
echo 'export R_LIBS=$HOME/R' >> ~/.bashrc
echo $R_LIBS
tcsh -c "setenv R_LIBS $HOME/R"
echo 'setenv R_LIBS $HOME/R' >> /etc/csh.cshrc  
mkdir $HOME/R
curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh
tcsh -c "tcsh @add_rcran_ubuntu.tcsh && rPkgsInstall -pkgs ALL"

# tcsh -c "sudo /root/abin/rPkgsInstall -pkgs ALL"

### Make AFNI/SUMA profiles
cp $HOME/abin/AFNI.afnirc $HOME/.afnirc 
tcsh -c "tcsh suma -update_env"
### Prepare for Bootcamp
curl -O https://afni.nimh.nih.gov/pub/dist/edu/data/CD.tgz
tar xvzf CD.tgz && cd CD
tcsh -c "tcsh s2.cp.files . ~ && cd .."

### Evaluate setup/system (important!)
tcsh -c "tcsh afni_system_check.py -check_all > ~/out.afni_system_check.txt"

### Niceify terminal (optional, but goood)
echo 'set filec' >> /etc/csh.cshrc
echo 'set autolist' >> /etc/csh.cshrc
echo 'set nobeep'   >> /etc/csh.cshrc
echo 'set filec' >> ~/.bashrc
echo 'set autolist' >> ~/.bashrc
echo 'set nobeep'   >> ~/.bashrc

echo 'alias ls ls --color=auto' >> /etc/csh.cshrc
echo 'alias ll ls --color -l'   >> /etc/csh.cshrc
echo 'alias ls="ls --color"'    >> ~/.bashrc
echo 'alias ll="ls --color -l"' >> ~/.bashrc

tcsh -c "tcsh echo afni -ver"
