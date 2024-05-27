FROM debian

RUN apt-get update && \
    apt-get install --quiet --yes \
        bchunk \
        binutils-mips-linux-gnu \
        build-essential \
        cpp-mips-linux-gnu \
        gcc-mips-linux-gnu \
        git \
        # p7zip-full \
        # p7zip-rar \
        python3
