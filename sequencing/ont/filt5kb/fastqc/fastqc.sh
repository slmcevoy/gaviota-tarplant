#!/bin/bash

export PATH=$PATH:/public/groups/meyerlab/software/FastQC

fastqc -t 24 --outdir fastqc_filt_o ont_all_5kfilt.fastq.gz 1>fastqc.o 2>fastqc.e
