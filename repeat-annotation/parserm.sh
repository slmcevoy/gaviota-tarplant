#!/bin/bash

perl /public/groups/meyerlab/software/Parsing-RepeatMasker-Outputs/parseRM.pl -i ../output/DEINVI_genome.fasta.out -p -f ../output/DEINVI_genome.masked.fasta -n -r ../output/gvtp_flye_3ddna-erc5-inpactor.fa -l 50,1 -v 1>parsermfix.o 2>parsermfix.e
