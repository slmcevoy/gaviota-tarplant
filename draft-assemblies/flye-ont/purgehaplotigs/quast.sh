#!/bin/bash

input="curated.fasta"
python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" --large -o quast_o -t 24 1>quast.o 2>quast.e

#input="curated.haplotigs.fasta"
#python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" --large -o quast_alt_o -t 24 1>quastalt.o 2>quastalt.e
