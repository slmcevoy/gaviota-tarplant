#!/bin/bash

input="gvtp_ont_raw_repetitive.contigs.fasta"
python /public/groups/meyerlab/software/quast-5.2.0/quast.py "$input" --large -o quast_o -t 24 1>quast.o 2>quast.e
