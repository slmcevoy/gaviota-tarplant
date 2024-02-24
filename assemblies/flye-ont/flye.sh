#!/bin/bash


# conda activate flye
# but that makes building gfa at contig step really long  https://github.com/fenderglass/Flye/issues/428
# switched to v2.9 for fix

export PATH=$PATH:/public/groups/meyerlab/software/Flye/bin

flye --nano-hq ../../ont/raw/ont_all.fastq -g 1.75g -o flye_o -t 48 1>flye.o 2>flye.e
