#!/bin/bash

# conda activate busco

input=canurep_contam_chloroplast_filtered.fasta

busco -c 48 -i "$input" -l embryophyta_odb10 -o busco_filt -m geno 1>busco_filt.o 2>busco_filt.e
