#!/bin/bash
#SBATCH --job-name=kraken
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=120G
#SBATCH --mail-user=susanlmcevoy@gmail.com
#SBATCH -o kraken_%j.out
#SBATCH -e kraken_%j.err

hostname
echo "\nStart time:"
date

module load kraken/2.1.2
module load jellyfish/2.3.0

for f in gvtprnaseq/*R1*_unmapped.fastq
do
	R=$(basename "${f}" _L002_R1_001_unmapped.fastq)
        R1="${f}"
        R2=${R1/R1/R2}
	kraken2 -db /isg/shared/databases/kraken2/Minikraken2_v1 \
        --paired "${R1}" "${R2}" \
        --use-names \
        --threads 32 \
        --output "${R}"_unmapped_kraken_minikraken2_v1.out \
        --unclassified-out "${R}"_unmapped_unclassified#.fastq \
        --classified-out "${R}"_unmapped_classified#.fastq \
        --report "${R}"_unmapped_kraken_report.txt \
        --use-mpa-style
done

echo "\nEnd time:"
date

