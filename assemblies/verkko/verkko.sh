#!/bin/bash

# conda activate verkko_compiled
#     --local-memory           Specify the upper limit on memory to use, in GB, default 64
#    --local-cpus             Specify the number of CPUs to use, default 'all'
#   verkko -d <work-directory> --hifi <hifi-read-files> [--nano <ont-read-files>]

export PATH=$PATH:/public/groups/meyerlab/software/MBG/bin:/public/groups/meyerlab/software/verkko/bin

verkko --local-memory 450 --local-cpus 48 --mashmap /public/groups/meyerlab/software/mashmap-Linux64-v2.0/mashmap -d /public/groups/meyerlab/gvtp/assemblies/verkko --hifi ../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz --nano ../../ont/raw/ont_all.fastq.gz 1>verkko.o 2>verkko.e
