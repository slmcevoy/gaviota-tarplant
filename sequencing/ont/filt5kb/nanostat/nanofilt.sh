#!/bin/bash

#gunzip -c ../raw/ont_all.fastq.gz | NanoFilt -q 12 --logfile gvtp_ont_5k -l 5000 | gzip > ont_all_5kfilt.fastq.gz

NanoStat -t 16 --fastq ont_all_5kfilt.fastq.gz 1>nanostat.o 2>nanostat.e

