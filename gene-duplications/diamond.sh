#!/bin/bash

export PATH=$PATH:/software

#makeblastdb -in ../../annotations/renaming/gvtp_filtered.pep -parse_seqids -title "GVTP Protein Models" -dbtype prot 1>makedb.o 2>makedb.e

#blastp -query ../../annotations/renaming/gvtp_filtered.pep -db ../../annotations/renaming/gvtp_filtered.pep -evalue 1e-10 -max_target_seqs 5 -outfmt 6 -out gvtp.blast -num_threads 40 1>blast.o 2>blast.e

#blastp -query ../nnu/nnu.faa -db ../../annotations/renaming/gvtp_filtered.pep -evalue 1e-10 -max_target_seqs 5 -outfmt 6 -out gvtp_nnu.blast -num_threads 40 1>blastnnu.o 2>blastnnu.e


#diamond makedb --in ../gvtp_filtered_longest_isoform.wgdnaming.pep -d GVTPlongest

#diamond blastp -d GVTPlongest -q ../gvtp_filtered_longest_isoform.wgdnaming.pep -o GVTPlongest.blast -p 20 --sensitive --max-target-seqs 5 --evalue 1e-10 --quiet

#diamond blastp -d GVTPlongest -q ../nnu/nnu.faa -o GVTPlongest_nnu.blast -p 20 --sensitive --max-target-seqs 5 --evalue 1e-10 --quiet


diamond makedb --in ../helianthus/Hannuus_494_r1.2.protein_primaryTranscriptOnly.fa -d hann

diamond blastp -d hann -q ../helianthus/Hannuus_494_r1.2.protein_primaryTranscriptOnly.fa -o hann.blast -p 20 --sensitive --max-target-seqs 5 --evalue 1e-10 --quiet

diamond blastp -d hann -q ../nnu/nnu.faa -o hann_nnu.blast -p 20 --sensitive --max-target-seqs 5 --evalue 1e-10 --quiet
