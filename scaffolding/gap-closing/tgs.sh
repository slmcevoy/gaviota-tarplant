#!/bin/bash

# conda activate purge_haplotigs

/public/groups/meyerlab/software/TGS-GapCloser/tgsgapcloser  \
--scaff  ../../curated_wrapped.FINAL.chloroplast_rm.contams_rm.ncbiclean.fasta \
--reads  ../gvtp_ont_raw_repetitive.correctedReads.fasta \
--output gvtp_flye_3ddna-erc5-ncbiclean_ne  \
--ne --thread 34 --minmap_arg '-I 400G -K 100G ' \
>tgs2.o 2>tgs2.e
