#!/bin/bash

#mkdir tmp
#ls /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220726_183843/C1/outputs/m64069_220729_164623.hifi_reads.fastq /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220809_195002/A1/outputs/m64069_220809_200722.hifi_reads.fastq /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220809_195002/B1/outputs/m64069_220811_070224.hifi_reads.fastq > FILES
# kmer 31, 20 threads, 200G of memory, counting kmer coverages between 1 and 500000x
#$HOME/software/kmc/bin/kmc -k31 -t20 -m200 -ci1 -cs500000 @FILES kmcdb tmp
#$HOME/software/kmc/bin/kmc_tools transform kmcdb histogram kmcdb_k31.hist -cx500000

# these lines help select lower and upper cutoffs for peaks
#L=$(smudgeplot.py cutoff kmcdb_k31.hist L)
#U=$(smudgeplot.py cutoff kmcdb_k31.hist U)
#echo $L $U # these need to be sane values
# L should be like 20 - 200
# U should be like 500 - 3000
#248  1400

# Genomescope has the kcov at 30.4, so trying that for L
L=19
U=1400

$HOME/software/KMC/bin/kmc_tools transform kmcdb -ci"$L" -cx"$U" reduce kmcdb_L"$L"_U"$U"
$HOME/software/KMC/bin/smudge_pairs kmcdb_L"$L"_U"$U" kmcdb_L"$L"_U"$U"_coverages.tsv kmcdb_L"$L"_U"$U"_pairs.tsv > kmcdb_L"$L"_U"$U"_familysizes.tsv

smudgeplot.py plot kmcdb_L"$L"_U"$U"_coverages.tsv
