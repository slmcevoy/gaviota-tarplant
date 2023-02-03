#!/bin/bash

export PATH=$PATH:/public/groups/meyerlab/software/FastQC

fastqc -t 24 --outdir fastqc_raw_o ont_all.fastq.gz 1>fastqc.o 2>fastqc.e
