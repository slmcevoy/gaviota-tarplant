#!/bin/bash
#SBATCH --job-name=centrifuge_build_index
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 40
#SBATCH --partition=himem2
#SBATCH --qos=himem
#SBATCH --mail-type=END
#SBATCH --mem=500G
#SBATCH --mail-user=andrew.starovoitov@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load centrifuge/1.0.4-beta
module load blast/2.7.1

#centrifuge-download -P 16 -o taxonomy taxonomy
#centrifuge-download -P 16 -o library -m -d "fungi,archaea,viral,bacteria" refseq > seqid2taxid.map
#centrifuge-download -P 16 -o library -m -d "bacteria" refseq >> seqid2taxid.map

#cat library/archaea/*.fna > input-sequences.fna
#cat library/bacteria/*.fna >> input-sequences.fna
#cat library/viral/*.fna >> input-sequences.fna
#cat library/fungi/*.fna >> input-sequences.fna
centrifuge-build -p 40 --conversion-table seqid2taxid.map \
--taxonomy-tree taxonomy/nodes.dmp --name-table taxonomy/names.dmp \
input-sequences.fna abvf
