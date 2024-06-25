#!/bin/bash

#conda activate blobtools2

#blobtools create --fasta ../curated_wrapped.FINAL.chloroplast_rm.fasta --taxid 425869 --taxdump /public/groups/meyerlab/gvtp/assemblies/flye_ont/3ddna/3ddna-erc5/blobtools/taxdump GVTPFlye3ddna

#blastn \
#-query ../curated_wrapped.FINAL.chloroplast_rm.fasta \
#-db /public/groups/meyerlab/dbs/nt/nt \
#-outfmt '6 qseqid staxids bitscore std' \
#-max_target_seqs 10 \
#-max_hsps 1 \
#-num_threads 48 \
#-evalue 1e-25 \
#-out gvtpflye3ddna_vs_nt.megablast.out 1>blobtools.o 2>blobtools.e

#blobtools add --hits gvtpflye3ddna_vs_nt.megablast.out --taxrule bestsumorder --taxdump /public/groups/meyerlab/gvtp/assemblies/flye_ont/3ddna/3ddna-erc5/blobtools/taxdump GVTPFlye3ddna
#blobtools add --cov ../minimap/flye_curated_wrapped.FINAL.chloroplast_rm_ontreads.bam GVTPFlye3ddna
#blobtools add --busco ../renamescafs/busco_pri_o/run_embryophyta_odb10/full_table.tsv DittrichiaPrimary


#blastn \
#-query curated_wrapped.FINAL.chloroplast_rm.arthropods.fasta \
#-db /public/groups/meyerlab/dbs/nt/nt \
#-outfmt '6 qseqid staxids bitscore std' \
#-max_target_seqs 20 \
#-max_hsps 5 \
#-num_threads 48 \
#-evalue 1e-25 \
#-out gvtpflye3ddna_vs_nt.arthropods.out 1>blobtools_arthropods.o 2>arthropods.e

blastn \
-query curated_wrapped.FINAL.chloroplast_rm.ascomycotas.fasta \
-db /public/groups/meyerlab/dbs/nt/nt \
-outfmt '6 qseqid staxids bitscore std' \
-max_target_seqs 20 \
-max_hsps 5 \
-num_threads 48 \
-evalue 1e-25 \
-out gvtpflye3ddna_vs_nt.ascomycotas.out 1>blobtools_ascomycotas.o 2>arthropods.e
