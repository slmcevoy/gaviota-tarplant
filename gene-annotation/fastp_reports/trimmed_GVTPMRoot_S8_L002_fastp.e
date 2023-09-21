Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 32329793
total bases: 4587858984
Q20 bases: 4485405328(97.7669%)
Q30 bases: 4297734503(93.6763%)

Read2 before filtering:
total reads: 32329793
total bases: 4580496829
Q20 bases: 4465542023(97.4903%)
Q30 bases: 4252290917(92.8347%)

Read1 after filtering:
total reads: 32326418
total bases: 4587406323
Q20 bases: 4485015354(97.768%)
Q30 bases: 4297382725(93.6778%)

Read2 after filtering:
total reads: 32326418
total bases: 4580001731
Q20 bases: 4465133743(97.492%)
Q30 bases: 4251941581(92.8371%)

Filtering result:
reads passed filter: 64652836
reads failed due to low quality: 956
reads failed due to too many N: 0
reads failed due to too short: 5794
reads with adapter trimmed: 176
bases trimmed due to adapters: 3978
reads with polyX in 3' end: 13046
bases trimmed in polyX tail: 418896

Duplication rate: 16.8794%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTPMRoot_S8_L002.json
HTML report: trimmed/trimmed_GVTPMRoot_S8_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTPMRoot_S8_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTPMRoot_S8_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTPMRoot_S8_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTPMRoot_S8_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTPMRoot_S8_L002.json -h trimmed/trimmed_GVTPMRoot_S8_L002.html -R trimmed/trimmed_GVTPMRoot_S8_L002 
fastp v0.22.0, time used: 380 seconds
