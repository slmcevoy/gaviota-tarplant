#!/bin/bash

# run centrifuge to identify contaminated reads

/public/groups/meyerlab/software/centrifuge/centrifuge -p 24 -x /public/groups/meyerlab/software/centrifuge_index/abvf --report-file centrifuge_abvf_index_ditt_report_ont.tsv --quiet --min-hitlen 50 -q /public/groups/meyerlab/gvtp/ont/raw/ont_all.fastq  1>cent.o 2>cent.e

#filter contaminated reads

#grep -vw "unclassified" cent.o > ditt_contam_reads_abvf_index.txt

#awk NF=1 ditt_contam_reads_abvf_index.txt > ditt_contam_readids_abvf_index.txt

#sort -u ditt_contam_readids_abvf_index.txt > ditt_contam_readids_abvf_index_uniq.txt

#python remove_contams.py

