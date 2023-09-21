Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 40971981
total bases: 5800714292
Q20 bases: 5670754791(97.7596%)
Q30 bases: 5433396280(93.6677%)

Read2 before filtering:
total reads: 40971981
total bases: 5792876097
Q20 bases: 5638715181(97.3388%)
Q30 bases: 5355005394(92.4412%)

Read1 after filtering:
total reads: 40968499
total bases: 5800225205
Q20 bases: 5670339704(97.7607%)
Q30 bases: 5433024513(93.6692%)

Read2 after filtering:
total reads: 40968499
total bases: 5792374705
Q20 bases: 5638301950(97.3401%)
Q30 bases: 5354653704(92.4432%)

Filtering result:
reads passed filter: 81936998
reads failed due to low quality: 1232
reads failed due to too many N: 0
reads failed due to too short: 5732
reads with adapter trimmed: 188
bases trimmed due to adapters: 3887
reads with polyX in 3' end: 12838
bases trimmed in polyX tail: 425286

Duplication rate: 19.2882%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTPMLeaf_S7_L002.json
HTML report: trimmed/trimmed_GVTPMLeaf_S7_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTPMLeaf_S7_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTPMLeaf_S7_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTPMLeaf_S7_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTPMLeaf_S7_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTPMLeaf_S7_L002.json -h trimmed/trimmed_GVTPMLeaf_S7_L002.html -R trimmed/trimmed_GVTPMLeaf_S7_L002 
fastp v0.22.0, time used: 588 seconds
