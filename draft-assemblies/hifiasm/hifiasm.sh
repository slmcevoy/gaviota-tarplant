#!/bin/bash

export PATH=$PATH:/public/groups/meyerlab/software/hifiasm

hifiasm -o gvtp_adapterfiltered_hifiasm.asm -t 36 ../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz 1> hifiasm.o 2> hifiasm.e
