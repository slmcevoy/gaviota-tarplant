#!/bin/bash


# conda activate purge_haplotigs

# minimap2 -t 4 -ax map-pb genome.fa subreads.fasta.gz --secondary=no \
#    | samtools sort -m 1G -o aligned.bam -T tmp.ali

# minimap2 -I 400G -K 100G -xmap-ont -t 48 assembly_filt3000.purged.fa /public/groups/meyerlab/gvtp/ont/raw/ont_all.fastq.gz > ont_3kmin.purged.paf 2>minimap_round2.e

#minimap2 -I 400G -K 100G -ax map-ont -t 48 ../gvtp_ont_raw.contigs.fasta /public/groups/meyerlab/gvtp/ont/raw/ont_all.fastq.gz --secondary=no --split-prefix tmp 1>gvtp_canu_minimap_ontraw.sam 2>minimap.e
#samtools sort -@48 -m 1G -o gvtp_canu_minimap_ontraw.bam -T tmp.ali gvtp_canu_minimap_ontraw.sam 1>sort.o 2>sort.e

# purge_haplotigs  hist  -b aligned.bam  -g genome.fasta  [ -t threads ]
#purge_haplotigs hist -b gvtp_canu_minimap_ontraw.bam -g ../gvtp_ont_raw.contigs.fasta -t 48  1>purgehap1.o 2> purgehap1.e

# https://bitbucket.org/mroachawri/purge_haplotigs/issues/123/help-needed-to-choose-correct-low-mid-and
# -l 0 -m 40 -h 190
purge_haplotigs  cov  -i gvtp_canu_minimap_ontraw.bam.gencov -l 0  -m 55  -h 190 1>purgehap2.o 2>purgehap2.e

purge_haplotigs purge -a 60 -g ../gvtp_ont_raw.contigs.fasta -c coverage_stats.csv -r canu_draftassembly_repeats.bed  -t 48 1>purgehap3.o 2>purgehap3.e
