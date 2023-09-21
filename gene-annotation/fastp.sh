#!/bin/bash

# conda activate fastp
# GVTP-1Root_S2_L002_R1_001.fastq.gz

for fi in */*R1_001.fastq.gz
do
R1=${fi}
R2="${R1//R1/$'R2'}"
F="${R1%????????????????}"
fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i ${R1} -I ${R2} -o trimmed/trimmed_${R1##*/} -O trimmed/trimmed_${R2##*/} -j ${F}.json -h ${F}.html -R ${F} 1>>${F}_fastp.o 2>>${F}_fastp.e

done
