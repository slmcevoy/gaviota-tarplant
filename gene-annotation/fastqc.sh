#!/bin/bash

export PATH=$PATH:/public/groups/meyerlab/software/FastQC

for fi in trimmed/*.fastq.gz
do
#fastqc -t 24 --outdir fastq_o ${fi} 1>>fastqc.o 2>>fastqc.e
fastqc -t 48 --outdir fastq_trimmed ${fi} 1>fastqc_t.o 2>fastqc_t.e
done
