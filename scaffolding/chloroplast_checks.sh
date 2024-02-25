#!/bin/bash

#conda activate blast

#makeblastdb -in /public/groups/meyerlab/gvtp/chloroplast/Achyrachaena_mollis_chloroplast.fasta  -dbtype nucl -parse_seqids 1>blastmakedb.o 2>blastmakedb.e

#blastn -num_threads 24 -db /public/groups/meyerlab/gvtp/chloroplast/Achyrachaena_mollis_chloroplast.fasta -query ../purge_haplotigs/curated.fasta -outfmt 6 -out Achyrachaena_mollis_chloroplast_flye_asm.out 1>blast.o 2>blast.e

#blastn -num_threads 24 -db /public/groups/meyerlab/gvtp/chloroplast/Achyrachaena_mollis_chloroplast.fasta -query ../purge_haplotigs/curated.fasta -outfmt 0 -out Achyrachaena_mollis_chloroplast_flye_asm.0.out 1>blast0.o 2>blast0.e

#awk '{if ($4>=10000)print $0 }' Achyrachaena_mollis_chloroplast_flye_asm.out > Achyrachaena_mollis_chloroplast_flye_asm_filt10000.out

#awk '{if ($4>=3000)print $0 }' Achyrachaena_mollis_chloroplast_flye_asm.out > Achyrachaena_mollis_chloroplast_flye_asm_filt3000.out


#makeblastdb -in ../purge_haplotigs/curated.fasta -dbtype nucl -parse_seqids 1>blastmakedbgvtp.o 2>blastmakedbgvtp.e
#blastn -num_threads 24 -db ../purge_haplotigs/curated.fasta -query ../../../chloroplast/hifi3k/hifiasm/71.fasta -outfmt 6 -out flye_asm_chloroplast71.out 1>blast71.6.o 2>blast71.6.e
#awk '{if ($4>=10000)print $0 }' flye_asm_chloroplast71.out > flye_asm_chloroplast71.filt10000.out

#blastn -num_threads 24 -db ../purge_haplotigs/curated.fasta -query ../../../chloroplast/hifi3k/hifiasm/71.fasta -outfmt 0 -out flye_asm_chloroplast71.0.out 1>blast71.0.o 2>blast71.0.e

#makeblastdb -in ../purge_haplotigs/curated.haplotigs.fasta -dbtype nucl -parse_seqids 1>blastmakedbgvtpalt.o 2>blastmakedbgvtpalt.e
#blastn -num_threads 24 -db ../purge_haplotigs/curated.haplotigs.fasta -query ../../../chloroplast/hifi3k/hifiasm/71.fasta -outfmt 6 -out flye_altasm_chloroplast71.out 1>blast71alt.6.o 2>blast71alt.6.e
#awk '{if ($4>=10000)print $0 }' flye_altasm_chloroplast71.out > flye_altasm_chloroplast71.filt10000.out


#blastn -num_threads 24 -db ../purge_haplotigs/curated.haplotigs.fasta -query ../../../chloroplast/hifi3k/hifiasm/71.fasta -outfmt 0 -out flye_altasm_chloroplast71.0.out 1>blast71alt.0.o 2>blast71alt.0.e

#blastn -num_threads 24 -db ../purge_haplotigs/curated.fasta -query /public/groups/meyerlab/gvtp/chloroplast/hifi/hifiasm/getorganelle/gvtp_hifiasmmapped256igv2048_chloroplast/embplant_pt.complete.graph1.1.path_sequence.renamed.fasta -outfmt 6 -out flye_asm_chloroplast101.out 1>blast101.o 2>blast101.e

#awk '{if ($4>=10000)print $0 }' flye_asm_chloroplast101.out > flye_asm_chloroplast101.filt10000.out

makeblastdb -in ../curated_wrapped.FINAL.fasta -dbtype nucl -parse_seqids 1>blastmakedb.o 2>blastmakedb.e
blastn -num_threads 36 -db ../curated_wrapped.FINAL.fasta -query /public/groups/meyerlab/gvtp/chloroplast/hifi/hifiasm/getorganelle/gvtp_hifiasmmapped256igv2048_chloroplast/embplant_pt.complete.graph1.1.path_sequence.renamed.fasta -outfmt 6 -out flye_asm_chloroplast101.out 1>blast101.o 2>blast101.e

blastn -num_threads 36 -db ../curated_wrapped.FINAL.fasta -query /public/groups/meyerlab/gvtp/chloroplast/Achyrachaena_mollis_chloroplast.fasta -outfmt 6 -out flye_asm_Achyrachaeana.o 1>blastAch.o 2>blastAch.e

awk '{if ($4>=10000)print $0 }' flye_asm_chloroplast101.out > flye_asm_chloroplast101.filt10000.out
awk '{if ($4>=10000)print $0 }' flye_asm_Achyrachaeana.o > flye_asm_Achyrachaeana.filt10000.out
