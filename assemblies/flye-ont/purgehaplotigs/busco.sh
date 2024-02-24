#!/bin/bash

# conda activate busco

input=curated.fasta

busco -c 38 -i "$input" -l embryophyta_odb10 -o busco_o -m geno 1>busco.o 2>busco.e
