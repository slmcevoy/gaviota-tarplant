Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
TTTCGGTCCTATTACGTTGGCCTTCGGGATCGGAGTAATGATTAACAGGGACAGTCGGGG

Read1 before filtering:
total reads: 38175631
total bases: 5331422411
Q20 bases: 5208058421(97.6861%)
Q30 bases: 4988500997(93.5679%)

Read2 before filtering:
total reads: 38175631
total bases: 5320483519
Q20 bases: 5178958495(97.34%)
Q30 bases: 4919287078(92.4594%)

Read1 after filtering:
total reads: 38061884
total bases: 5315490554
Q20 bases: 5192566267(97.6874%)
Q30 bases: 4973673474(93.5694%)

Read2 after filtering:
total reads: 38061884
total bases: 5292330772
Q20 bases: 5151693691(97.3426%)
Q30 bases: 4893533859(92.4646%)

Filtering result:
reads passed filter: 76123768
reads failed due to low quality: 1776
reads failed due to too many N: 0
reads failed due to too short: 225718
reads with adapter trimmed: 439330
bases trimmed due to adapters: 24530069
reads with polyX in 3' end: 17093
bases trimmed in polyX tail: 720605

Duplication rate: 35.1367%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTP-1Shoot_S1_L002.json
HTML report: trimmed/trimmed_GVTP-1Shoot_S1_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-1Shoot_S1_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-1Shoot_S1_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-1Shoot_S1_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-1Shoot_S1_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-1Shoot_S1_L002.json -h trimmed/trimmed_GVTP-1Shoot_S1_L002.html -R trimmed/trimmed_GVTP-1Shoot_S1_L002 
fastp v0.22.0, time used: 445 seconds
