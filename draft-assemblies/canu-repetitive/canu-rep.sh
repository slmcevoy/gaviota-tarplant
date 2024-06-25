#!/bin/bash

export PATH=$PATH:/projects/GVTP/software/canu-2.2/bin

canu -p gvtp_ont_raw_repetitive -d /waveser/PROJECTS/GVTP/canu_ont_raw_repetitive \
	maxThreads=72 maxMemory=450 genomeSize=1.75g maxInputCoverage=100 \
	corMhapFilterThreshold=0.0000000002 corMhapOptions="--threshold 0.80 --num-hashes 256 --num-min-matches 3 --ordered-sketch-size 1000 --ordered-kmer-size 14 --min-olap-length 5000 --repeat-idf-scale 50" mhapMemory=60g mhapBlockSize=500 ovlMerDistinct=0.975 \
	corMhapSensitivity=normal corOutCoverage=200 correctedErrorRate=0.105 corMaxEvidenceErate=0.15 batOptions="-dg 3 -db 3 -dr 1 -ca 500 -cp 50" -nanopore /projects/GVTP/reads/ont/raw/ont_all.fastq.gz 1>canu2.o 2>canu2.e
