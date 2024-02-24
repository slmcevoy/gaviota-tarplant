#!/bin/bash

input="flye_o/assembly.fasta"
#python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" --large -o quast_o -t 24 1>quast.o 2>quast.e
python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" -o quast_draftsmall -t 24 1>quastdraftsmall.o 2>quastdraftsmall.e

#input="DEINVI_genome.fasta"
#python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" --large -o quast_final -t 24 1>quastf.o 2>quastf.e

#python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" -o quast_finalsmall -t 24 1>quastfinalsmall.o 2>quastfinalsmall.e
