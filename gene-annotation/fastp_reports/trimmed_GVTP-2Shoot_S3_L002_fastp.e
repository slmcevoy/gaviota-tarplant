Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
GGATTTCGGTCCTATTACGTTGGCCTTCGGGATCGGAGTAATGATTAACAGGGACAGTCG

Read1 before filtering:
total reads: 37779604
total bases: 5305768021
Q20 bases: 5184102978(97.7069%)
Q30 bases: 4964974412(93.5769%)

Read2 before filtering:
total reads: 37779604
total bases: 5297494105
Q20 bases: 5141508018(97.0555%)
Q30 bases: 4862654850(91.7916%)

Read1 after filtering:
total reads: 37684891
total bases: 5292497151
Q20 bases: 5171197833(97.7081%)
Q30 bases: 4952650729(93.5787%)

Read2 after filtering:
total reads: 37684891
total bases: 5273684854
Q20 bases: 5118526112(97.0579%)
Q30 bases: 4841068609(91.7967%)

Filtering result:
reads passed filter: 75369782
reads failed due to low quality: 1728
reads failed due to too many N: 0
reads failed due to too short: 187698
reads with adapter trimmed: 379307
bases trimmed due to adapters: 20740974
reads with polyX in 3' end: 14355
bases trimmed in polyX tail: 515969

Duplication rate: 33.5209%

Insert size peak (evaluated by paired-end reads): 149

JSON report: trimmed/trimmed_GVTP-2Shoot_S3_L002.json
HTML report: trimmed/trimmed_GVTP-2Shoot_S3_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-2Shoot_S3_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-2Shoot_S3_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-2Shoot_S3_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-2Shoot_S3_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-2Shoot_S3_L002.json -h trimmed/trimmed_GVTP-2Shoot_S3_L002.html -R trimmed/trimmed_GVTP-2Shoot_S3_L002 
fastp v0.22.0, time used: 492 seconds
