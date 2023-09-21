Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 32720241
total bases: 4555165575
Q20 bases: 4443941600(97.5583%)
Q30 bases: 4248036290(93.2576%)

Read2 before filtering:
total reads: 32720241
total bases: 4548738814
Q20 bases: 4414560127(97.0502%)
Q30 bases: 4174100607(91.7639%)

Read1 after filtering:
total reads: 32715026
total bases: 4554453456
Q20 bases: 4443350737(97.5606%)
Q30 bases: 4247509527(93.2606%)

Read2 after filtering:
total reads: 32715026
total bases: 4547973355
Q20 bases: 4413924549(97.0526%)
Q30 bases: 4173559069(91.7674%)

Filtering result:
reads passed filter: 65430052
reads failed due to low quality: 1372
reads failed due to too many N: 0
reads failed due to too short: 9058
reads with adapter trimmed: 452
bases trimmed due to adapters: 7984
reads with polyX in 3' end: 17508
bases trimmed in polyX tail: 661890

Duplication rate: 40.1383%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTP-1Root_S2_L002.json
HTML report: trimmed/trimmed_GVTP-1Root_S2_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-1Root_S2_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-1Root_S2_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-1Root_S2_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-1Root_S2_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-1Root_S2_L002.json -h trimmed/trimmed_GVTP-1Root_S2_L002.html -R trimmed/trimmed_GVTP-1Root_S2_L002 
fastp v0.22.0, time used: 419 seconds
