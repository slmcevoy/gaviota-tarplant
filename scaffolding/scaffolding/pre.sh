#!/bin/bash

#samtools faidx ../purge_haplotigs/curated.fasta

#cut -f1,2 ../purge_haplotigs/curated.fasta.fai > ../purge_haplotigs/curated.genome

bwa index ../purge_haplotigs/curated.fasta
