#!/bin/bash

export TMPDIR=/projects/GVTP/wgd/tmp
export PATH=$PATH:/projects/GVTP/wgd/pal2nal.v14

#perl calculate_Ka_Ks_pipe.pl -d data/Ath.cds -g data/Ath.tandem.pairs -o result/Ath.td.kaks

#perl calculate_Ka_Ks_pipe.pl -d data_gvtplongest/gvtp_filtered_longest_isoform.wgdnaming.cds -g data_gvtplongest/gvtplongest.wgd.pairs -o result_gvtplongest/gvtplongest.wgd.kaks

perl calculate_Ka_Ks_pipe.pl -d data_hann/Hannuus_494_r1.2.cds_primaryTranscriptOnly.fa -g data_hann/hann.wgd.pairs -o result_hann/hann.wgd.kaks

