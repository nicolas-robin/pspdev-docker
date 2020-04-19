FROM ubuntu:18.04
MAINTAINER Naomi Peori <naomi@peori.ca>

RUN \
  apt-get -y update && \
  DEBIAN_FRONTEND="noninteractive" apt-get -y install autoconf automake bison cmake doxygen flex g++ gcc git libelf-dev libgmp-dev libmpfr-dev libncurses5-dev libreadline-dev libsdl1.2-dev libtool-bin libusb-dev make mpc patch subversion tcl texinfo unzip wget && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /build
SHELL ["/bin/bash", "-c"]
ENV PSPDEV /usr/local/pspdev
ENV PATH ${PATH}:${PSPDEV}/bin

RUN \
  git clone https://github.com/nicolas-robin/psptoolchain.git && \
  pushd psptoolchain && \
    ./toolchain.sh && \
    popd && \
  rm -Rf psptoolchain
