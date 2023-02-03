#!/bin/bash

#mkdir tmp
#ls ../../ont/raw/ont_all.fastq.gz > FILES
# kmer 21, 16 threads, 64G of memory, counting kmer coverages between 1 and 10000x

#/public/groups/meyerlab/software/kmc/bin/kmc -k21 -t20 -m80 -ci1 -cs500000 @FILES gvtp_kmcdb tmp
#/public/groups/meyerlab/software/kmc/bin/kmc_tools transform gvtp_kmcdb histogram gvtp_kmcdb_k21.hist -cx500000

#L=$(smudgeplot.py cutoff gvtp_kmcdb_k21.hist L)
#U=$(smudgeplot.py cutoff gvtp_kmcdb_k21.hist U)
#echo $L $U # these need to be sane values
# L should be around 20 - 200
# U should be around 500 - 3000
# L and U returned as 290 and 1300

L=19
U=1300
/public/groups/meyerlab/software/KMC/bin/kmc_tools transform gvtp_kmcdb -ci"$L" -cx"$U" reduce kmcdb_L"$L"_U"$U"
/public/groups/meyerlab/software/KMC/bin/smudge_pairs kmcdb_L"$L"_U"$U" kmcdb_L"$L"_U"$U"_coverages.tsv kmcdb_L"$L"_U"$U"_pairs.tsv > kmcdb_L"$L"_U"$U"_familysizes.tsv

smudgeplot.py plot kmcdb_L"$L"_U"$U"_coverages.tsv
