#!/bin/bash

export PATH=$PATH:/public/groups/meyerlab/software/hifiasm

hifiasm -o gvtp_hifiadapterfiltered_ont100kb_hifiasm.asm -t 36 --ul /public/groups/meyerlab/gvtp/ont/100kb/ont_all_100kfilt.fastq  ../../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz 1> hifiasm.o 2> hifiasm.e

