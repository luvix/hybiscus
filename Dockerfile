FROM ubuntu:xenial

LABEL maintainer="Leesuk \"Theodore\" Kim, Researcher in SungKyunKwan Univ.<leesuk.kim.skku@gmail.com>"

## volume
VOLUME [ "/hybiscus" ]

## install fsl
COPY fslinstaller.py .
RUN python /fslinstaller.py 

## environment

## install afni

## install matlab (install after entrypoint)