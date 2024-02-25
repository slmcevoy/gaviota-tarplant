#!/bin/bash

#BuildDatabase -name genome1 genome1.fa
#RepeatModeler -database genome1 [-LTRStruct] [-pa 8]
#RepeatMasker genome1.fa [-lib library.fa] [-pa 8]

#BuildDatabase -name gvtp_flye_ont_3k data/assembly_filt3000.fasta
#RepeatModeler -database gvtp_flye_ont_3k -LTRStruct -threads 62 1>rmod1.o 2>rmod1.e

#BuildDatabase -name gvtp_canu_ont_raw data/canu/gvtp_ont_raw.contigs.fasta
#RepeatModeler -database gvtp_canu_ont_raw -LTRStruct -threads 62 1>rmod_canu.o 2>rmod_canu.e

#BuildDatabase -name gvtp_verkko_raw ../data/verkko/assembly.fasta
#RepeatModeler -database gvtp_verkko_raw -LTRStruct -threads 62 1>rmod_verkko.o 2>rmod_verkko.e

cat ../RM_20.SatMar251658052023/consensi.fa.classified ../RM_20.SatMar251658052023/LTR_1805118.SunMar260304122023/LRET_1805118.SunMar260618402023/seq.fa.LTRlib.fa ../data/InpactorDB_redundant_final_V5.fasta > flyedenovo_ltrstruct_inpactor_all.fa

RepeatMasker -lib flyedenovo_ltrstruct_inpactor_all.fa -pa 62 -gff -a -noisy -xsmall -dir output ../data/assembly_filt3000.fasta 1>flye_masker.o 2>flye_masker.e

