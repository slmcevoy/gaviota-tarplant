import sys
from Bio import SeqIO
#fastq_file = "/qnapNAS/GVTP/hifiadapterfilt/A1/m64069_220809_200722.hifi_reads.filt.fastq"
#remove_file = "A1_contam_readids_abvf_index_uniq.txt"
#result_file = "A1_m64069_220809_200722.hifi_reads.filt.abvf.fastq"
#fastq_file = "/qnapNAS/GVTP/hifiadapterfilt/B1/m64069_220811_070224.hifi_reads.filt.fastq"
#remove_file = "B1_contam_readids_abvf_index_uniq.txt"
#result_file = "B1_m64069_220811_070224.hifi_reads.filt.abvf.fastq"
fastq_file = "/qnapNAS/GVTP/hifiadapterfilt/C1/m64069_220729_164623.hifi_reads.filt.fastq"
remove_file = "C1_contam_readids_abvf_index_uniq.txt"
result_file = "C1_m64069_220729_164623.hifi_reads.filt.abvf.fastq"
with open(result_file, "w") as a, open(remove_file, "r") as b:
        reader = b.read().splitlines()
        for seq in SeqIO.parse(fastq_file, "fastq"):
                if seq.id not in reader:
                        SeqIO.write(seq, a, "fastq")
