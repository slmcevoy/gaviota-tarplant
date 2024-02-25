#!/bin/bash
#SBATCH --job-name=repeatmasker
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 32
#SBATCH --partition=himem
#SBATCH --qos=himem
#SBATCH --mail-type=END
#SBATCH --mem=370G
#SBATCH --mail-user=susanlmcevoy@gmail.com
#SBATCH -o repeatmasker_%j.out
#SBATCH -e repeatmasker_%j.err

module load RepeatMasker/4.1.5

#BuildDatabase -name gvtp DEINVI_genome.fasta
#RepeatModeler -database gvtp -LTRStruct -threads 62 1>rmod.o 2>rmod.e

#cat gvtp_flye_3ddna-erc5-families.fa InpactorDB_redundant_final_V5.fasta > gvtp_flye_3ddna-erc5-families_inpactordb.fa

#RepeatMasker -lib gvtp_flye_3ddna-erc5-families-inpactordb.fa -pa 32 -gff -a -noisy -xsmall -dir output DEINVI_genome.fasta

#cat gvtp_flye_3ddna-erc5-families.fa 20231019204302.fasta > gvtp_flye_3ddna-erc5-families-aster-rep.fasta

RepeatMasker -lib gvtp_flye_3ddna-erc5-families-aster-rep.fasta -pa 32 -gff -a -noisy -xsmall -dir output DEINVI_genome.fasta

