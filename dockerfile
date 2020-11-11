FROM ubuntu:20.04

LABEL maintainer="georgii.goncharik@gmail.com"
LABEL version="0.1"
LABEL description="docker-container with RISC-V GNU Compiler Toolchain (Linux 64-bit)"

ENV RISCV=/opt/riscv
ENV SRCDIR=/tmp/riscv-tools
ENV PROJDIR=/riscv-projects
ENV PATH=$RISCV/bin:$PATH

ARG DEBIAN_FRONTEND=noninteractive
ARG ARCH
ARG ABI 

RUN apt-get update
RUN apt-get install -y autoconf automake autotools-dev curl \
    python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
RUN apt-get install -y git

WORKDIR $SRCDIR
RUN git clone https://github.com/riscv/riscv-gnu-toolchain
WORKDIR $SRCDIR/riscv-gnu-toolchain
RUN git -c submodule."qemu".update=none -c submodule."riscv-newlib".update=none submodule update --init --recursive

RUN ./configure --prefix=${RISCV} && make XLEN=32 linux

WORKDIR $SRCDIR
RUN rm -r -f riscv-gnu-toolchain

WORKDIR $PROJDIR