# FSL (FMRIB Software Library) 설치

[FSL 다운로드 페이지](https://fsl.fmrib.ox.ac.uk/fsldownloads_registration/download/fsl=4,o_s=16,d_type=release/)

[FSL Download script (python)](https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py)

``` cmd
ubuntu@server:~$ wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py
ubuntu@server:~$ sudo python fslinstaller.py
```

설치할 때 FSL 경로와 비밀번호를 지정하라는 메시지가 나온다.
`sudo`로 설치하는 것을 권장한다.

`FSLDIR`은 자동으로 path에 등록하지 않으므로 `sudo su`를 사용해서 root로 접속한 후 `.bashrc` 를 수정해야 한다.
``` sh
#FSL
FSLDIR=/usr/local/fsl
PATH=${FSLDIR}/bin:${PATH}
```

# AFNI (Analysis of Functional NeuroImages) 설치

`AFNI` 는 반드시 `tcsh` 터미널을 사용해야 한다.

## 필수 패키지 설치

```
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y tcsh xfonts-base python-qt4       \
                        gsl-bin netpbm gnome-tweak-tool   \
                        libjpeg62 xvfb xterm vim curl     \
                        gedit evince                      \
                        libglu1-mesa-dev libglw1-mesa     \
                        libxm4 build-essential
```

```
sudo apt-get update
sudo ln -s /usr/lib/x86_64-linux-gnu/libgsl.so /usr/lib/libgsl.so.0
```

```
sudo apt-get update
sudo ln -s /usr/lib/x86_64-linux-gnu/libgsl.so.19 /usr/lib/libgsl.so.19
```


```
wget http://ftp.br.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb
sudo dpkg -i libxp6_1.0.2-2_amd64.deb
sudo apt-get install -f
```

## installation

``` sh
cd
curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_ubuntu_16_64/@update.afni.binaries
tcsh @update.afni.binaries -package linux_openmp_64 -do_extras
```

# References

**FSL**
- [FslInstallationLinux](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/Linux)

**AFNI**

- [Ubuntu Linux (16.04 and some higher): The essential system setup](https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_linux_ubuntu16.html)
