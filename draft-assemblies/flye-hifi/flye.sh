#!/bin/bash


# conda activate flye
# but that makes building gfa at contig step really long  https://github.com/fenderglass/Flye/issues/428
# switched to v2.9 for fix

export PATH=$PATH:/public/groups/meyerlab/software/Flye/bin

#flye --pacbio-hifi ../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz -o flye_o -g 1.75g -t 48 1>flye.o 2>flye.e

flye --resume-from consensus --pacbio-hifi ../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz -o flye_o -g 1.75g -t 48 1>flye2.o 2>flye2.e
