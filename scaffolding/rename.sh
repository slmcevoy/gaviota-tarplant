#!/bin/bash
# pattern DEINVI_000001

awk '/^>/{print ">DEINVI_" sprintf("%05d", ++i); next}{ print }' < 3ddna/3ddna-erc5/gapfilling/gapfillingncbi/gvtp_flye_3ddna-erc5-ncbiclean_ne.scaff_seqs > DEINVI_genome.fasta

