#!/bin/bash


#minimap2 -ax sr \
#  -t 16 assembly.fasta \
#  reads_1.fastq.gz reads_2.fastq.gz \
#  | samtools sort -@16 -O BAM -o assembly.reads.bam -

minimap2 -I 400G -K 100G -ax map-ont -t 48 ../../assemblies/flye_ont/DEINVI_genome.fasta -o DEINVI_genome_ontcorrectedreads.sam /public/groups/meyerlab/gvtp/ont/corrected/gvtp_ont_raw_repetitive.correctedReads.fasta --split-prefix tmp 1>minimap.o 2>minimap.e
samtools sort -@48 -O BAM -o DEINVI_genome_ontcorrectedreads.bam DEINVI_genome_ontcorrectedreads.sam 1>sort.o 2>sort.e

samtools index DEINVI_genome_ontcorrectedreads.bam
samtools flagstat DEINVI_genome_ontcorrectedreads.bam 1>flagstat.o 2>flagstat.e
