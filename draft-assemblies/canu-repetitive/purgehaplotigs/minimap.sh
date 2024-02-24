#!/bin/bash


#minimap2 -ax sr \
#  -t 16 assembly.fasta \
#  reads_1.fastq.gz reads_2.fastq.gz \
#  | samtools sort -@16 -O BAM -o assembly.reads.bam -

minimap2 -I 400G -K 100G -ax map-ont -t 48 curated.fasta -o gvtpcanurepcurated_ontreads.sam /public/groups/meyerlab/gvtp/ont/raw/ont_all.fastq.gz --split-prefix tmp 1>minimap.o 2>minimap.e
samtools sort -@48 -O BAM -o gvtpcanurepcurated_ontreads.bam gvtpcanurepcurated_ontreads.sam 1>sort.o 2>sort.e

