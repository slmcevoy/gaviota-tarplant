#!/bin/bash

# conda activate busco

#input=flye_o/assembly.fasta

#busco -c 24 -i "$input" -l embryophyta_odb10 -o busco_o -m geno 1>busco.o 2>busco.e

input=DEINVI_genome.fasta
busco -c 24 -i "$input" -l embryophyta_odb10 -o busco_final -m geno 1>buscof.o 2>buscof.e
