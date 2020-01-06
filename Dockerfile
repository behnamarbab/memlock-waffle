FROM ubuntu:16.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s:/archive.ubuntu.com:/mirrors.tuna.tsinghua.edu.cn/ubuntu:g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update --fix-missing
RUN apt-get install -y wget git build-essential tmux cmake libtool automake autoconf autotools-dev m4 autopoint help2man bison flex texinfo sudo --fix-missing

RUN mkdir -p /workdir/MemLock

WORKDIR /workdir/MemLock
COPY . /workdir/MemLock

#RUN echo core|sudo tee /proc/sys/kernel/core_pattern
#RUN echo performance|sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
RUN tool/install_llvm.sh
RUN tool/install_MemLock.sh
