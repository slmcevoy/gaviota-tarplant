#!/bin/bash

#/public/groups/meyerlab/gvtp/rnaseq/RM_8RNA_S-23-0084_GAP507-380985426/FASTQ_Generation_2023-02-07_16_50_56Z-651909593/trimmed/trimmed_GVTP-1Root_S2_L002_R1_001.fastq.gz

#conda activate seqtk
export PATH=$PATH:/public/groups/meyerlab/software/hisat2-2.2.1:/public/groups/meyerlab/software/samtools-1.16.1

#hisat2-build -p 47 ../../assemblies/flye_ont/repeats/output/DEINVI_genome.masked.fasta gvtp_hisat

DIR="/public/groups/meyerlab/gvtp/alignments/hisat"
LIBDIR="/public/groups/meyerlab/gvtp/rnaseq/RM_8RNA_S-23-0084_GAP507-380985426/FASTQ_Generation_2023-02-07_16_50_56Z-651909593"
LIBS=$LIBDIR/trimmed
KRAKEN=$LIBDIR/kraken

# uncomment the 4 parts inside this loop as needed (see comments below)

#for f in "${LIBS}"/trimmed_*_R1_001.fastq.gz
#do 

# uncomment for part 1 - align all to see mapping rates

#	i=$(echo $f | sed 's/_R1_001.fastq.gz//')
#	b=$(basename $i)
#	hisat2 --dta -x gvtp_hisat -1 "${i}_R1_001.fastq.gz" -2 "${i}_R2_001.fastq.gz" -p 47 -S "${b}.sam"

# uncomment for part 2 to get unmapped reads (-f 4), make a list of their ids, and use that to create a fastq

#	samtools view -h -f 4 -o "${b}_unmapped.sam" "${b}.sam"
#	cut -f1 "${b}_unmapped.sam" | sort -u - > "${b}_unmapped_id_uniq.tsv"
#	seqtk subseq "${i}_R1_001.fastq.gz" "${b}_unmapped_id_uniq.tsv" > "${i}_R1_001_unmapped.fastq.gz"
#	seqtk subseq "${i}_R2_001.fastq.gz" "${b}_unmapped_id_uniq.tsv" > "${i}_R2_001_unmapped.fastq.gz"
#	echo "${b}" >> flagstat_all.txt
#	samtools flagstat "${b}.sam" >> flagstat_all.txt

# uncomment for part 3 - get the mapped reads ( -F 4), make a list of their ids and use it to create a fastq

#	samtools view -h -F 4 -o "${b}_mapped.sam" "${b}.sam"
#	cut -f1 "${b}_mapped.sam" | sort -u - > "${b}_mapped_id_uniq.tsv"
#	seqtk subseq "${i}_R1_001.fastq.gz" "${b}_mapped_id_uniq.tsv" > "${b}_R1_001_mapped.fastq"
#	seqtk subseq "${i}_R2_001.fastq.gz" "${b}_mapped_id_uniq.tsv" > "${b}_R2_001_mapped.fastq"

# part 4 - combined the mapped reads plus the kraken unclassified reads
#	b2=$(basename $b _L002)	
#	cat "${b}_R1_001_mapped.fastq" "${KRAKEN}/${b2}_unmapped_unclassified_1.fastq" > contamfilt/"${b}"_R1_mapped_unclassified.fastq
#	cat "${b}_R2_001_mapped.fastq" "${KRAKEN}/${b2}_unmapped_unclassified_2.fastq" > contamfilt/"${b}"_R2_mapped_unclassified.fastq

#done 


# part 5 - loop through and map the contam filtered reads you just created

for f in contamfilt/trimmed_*_R1_mapped_unclassified.fastq.gz
do
         b=$(basename $f _R1_mapped_unclassified.fastq.gz)
	 R1="${f}"
	 R2=${R1/R1/R2}
	 hisat2 --dta -x gvtp_hisat -1 "${R1}" -2 "${R2}" -p 47 -S contamfilt/"${b}.sam"
	 # get stats after converting to bam
	 #samtools flagstat contamfilt/"${b}_mapped_unclassified.bam" >> flagstat_contamfilt.txt
done

