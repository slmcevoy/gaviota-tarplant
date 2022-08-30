#!/bin/bash

# run centrifuge to identify contaminated reads

#/redser4/projects/GVTP/software/centrifuge/centrifuge -p 16 -x /redser4/projects/GVTP/genome/filtering/abvf --report-file centrifuge_abvf_index_A1report.tsv --quiet --min-hitlen 50 -q /qnapNAS/GVTP/hifiadapterfilt/A1/m64069_220809_200722.hifi_reads.filt.fastq 1>centA1.o 2>centA1.e

#/redser4/projects/GVTP/software/centrifuge/centrifuge -p 16 -x /redser4/projects/GVTP/genome/filtering/abvf --report-file centrifuge_abvf_index_B1report.tsv --quiet --min-hitlen 50 -q /qnapNAS/GVTP/hifiadapterfilt/B1/m64069_220811_070224.hifi_reads.filt.fastq 1>centB1.o 2>centB1.e

#/redser4/projects/GVTP/software/centrifuge/centrifuge -p 16 -x /redser4/projects/GVTP/genome/filtering/abvf --report-file centrifuge_abvf_index_C1report.tsv --quiet --min-hitlen 50 -q /qnapNAS/GVTP/hifiadapterfilt/C1/m64069_220729_164623.hifi_reads.filt.fastq 1>centC1.o 2>centC1.e


#filter contaminated reads

#grep -vw "unclassified" centA1.o > A1_contam_reads_abvf_index.txt
#grep -vw "unclassified" centB1.o > B1_contam_reads_abvf_index.txt
#grep -vw "unclassified" centC1.o > C1_contam_reads_abvf_index.txt

#awk NF=1 A1_contam_reads_abvf_index.txt > A1_contam_readids_abvf_index.txt
#awk NF=1 B1_contam_reads_abvf_index.txt > B1_contam_readids_abvf_index.txt
#awk NF=1 C1_contam_reads_abvf_index.txt > C1_contam_readids_abvf_index.txt

#sort -u A1_contam_readids_abvf_index.txt > A1_contam_readids_abvf_index_uniq.txt
#sort -u B1_contam_readids_abvf_index.txt > B1_contam_readids_abvf_index_uniq.txt
#sort -u C1_contam_readids_abvf_index.txt > C1_contam_readids_abvf_index_uniq.txt

python remove_contams.py

