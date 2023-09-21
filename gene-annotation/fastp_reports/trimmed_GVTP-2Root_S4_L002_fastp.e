Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 35830926
total bases: 5030035512
Q20 bases: 4919504261(97.8026%)
Q30 bases: 4715860483(93.754%)

Read2 before filtering:
total reads: 35830926
total bases: 5021415448
Q20 bases: 4869665580(96.9779%)
Q30 bases: 4600224188(91.6121%)

Read1 after filtering:
total reads: 35827312
total bases: 5029542898
Q20 bases: 4919088860(97.8039%)
Q30 bases: 4715490795(93.7559%)

Read2 after filtering:
total reads: 35827312
total bases: 5020886075
Q20 bases: 4869227712(96.9795%)
Q30 bases: 4599848825(91.6143%)

Filtering result:
reads passed filter: 71654624
reads failed due to low quality: 1246
reads failed due to too many N: 0
reads failed due to too short: 5982
reads with adapter trimmed: 192
bases trimmed due to adapters: 3785
reads with polyX in 3' end: 13757
bases trimmed in polyX tail: 442109

Duplication rate: 36.556%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTP-2Root_S4_L002.json
HTML report: trimmed/trimmed_GVTP-2Root_S4_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-2Root_S4_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-2Root_S4_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-2Root_S4_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-2Root_S4_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-2Root_S4_L002.json -h trimmed/trimmed_GVTP-2Root_S4_L002.html -R trimmed/trimmed_GVTP-2Root_S4_L002 
fastp v0.22.0, time used: 411 seconds
