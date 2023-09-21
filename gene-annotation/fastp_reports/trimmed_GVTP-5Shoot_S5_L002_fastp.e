Detecting adapter sequence for read1...
No adapter detected for read1

Detecting adapter sequence for read2...
No adapter detected for read2

Read1 before filtering:
total reads: 38688182
total bases: 5494994666
Q20 bases: 5373789356(97.7943%)
Q30 bases: 5149860340(93.7191%)

Read2 before filtering:
total reads: 38688182
total bases: 5488300611
Q20 bases: 5358982519(97.6437%)
Q30 bases: 5113846423(93.1772%)

Read1 after filtering:
total reads: 38685319
total bases: 5494582296
Q20 bases: 5373441879(97.7953%)
Q30 bases: 5149549702(93.7205%)

Read2 after filtering:
total reads: 38685319
total bases: 5487894926
Q20 bases: 5358649806(97.6449%)
Q30 bases: 5113562436(93.1789%)

Filtering result:
reads passed filter: 77370638
reads failed due to low quality: 1214
reads failed due to too many N: 0
reads failed due to too short: 4512
reads with adapter trimmed: 82
bases trimmed due to adapters: 1915
reads with polyX in 3' end: 11275
bases trimmed in polyX tail: 343814

Duplication rate: 22.7841%

Insert size peak (evaluated by paired-end reads): 147

JSON report: trimmed/trimmed_GVTP-5Shoot_S5_L002.json
HTML report: trimmed/trimmed_GVTP-5Shoot_S5_L002.html

fastp --thread 16 --detect_adapter_for_pe -x -l 50 -i trimmed/trimmed_GVTP-5Shoot_S5_L002_R1_001.fastq.gz -I trimmed/trimmed_GVTP-5Shoot_S5_L002_R2_001.fastq.gz -o trimmed/trimmed_trimmed_GVTP-5Shoot_S5_L002_R1_001.fastq.gz -O trimmed/trimmed_trimmed_GVTP-5Shoot_S5_L002_R2_001.fastq.gz -j trimmed/trimmed_GVTP-5Shoot_S5_L002.json -h trimmed/trimmed_GVTP-5Shoot_S5_L002.html -R trimmed/trimmed_GVTP-5Shoot_S5_L002 
fastp v0.22.0, time used: 609 seconds
