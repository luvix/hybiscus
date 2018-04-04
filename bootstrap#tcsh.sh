#/usr/bin/tcsh
### Install AFNI binaries
su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_ubuntu_16_64/@update.afni.binaries"
su - hybiscus -c "tcsh @update.afni.binaries -package linux_ubuntu_16_64  -do_extras"

### Install R
su - hybiscus -c "echo 'setenv R_LIBS ~/R' >> ~/.cshrc"
su - hybiscus -c "mkdir ~/R"
su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/src/scripts_src/@add_rcran_ubuntu.tcsh"
tcsh /home/hybiscus/@add_rcran_ubuntu.tcsh
su - hybiscus -c "tcsh -c '~/abin/rPkgsInstall -pkgs ALL'"

### Make AFNI/SUMA profiles
su - hybiscus -c "cp ~/abin/AFNI.afnirc ~/.afnirc"
su - hybiscus -c "tcsh -c 'suma -update_env'"
### Prepare for Bootcamp
su - hybiscus -c "curl -O https://afni.nimh.nih.gov/pub/dist/edu/data/CD.tgz"
su - hybiscus -c "tar xvzf CD.tgz"
su - hybiscus -c "cd CD && tcsh s2.cp.files . ~"

### Evaluate setup/system (important!) 이거 abin 아냐???
su - hybiscus -c "python abin/afni_system_check.py -check_all > ~/out.afni_system_check.txt"

### Niceify terminal (optional, but goood)
su - hybiscus -c "echo 'set filec'      >> ~/.cshrc"
su - hybiscus -c "echo 'set autolist'   >> ~/.cshrc"
su - hybiscus -c "echo 'set nobeep'     >> ~/.cshrc"

su - hybiscus -c "echo 'alias ls ls --color=auto'   >> ~/.cshrc"
su - hybiscus -c "echo 'alias ll ls --color -l'     >> ~/.cshrc"
su - hybiscus -c "echo 'alias ls=\"ls --color\"'    >> ~/.bashrc"
su - hybiscus -c "echo 'alias ll=\"ls --color -l\"' >> ~/.bashrc"

su - hybiscus -c "tcsh -c 'afni -ver'"
