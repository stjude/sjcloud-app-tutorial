FROM ubuntu:18.04

ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && \
    apt-get install wget zip gcc zlib1g-dev -y && \
    rm -r /var/lib/apt/lists/*

RUN wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda/ && \
    rm miniconda.sh

RUN conda update -n base -c defaults conda -y && \
    conda install \
    -c conda-forge \
    -c bioconda \
    coreutils==8.31 \
    picard==2.20.2 \
    samtools==1.9 \
    bwa==0.7.17 \
    -y && \
    conda clean --all -y

RUN pip install --no-cache-dir ngsderive
