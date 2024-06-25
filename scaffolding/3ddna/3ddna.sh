#!/bin/bash

# ln -s /public/groups/meyerlab/software/3d-dna .

#awk -f /public/groups/meyerlab/software/3d-dna/utils/wrap-fasta-sequence.awk ../purge_haplotigs/curated.fasta > curated_wrapped.fasta

TMPDIR=/public/groups/meyerlab/gvtp/assemblies/flye_ont/3ddna/tmp

./3d-dna/run-asm-pipeline.sh --editor-repeat-coverage 5 ../purge_haplotigs/curated.fasta aligned/merged_nodups.txt 1>3ddna.o 2>3ddna.e
