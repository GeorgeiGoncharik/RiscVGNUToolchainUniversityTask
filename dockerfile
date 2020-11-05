FROM ubuntu:20.04

LABEL maintainer="georgii.goncharik@gmail.com"
LABEL version="0.1"
LABEL description="docker-container with RISC-V GNU Compiler Toolchain, parameterized at build stage."

ENV RISCV=/opt/riscv
ENV PATH=$RISCV/bin:$PATH
WORKDIR $RISCV

ARG DEBIAN_FRONTEND=noninteractive
ARG ARCH
ARG ABI

RUN apt-get update
RUN apt-get install -y autoconf automake autotools-dev curl \
    python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
RUN apt-get install -y git

RUN git clone https://github.com/riscv/riscv-gnu-toolchain
WORKDIR $RISCV/riscv-gnu-toolchain
RUN git -c submodule."qemu".update=none submodule update --init --recursive

RUN ./configure --prefix=/opt/riscv --with-arch=${ARCH} --with-abi=${ABI} && make linux

WORKDIR /riscv-projects