Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
GGAAACTTACCAGGTCCAGACATAGTAAGGATTGACAGACTGAGAGCTCTTTCTTGATTC

Read1 before filtering:
total reads: 34024639
total bases: 4803913045
Q20 bases: 4695726019(97.7479%)
Q30 bases: 4494324963(93.5555%)

Read2 before filtering:
total reads: 34024639
total bases: 4796174947
Q20 bases: 4682210378(97.6238%)
Q30 bases: 4463014503(93.0536%)

Read1 after filtering:
total reads: 33969731
total bases: 4796170738
Q20 bases: 4688183856(97.7485%)
Q30 bases: 4487089667(93.5557%)

Read2 after filtering:
total reads: 33969731
total bases: 4785992649
Q20 bases: 4672458130(97.6278%)
Q30 bases: 4453923579(93.0616%)

Filtering result:
reads passed filter: 67939462
reads failed due to low quality: 1516
reads failed due to too many N: 0
reads failed due to too short: 108300
reads with adapter trimmed: 160719
bases trimmed due to adapters: 6850981
reads with polyX in 3' end: 11172
bases trimmed in polyX tail: 368671

Duplication rate: 31.6113%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTP-5Root_S6_L002.json
HTML report: trimmed/trimmed_GVTP-5Root_S6_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-5Root_S6_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-5Root_S6_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-5Root_S6_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-5Root_S6_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-5Root_S6_L002.json -h trimmed/trimmed_GVTP-5Root_S6_L002.html -R trimmed/trimmed_GVTP-5Root_S6_L002 
fastp v0.22.0, time used: 442 seconds
