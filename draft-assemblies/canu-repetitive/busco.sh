#!/bin/bash

# conda activate busco

input=gvtp_ont_raw_repetitive.contigs.fasta

busco -c 24 -i "$input" -l embryophyta_odb10 -o busco_o -m geno 1>busco.o 2>busco.e
