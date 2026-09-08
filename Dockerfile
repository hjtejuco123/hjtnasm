FROM --platform=linux/amd64 ubuntu:22.04

# 32-bit NASM assembly toolchain
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        nasm \
        binutils \
        build-essential \
        gcc-multilib \
        gdb \
        file \
        make \
        vim \
        libc6-dev-i386 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

CMD ["bash"]
