Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 48
Rules claiming more threads will be scaled down.
Provided resources: mem_gb=450
Job stats:
job                            count    min threads    max threads
---------------------------  -------  -------------  -------------
buildGraph                         1              4              4
buildPackages                      1              8              8
buildStore                         1              1              1
combineConsensus                   1              1              1
combineONT                         1              1              1
combineOverlaps                    1              1              1
combineOverlapsConfigure           1              1              1
configureFindErrors                1              1              1
configureOverlaps                  1              1              1
correctHiFi                        1              1              1
emptyfile                          1              1              1
extractONT                         1              8              8
fixErrors                          1              1              1
generateLayoutContigsInputs        1              1              1
getCoverage                        3              1              1
layoutContigs                      1              1              1
prepCoverage                       1              1              1
processGraph                       1              1              1
processONT                         1              1              1
splitONT                           1              1              1
untip                              1              1              1
verkko                             1              1              1
total                             24              1              8

Select jobs to execute...

[Mon Mar 27 11:34:35 2023]
localrule emptyfile:
    output: emptyfile
    jobid: 14
    reason: Missing output files: emptyfile
    resources: tmpdir=/data/tmp


[Mon Mar 27 11:34:35 2023]
checkpoint splitONT:
    input: /public/groups/meyerlab/gvtp/assemblies/verkko/../../ont/raw/ont_all.fastq.gz
    output: 3-align/splitONT.finished
    log: 3-align/splitONT.err
    jobid: 13
    reason: Missing output files: 3-align/splitONT.finished
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=8, time_h=96
DAG of jobs will be updated after completion.


[Mon Mar 27 11:34:35 2023]
rule buildStore:
    input: /public/groups/meyerlab/gvtp/assemblies/verkko/../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz
    output: 0-correction/hifi.seqStore
    log: 0-correction/buildStore.err
    jobid: 7
    reason: Missing output files: 0-correction/hifi.seqStore
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=4

[Mon Mar 27 11:34:35 2023]
Finished job 14.
1 of 24 steps (4%) done
[Mon Mar 27 12:14:03 2023]
Finished job 7.
2 of 24 steps (8%) done
Select jobs to execute...

[Mon Mar 27 12:14:03 2023]
localcheckpoint configureOverlaps:
    input: 0-correction/hifi.seqStore
    output: 0-correction/configureOverlaps.finished
    log: 0-correction/configureOverlaps.err
    jobid: 9
    reason: Missing output files: 0-correction/configureOverlaps.finished; Input files updated by another job: 0-correction/hifi.seqStore
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=1, time_h=1
DAG of jobs will be updated after completion.

[Mon Mar 27 12:14:05 2023]
Finished job 9.
3 of 24 steps (12%) done
Select jobs to execute...

[Mon Mar 27 12:14:06 2023]
checkpoint configureKmers:
    input: 0-correction/hifi.seqStore
    output: 0-correction/configureKmers.finished
    log: 0-correction/configureKmers.err
    jobid: 28
    reason: Missing output files: 0-correction/configureKmers.finished
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=1
DAG of jobs will be updated after completion.

[Mon Mar 27 12:14:08 2023]
Finished job 28.
4 of 292 steps (1%) done
Select jobs to execute...

[Mon Mar 27 12:14:08 2023]
rule computeKmers:
    input: 0-correction/hifi.seqStore, 0-correction/kmer-jobs/009.params, 0-correction/kmer-jobs/nSegments, 0-correction/configureKmers.finished
    output: 0-correction/kmer-jobs/009.meryl/merylIndex
    log: 0-correction/kmer-jobs/009.err
    jobid: 297
    reason: Missing output files: 0-correction/kmer-jobs/009.meryl/merylIndex
    wildcards: nnnn=009
    threads: 4
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=4, mem_gb=32, time_h=8


[Mon Mar 27 12:14:08 2023]
rule computeKmers:
    input: 0-correction/hifi.seqStore, 0-correction/kmer-jobs/001.params, 0-correction/kmer-jobs/nSegments, 0-correction/configureKmers.finished
    output: 0-correction/kmer-jobs/001.meryl/merylIndex
    log: 0-correction/kmer-jobs/001.err
    jobid: 295
    reason: Missing output files: 0-correction/kmer-jobs/001.meryl/merylIndex
    wildcards: nnnn=001
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=8


[Mon Mar 27 12:14:08 2023]
rule computeKmers:
    input: 0-correction/hifi.seqStore, 0-correction/kmer-jobs/005.params, 0-correction/kmer-jobs/nSegments, 0-correction/configureKmers.finished
    output: 0-correction/kmer-jobs/005.meryl/merylIndex
    log: 0-correction/kmer-jobs/005.err
    jobid: 296
    reason: Missing output files: 0-correction/kmer-jobs/005.meryl/merylIndex
    wildcards: nnnn=005
    threads: 4
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=4, mem_gb=32, time_h=8

[Mon Mar 27 12:33:23 2023]
Finished job 297.
5 of 295 steps (2%) done
[Mon Mar 27 13:27:46 2023]
Finished job 295.
6 of 295 steps (2%) done
[Mon Mar 27 13:28:21 2023]
Finished job 13.
7 of 295 steps (2%) done
[Mon Mar 27 13:28:21 2023]
Finished job 296.
8 of 395 steps (2%) done
Select jobs to execute...

[Mon Mar 27 13:28:21 2023]
rule countKmers:
    input: 0-correction/configureKmers.finished, 0-correction/kmer-jobs/001.meryl/merylIndex, 0-correction/kmer-jobs/005.meryl/merylIndex, 0-correction/kmer-jobs/009.meryl/merylIndex
    output: 0-correction/hifi.ignoremers
    log: 0-correction/combineKmers.err
    jobid: 27
    reason: Missing output files: 0-correction/hifi.ignoremers; Input files updated by another job: 0-correction/kmer-jobs/005.meryl/merylIndex, 0-correction/kmer-jobs/001.meryl/merylIndex, 0-correction/kmer-jobs/009.meryl/merylIndex
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Mon Mar 27 13:30:43 2023]
Finished job 27.
9 of 395 steps (2%) done
Select jobs to execute...

[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000233.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000233.ovb, 0-correction/overlap-jobs/000233.stats
    log: 0-correction/overlap-jobs/000233.err
    jobid: 260
    reason: Missing output files: 0-correction/overlap-jobs/000233.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000233
    threads: 8
    resources: tmpdir=/data/tmp, job_id=233, n_cpus=8, mem_gb=32, time_h=24


[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000006.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000006.ovb, 0-correction/overlap-jobs/000006.stats
    log: 0-correction/overlap-jobs/000006.err
    jobid: 33
    reason: Missing output files: 0-correction/overlap-jobs/000006.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000006
    threads: 8
    resources: tmpdir=/data/tmp, job_id=6, n_cpus=8, mem_gb=32, time_h=24


[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000037.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000037.ovb, 0-correction/overlap-jobs/000037.stats
    log: 0-correction/overlap-jobs/000037.err
    jobid: 64
    reason: Missing output files: 0-correction/overlap-jobs/000037.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000037
    threads: 8
    resources: tmpdir=/data/tmp, job_id=37, n_cpus=8, mem_gb=32, time_h=24


[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000093.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000093.ovb, 0-correction/overlap-jobs/000093.stats
    log: 0-correction/overlap-jobs/000093.err
    jobid: 120
    reason: Missing output files: 0-correction/overlap-jobs/000093.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000093
    threads: 8
    resources: tmpdir=/data/tmp, job_id=93, n_cpus=8, mem_gb=32, time_h=24


[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000149.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000149.ovb, 0-correction/overlap-jobs/000149.stats
    log: 0-correction/overlap-jobs/000149.err
    jobid: 176
    reason: Missing output files: 0-correction/overlap-jobs/000149.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000149
    threads: 8
    resources: tmpdir=/data/tmp, job_id=149, n_cpus=8, mem_gb=32, time_h=24


[Mon Mar 27 13:30:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000097.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000097.ovb, 0-correction/overlap-jobs/000097.stats
    log: 0-correction/overlap-jobs/000097.err
    jobid: 124
    reason: Missing output files: 0-correction/overlap-jobs/000097.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000097
    threads: 8
    resources: tmpdir=/data/tmp, job_id=97, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 13:48:14 2023]
Finished job 33.
10 of 395 steps (3%) done
Select jobs to execute...

[Mon Mar 27 13:48:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000038.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000038.ovb, 0-correction/overlap-jobs/000038.stats
    log: 0-correction/overlap-jobs/000038.err
    jobid: 65
    reason: Missing output files: 0-correction/overlap-jobs/000038.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000038
    threads: 8
    resources: tmpdir=/data/tmp, job_id=38, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 13:52:31 2023]
Finished job 64.
11 of 395 steps (3%) done
Select jobs to execute...

[Mon Mar 27 13:52:32 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000058.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000058.ovb, 0-correction/overlap-jobs/000058.stats
    log: 0-correction/overlap-jobs/000058.err
    jobid: 85
    reason: Missing output files: 0-correction/overlap-jobs/000058.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000058
    threads: 8
    resources: tmpdir=/data/tmp, job_id=58, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:00:17 2023]
Finished job 124.
12 of 395 steps (3%) done
Select jobs to execute...

[Mon Mar 27 14:00:17 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000114.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000114.ovb, 0-correction/overlap-jobs/000114.stats
    log: 0-correction/overlap-jobs/000114.err
    jobid: 141
    reason: Missing output files: 0-correction/overlap-jobs/000114.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000114
    threads: 8
    resources: tmpdir=/data/tmp, job_id=114, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:01:10 2023]
Finished job 120.
13 of 395 steps (3%) done
Select jobs to execute...

[Mon Mar 27 14:01:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000206.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000206.ovb, 0-correction/overlap-jobs/000206.stats
    log: 0-correction/overlap-jobs/000206.err
    jobid: 233
    reason: Missing output files: 0-correction/overlap-jobs/000206.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000206
    threads: 8
    resources: tmpdir=/data/tmp, job_id=206, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:02:40 2023]
Finished job 260.
14 of 395 steps (4%) done
Select jobs to execute...

[Mon Mar 27 14:02:40 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000170.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000170.ovb, 0-correction/overlap-jobs/000170.stats
    log: 0-correction/overlap-jobs/000170.err
    jobid: 197
    reason: Missing output files: 0-correction/overlap-jobs/000170.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000170
    threads: 8
    resources: tmpdir=/data/tmp, job_id=170, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:03:34 2023]
Finished job 176.
15 of 395 steps (4%) done
Select jobs to execute...

[Mon Mar 27 14:03:35 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000253.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000253.ovb, 0-correction/overlap-jobs/000253.stats
    log: 0-correction/overlap-jobs/000253.err
    jobid: 280
    reason: Missing output files: 0-correction/overlap-jobs/000253.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000253
    threads: 8
    resources: tmpdir=/data/tmp, job_id=253, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:19:54 2023]
Finished job 65.
16 of 395 steps (4%) done
Select jobs to execute...

[Mon Mar 27 14:19:54 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000226.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000226.ovb, 0-correction/overlap-jobs/000226.stats
    log: 0-correction/overlap-jobs/000226.err
    jobid: 253
    reason: Missing output files: 0-correction/overlap-jobs/000226.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000226
    threads: 8
    resources: tmpdir=/data/tmp, job_id=226, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:23:10 2023]
Finished job 233.
17 of 395 steps (4%) done
Select jobs to execute...

[Mon Mar 27 14:23:10 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000197.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000197.ovb, 0-correction/overlap-jobs/000197.stats
    log: 0-correction/overlap-jobs/000197.err
    jobid: 224
    reason: Missing output files: 0-correction/overlap-jobs/000197.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000197
    threads: 8
    resources: tmpdir=/data/tmp, job_id=197, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:24:59 2023]
Finished job 85.
18 of 395 steps (5%) done
Select jobs to execute...

[Mon Mar 27 14:24:59 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000030.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000030.ovb, 0-correction/overlap-jobs/000030.stats
    log: 0-correction/overlap-jobs/000030.err
    jobid: 57
    reason: Missing output files: 0-correction/overlap-jobs/000030.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000030
    threads: 8
    resources: tmpdir=/data/tmp, job_id=30, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:29:36 2023]
Finished job 141.
19 of 395 steps (5%) done
Select jobs to execute...

[Mon Mar 27 14:29:36 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000086.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000086.ovb, 0-correction/overlap-jobs/000086.stats
    log: 0-correction/overlap-jobs/000086.err
    jobid: 113
    reason: Missing output files: 0-correction/overlap-jobs/000086.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000086
    threads: 8
    resources: tmpdir=/data/tmp, job_id=86, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:33:04 2023]
Finished job 280.
20 of 395 steps (5%) done
Select jobs to execute...

[Mon Mar 27 14:33:04 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000142.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000142.ovb, 0-correction/overlap-jobs/000142.stats
    log: 0-correction/overlap-jobs/000142.err
    jobid: 169
    reason: Missing output files: 0-correction/overlap-jobs/000142.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000142
    threads: 8
    resources: tmpdir=/data/tmp, job_id=142, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:34:43 2023]
Finished job 197.
21 of 395 steps (5%) done
Select jobs to execute...

[Mon Mar 27 14:34:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000141.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000141.ovb, 0-correction/overlap-jobs/000141.stats
    log: 0-correction/overlap-jobs/000141.err
    jobid: 168
    reason: Missing output files: 0-correction/overlap-jobs/000141.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000141
    threads: 8
    resources: tmpdir=/data/tmp, job_id=141, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:47:42 2023]
Finished job 253.
22 of 395 steps (6%) done
Select jobs to execute...

[Mon Mar 27 14:47:42 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000198.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000198.ovb, 0-correction/overlap-jobs/000198.stats
    log: 0-correction/overlap-jobs/000198.err
    jobid: 225
    reason: Missing output files: 0-correction/overlap-jobs/000198.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000198
    threads: 8
    resources: tmpdir=/data/tmp, job_id=198, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:54:02 2023]
Finished job 57.
23 of 395 steps (6%) done
Select jobs to execute...

[Mon Mar 27 14:54:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000085.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000085.ovb, 0-correction/overlap-jobs/000085.stats
    log: 0-correction/overlap-jobs/000085.err
    jobid: 112
    reason: Missing output files: 0-correction/overlap-jobs/000085.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000085
    threads: 8
    resources: tmpdir=/data/tmp, job_id=85, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 14:54:29 2023]
Finished job 224.
24 of 395 steps (6%) done
Select jobs to execute...

[Mon Mar 27 14:54:29 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000254.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000254.ovb, 0-correction/overlap-jobs/000254.stats
    log: 0-correction/overlap-jobs/000254.err
    jobid: 281
    reason: Missing output files: 0-correction/overlap-jobs/000254.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000254
    threads: 8
    resources: tmpdir=/data/tmp, job_id=254, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:00:24 2023]
Finished job 113.
25 of 395 steps (6%) done
Select jobs to execute...

[Mon Mar 27 15:00:24 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000208.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000208.ovb, 0-correction/overlap-jobs/000208.stats
    log: 0-correction/overlap-jobs/000208.err
    jobid: 235
    reason: Missing output files: 0-correction/overlap-jobs/000208.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000208
    threads: 8
    resources: tmpdir=/data/tmp, job_id=208, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:04:20 2023]
Finished job 169.
26 of 395 steps (7%) done
Select jobs to execute...

[Mon Mar 27 15:04:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000264.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000264.ovb, 0-correction/overlap-jobs/000264.stats
    log: 0-correction/overlap-jobs/000264.err
    jobid: 291
    reason: Missing output files: 0-correction/overlap-jobs/000264.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000264
    threads: 8
    resources: tmpdir=/data/tmp, job_id=264, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:04:37 2023]
Finished job 168.
27 of 395 steps (7%) done
Select jobs to execute...

[Mon Mar 27 15:04:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000008.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000008.ovb, 0-correction/overlap-jobs/000008.stats
    log: 0-correction/overlap-jobs/000008.err
    jobid: 35
    reason: Missing output files: 0-correction/overlap-jobs/000008.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000008
    threads: 8
    resources: tmpdir=/data/tmp, job_id=8, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:07:14 2023]
Finished job 281.
28 of 395 steps (7%) done
Select jobs to execute...

[Mon Mar 27 15:07:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000068.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000068.ovb, 0-correction/overlap-jobs/000068.stats
    log: 0-correction/overlap-jobs/000068.err
    jobid: 95
    reason: Missing output files: 0-correction/overlap-jobs/000068.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000068
    threads: 8
    resources: tmpdir=/data/tmp, job_id=68, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:17:59 2023]
Finished job 225.
29 of 395 steps (7%) done
Select jobs to execute...

[Mon Mar 27 15:17:59 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000227.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000227.ovb, 0-correction/overlap-jobs/000227.stats
    log: 0-correction/overlap-jobs/000227.err
    jobid: 254
    reason: Missing output files: 0-correction/overlap-jobs/000227.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000227
    threads: 8
    resources: tmpdir=/data/tmp, job_id=227, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:25:11 2023]
Finished job 112.
30 of 395 steps (8%) done
Select jobs to execute...

[Mon Mar 27 15:25:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000031.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000031.ovb, 0-correction/overlap-jobs/000031.stats
    log: 0-correction/overlap-jobs/000031.err
    jobid: 58
    reason: Missing output files: 0-correction/overlap-jobs/000031.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000031
    threads: 8
    resources: tmpdir=/data/tmp, job_id=31, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:26:31 2023]
Finished job 35.
31 of 395 steps (8%) done
Select jobs to execute...

[Mon Mar 27 15:26:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000171.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000171.ovb, 0-correction/overlap-jobs/000171.stats
    log: 0-correction/overlap-jobs/000171.err
    jobid: 198
    reason: Missing output files: 0-correction/overlap-jobs/000171.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000171
    threads: 8
    resources: tmpdir=/data/tmp, job_id=171, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:26:57 2023]
Finished job 95.
32 of 395 steps (8%) done
Select jobs to execute...

[Mon Mar 27 15:26:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000087.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000087.ovb, 0-correction/overlap-jobs/000087.stats
    log: 0-correction/overlap-jobs/000087.err
    jobid: 114
    reason: Missing output files: 0-correction/overlap-jobs/000087.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000087
    threads: 8
    resources: tmpdir=/data/tmp, job_id=87, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:27:50 2023]
Finished job 291.
33 of 395 steps (8%) done
Select jobs to execute...

[Mon Mar 27 15:27:50 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000115.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000115.ovb, 0-correction/overlap-jobs/000115.stats
    log: 0-correction/overlap-jobs/000115.err
    jobid: 142
    reason: Missing output files: 0-correction/overlap-jobs/000115.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000115
    threads: 8
    resources: tmpdir=/data/tmp, job_id=115, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:29:30 2023]
Finished job 235.
34 of 395 steps (9%) done
Select jobs to execute...

[Mon Mar 27 15:29:30 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000143.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000143.ovb, 0-correction/overlap-jobs/000143.stats
    log: 0-correction/overlap-jobs/000143.err
    jobid: 170
    reason: Missing output files: 0-correction/overlap-jobs/000143.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000143
    threads: 8
    resources: tmpdir=/data/tmp, job_id=143, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:37:45 2023]
Finished job 198.
35 of 395 steps (9%) done
Select jobs to execute...

[Mon Mar 27 15:37:46 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000199.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000199.ovb, 0-correction/overlap-jobs/000199.stats
    log: 0-correction/overlap-jobs/000199.err
    jobid: 226
    reason: Missing output files: 0-correction/overlap-jobs/000199.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000199
    threads: 8
    resources: tmpdir=/data/tmp, job_id=199, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:44:42 2023]
Finished job 58.
36 of 395 steps (9%) done
Select jobs to execute...

[Mon Mar 27 15:44:42 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000255.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000255.ovb, 0-correction/overlap-jobs/000255.stats
    log: 0-correction/overlap-jobs/000255.err
    jobid: 282
    reason: Missing output files: 0-correction/overlap-jobs/000255.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000255
    threads: 8
    resources: tmpdir=/data/tmp, job_id=255, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:49:54 2023]
Finished job 254.
37 of 395 steps (9%) done
Select jobs to execute...

[Mon Mar 27 15:49:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000059.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000059.ovb, 0-correction/overlap-jobs/000059.stats
    log: 0-correction/overlap-jobs/000059.err
    jobid: 86
    reason: Missing output files: 0-correction/overlap-jobs/000059.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000059
    threads: 8
    resources: tmpdir=/data/tmp, job_id=59, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:54:37 2023]
Finished job 114.
38 of 395 steps (10%) done
Select jobs to execute...

[Mon Mar 27 15:54:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000003.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000003.ovb, 0-correction/overlap-jobs/000003.stats
    log: 0-correction/overlap-jobs/000003.err
    jobid: 30
    reason: Missing output files: 0-correction/overlap-jobs/000003.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000003
    threads: 8
    resources: tmpdir=/data/tmp, job_id=3, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 15:55:56 2023]
Finished job 142.
39 of 395 steps (10%) done
Select jobs to execute...

[Mon Mar 27 15:55:56 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000029.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000029.ovb, 0-correction/overlap-jobs/000029.stats
    log: 0-correction/overlap-jobs/000029.err
    jobid: 56
    reason: Missing output files: 0-correction/overlap-jobs/000029.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000029
    threads: 8
    resources: tmpdir=/data/tmp, job_id=29, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:01:48 2023]
Finished job 170.
40 of 395 steps (10%) done
Select jobs to execute...

[Mon Mar 27 16:01:48 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000060.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000060.ovb, 0-correction/overlap-jobs/000060.stats
    log: 0-correction/overlap-jobs/000060.err
    jobid: 87
    reason: Missing output files: 0-correction/overlap-jobs/000060.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000060
    threads: 8
    resources: tmpdir=/data/tmp, job_id=60, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:05:01 2023]
Finished job 86.
41 of 395 steps (10%) done
Select jobs to execute...

[Mon Mar 27 16:05:01 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000225.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000225.ovb, 0-correction/overlap-jobs/000225.stats
    log: 0-correction/overlap-jobs/000225.err
    jobid: 252
    reason: Missing output files: 0-correction/overlap-jobs/000225.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000225
    threads: 8
    resources: tmpdir=/data/tmp, job_id=225, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:06:34 2023]
Finished job 30.
42 of 395 steps (11%) done
Select jobs to execute...

[Mon Mar 27 16:06:35 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000116.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000116.ovb, 0-correction/overlap-jobs/000116.stats
    log: 0-correction/overlap-jobs/000116.err
    jobid: 143
    reason: Missing output files: 0-correction/overlap-jobs/000116.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000116
    threads: 8
    resources: tmpdir=/data/tmp, job_id=116, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:08:23 2023]
Finished job 226.
43 of 395 steps (11%) done
Select jobs to execute...

[Mon Mar 27 16:08:23 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000172.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000172.ovb, 0-correction/overlap-jobs/000172.stats
    log: 0-correction/overlap-jobs/000172.err
    jobid: 199
    reason: Missing output files: 0-correction/overlap-jobs/000172.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000172
    threads: 8
    resources: tmpdir=/data/tmp, job_id=172, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:12:22 2023]
Finished job 56.
44 of 395 steps (11%) done
Select jobs to execute...

[Mon Mar 27 16:12:22 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000228.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000228.ovb, 0-correction/overlap-jobs/000228.stats
    log: 0-correction/overlap-jobs/000228.err
    jobid: 255
    reason: Missing output files: 0-correction/overlap-jobs/000228.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000228
    threads: 8
    resources: tmpdir=/data/tmp, job_id=228, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:17:50 2023]
Finished job 282.
45 of 395 steps (11%) done
Select jobs to execute...

[Mon Mar 27 16:17:50 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000169.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000169.ovb, 0-correction/overlap-jobs/000169.stats
    log: 0-correction/overlap-jobs/000169.err
    jobid: 196
    reason: Missing output files: 0-correction/overlap-jobs/000169.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000169
    threads: 8
    resources: tmpdir=/data/tmp, job_id=169, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:20:34 2023]
Finished job 143.
46 of 395 steps (12%) done
Select jobs to execute...

[Mon Mar 27 16:20:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000032.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000032.ovb, 0-correction/overlap-jobs/000032.stats
    log: 0-correction/overlap-jobs/000032.err
    jobid: 59
    reason: Missing output files: 0-correction/overlap-jobs/000032.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000032
    threads: 8
    resources: tmpdir=/data/tmp, job_id=32, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:29:41 2023]
Finished job 87.
47 of 395 steps (12%) done
Select jobs to execute...

[Mon Mar 27 16:29:41 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000113.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000113.ovb, 0-correction/overlap-jobs/000113.stats
    log: 0-correction/overlap-jobs/000113.err
    jobid: 140
    reason: Missing output files: 0-correction/overlap-jobs/000113.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000113
    threads: 8
    resources: tmpdir=/data/tmp, job_id=113, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:33:50 2023]
Finished job 252.
48 of 395 steps (12%) done
Select jobs to execute...

[Mon Mar 27 16:33:50 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000088.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000088.ovb, 0-correction/overlap-jobs/000088.stats
    log: 0-correction/overlap-jobs/000088.err
    jobid: 115
    reason: Missing output files: 0-correction/overlap-jobs/000088.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000088
    threads: 8
    resources: tmpdir=/data/tmp, job_id=88, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:36:43 2023]
Finished job 199.
49 of 395 steps (12%) done
Select jobs to execute...

[Mon Mar 27 16:36:44 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000057.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000057.ovb, 0-correction/overlap-jobs/000057.stats
    log: 0-correction/overlap-jobs/000057.err
    jobid: 84
    reason: Missing output files: 0-correction/overlap-jobs/000057.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000057
    threads: 8
    resources: tmpdir=/data/tmp, job_id=57, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:44:51 2023]
Finished job 255.
50 of 395 steps (13%) done
Select jobs to execute...

[Mon Mar 27 16:44:52 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000144.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000144.ovb, 0-correction/overlap-jobs/000144.stats
    log: 0-correction/overlap-jobs/000144.err
    jobid: 171
    reason: Missing output files: 0-correction/overlap-jobs/000144.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000144
    threads: 8
    resources: tmpdir=/data/tmp, job_id=144, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:49:19 2023]
Finished job 196.
51 of 395 steps (13%) done
Select jobs to execute...

[Mon Mar 27 16:49:19 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000200.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000200.ovb, 0-correction/overlap-jobs/000200.stats
    log: 0-correction/overlap-jobs/000200.err
    jobid: 227
    reason: Missing output files: 0-correction/overlap-jobs/000200.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000200
    threads: 8
    resources: tmpdir=/data/tmp, job_id=200, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 16:52:30 2023]
Finished job 59.
52 of 395 steps (13%) done
Select jobs to execute...

[Mon Mar 27 16:52:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000256.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000256.ovb, 0-correction/overlap-jobs/000256.stats
    log: 0-correction/overlap-jobs/000256.err
    jobid: 283
    reason: Missing output files: 0-correction/overlap-jobs/000256.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000256
    threads: 8
    resources: tmpdir=/data/tmp, job_id=256, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:02:52 2023]
Finished job 140.
53 of 395 steps (13%) done
Select jobs to execute...

[Mon Mar 27 17:02:52 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000252.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000252.ovb, 0-correction/overlap-jobs/000252.stats
    log: 0-correction/overlap-jobs/000252.err
    jobid: 279
    reason: Missing output files: 0-correction/overlap-jobs/000252.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000252
    threads: 8
    resources: tmpdir=/data/tmp, job_id=252, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:05:18 2023]
Finished job 115.
54 of 395 steps (14%) done
Select jobs to execute...

[Mon Mar 27 17:05:18 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000004.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000004.ovb, 0-correction/overlap-jobs/000004.stats
    log: 0-correction/overlap-jobs/000004.err
    jobid: 31
    reason: Missing output files: 0-correction/overlap-jobs/000004.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000004
    threads: 8
    resources: tmpdir=/data/tmp, job_id=4, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:05:26 2023]
Finished job 84.
55 of 395 steps (14%) done
Select jobs to execute...

[Mon Mar 27 17:05:26 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000152.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000152.ovb, 0-correction/overlap-jobs/000152.stats
    log: 0-correction/overlap-jobs/000152.err
    jobid: 179
    reason: Missing output files: 0-correction/overlap-jobs/000152.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000152
    threads: 8
    resources: tmpdir=/data/tmp, job_id=152, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:09:28 2023]
Finished job 171.
56 of 395 steps (14%) done
Select jobs to execute...

[Mon Mar 27 17:09:28 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000124.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000124.ovb, 0-correction/overlap-jobs/000124.stats
    log: 0-correction/overlap-jobs/000124.err
    jobid: 151
    reason: Missing output files: 0-correction/overlap-jobs/000124.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000124
    threads: 8
    resources: tmpdir=/data/tmp, job_id=124, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:18:34 2023]
Finished job 31.
57 of 395 steps (14%) done
Select jobs to execute...

[Mon Mar 27 17:18:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000117.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000117.ovb, 0-correction/overlap-jobs/000117.stats
    log: 0-correction/overlap-jobs/000117.err
    jobid: 144
    reason: Missing output files: 0-correction/overlap-jobs/000117.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000117
    threads: 8
    resources: tmpdir=/data/tmp, job_id=117, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:21:02 2023]
Finished job 227.
58 of 395 steps (15%) done
Select jobs to execute...

[Mon Mar 27 17:21:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000173.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000173.ovb, 0-correction/overlap-jobs/000173.stats
    log: 0-correction/overlap-jobs/000173.err
    jobid: 200
    reason: Missing output files: 0-correction/overlap-jobs/000173.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000173
    threads: 8
    resources: tmpdir=/data/tmp, job_id=173, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:25:18 2023]
Finished job 283.
59 of 395 steps (15%) done
Select jobs to execute...

[Mon Mar 27 17:25:18 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000229.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000229.ovb, 0-correction/overlap-jobs/000229.stats
    log: 0-correction/overlap-jobs/000229.err
    jobid: 256
    reason: Missing output files: 0-correction/overlap-jobs/000229.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000229
    threads: 8
    resources: tmpdir=/data/tmp, job_id=229, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:28:11 2023]
Finished job 151.
60 of 395 steps (15%) done
Select jobs to execute...

[Mon Mar 27 17:28:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000033.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000033.ovb, 0-correction/overlap-jobs/000033.stats
    log: 0-correction/overlap-jobs/000033.err
    jobid: 60
    reason: Missing output files: 0-correction/overlap-jobs/000033.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000033
    threads: 8
    resources: tmpdir=/data/tmp, job_id=33, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:31:56 2023]
Finished job 179.
61 of 395 steps (15%) done
Select jobs to execute...

[Mon Mar 27 17:31:56 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000061.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000061.ovb, 0-correction/overlap-jobs/000061.stats
    log: 0-correction/overlap-jobs/000061.err
    jobid: 88
    reason: Missing output files: 0-correction/overlap-jobs/000061.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000061
    threads: 8
    resources: tmpdir=/data/tmp, job_id=61, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:33:16 2023]
Finished job 279.
62 of 395 steps (16%) done
Select jobs to execute...

[Mon Mar 27 17:33:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000089.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000089.ovb, 0-correction/overlap-jobs/000089.stats
    log: 0-correction/overlap-jobs/000089.err
    jobid: 116
    reason: Missing output files: 0-correction/overlap-jobs/000089.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000089
    threads: 8
    resources: tmpdir=/data/tmp, job_id=89, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:47:15 2023]
Finished job 144.
63 of 395 steps (16%) done
Select jobs to execute...

[Mon Mar 27 17:47:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000196.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000196.ovb, 0-correction/overlap-jobs/000196.stats
    log: 0-correction/overlap-jobs/000196.err
    jobid: 223
    reason: Missing output files: 0-correction/overlap-jobs/000196.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000196
    threads: 8
    resources: tmpdir=/data/tmp, job_id=196, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:49:44 2023]
Finished job 60.
64 of 395 steps (16%) done
Select jobs to execute...

[Mon Mar 27 17:49:44 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000145.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000145.ovb, 0-correction/overlap-jobs/000145.stats
    log: 0-correction/overlap-jobs/000145.err
    jobid: 172
    reason: Missing output files: 0-correction/overlap-jobs/000145.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000145
    threads: 8
    resources: tmpdir=/data/tmp, job_id=145, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:50:58 2023]
Finished job 200.
65 of 395 steps (16%) done
Select jobs to execute...

[Mon Mar 27 17:50:58 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000140.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000140.ovb, 0-correction/overlap-jobs/000140.stats
    log: 0-correction/overlap-jobs/000140.err
    jobid: 167
    reason: Missing output files: 0-correction/overlap-jobs/000140.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000140
    threads: 8
    resources: tmpdir=/data/tmp, job_id=140, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 17:55:34 2023]
Finished job 256.
66 of 395 steps (17%) done
Select jobs to execute...

[Mon Mar 27 17:55:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000201.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000201.ovb, 0-correction/overlap-jobs/000201.stats
    log: 0-correction/overlap-jobs/000201.err
    jobid: 228
    reason: Missing output files: 0-correction/overlap-jobs/000201.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000201
    threads: 8
    resources: tmpdir=/data/tmp, job_id=201, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:00:22 2023]
Finished job 116.
67 of 395 steps (17%) done
Select jobs to execute...

[Mon Mar 27 18:00:22 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000257.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000257.ovb, 0-correction/overlap-jobs/000257.stats
    log: 0-correction/overlap-jobs/000257.err
    jobid: 284
    reason: Missing output files: 0-correction/overlap-jobs/000257.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000257
    threads: 8
    resources: tmpdir=/data/tmp, job_id=257, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:03:51 2023]
Finished job 88.
68 of 395 steps (17%) done
Select jobs to execute...

[Mon Mar 27 18:03:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000011.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000011.ovb, 0-correction/overlap-jobs/000011.stats
    log: 0-correction/overlap-jobs/000011.err
    jobid: 38
    reason: Missing output files: 0-correction/overlap-jobs/000011.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000011
    threads: 8
    resources: tmpdir=/data/tmp, job_id=11, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:04:58 2023]
Finished job 223.
69 of 395 steps (17%) done
Select jobs to execute...

[Mon Mar 27 18:04:58 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000084.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000084.ovb, 0-correction/overlap-jobs/000084.stats
    log: 0-correction/overlap-jobs/000084.err
    jobid: 111
    reason: Missing output files: 0-correction/overlap-jobs/000084.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000084
    threads: 8
    resources: tmpdir=/data/tmp, job_id=84, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:13:21 2023]
Finished job 167.
70 of 395 steps (18%) done
Select jobs to execute...

[Mon Mar 27 18:13:22 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000062.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000062.ovb, 0-correction/overlap-jobs/000062.stats
    log: 0-correction/overlap-jobs/000062.err
    jobid: 89
    reason: Missing output files: 0-correction/overlap-jobs/000062.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000062
    threads: 8
    resources: tmpdir=/data/tmp, job_id=62, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:14:27 2023]
Finished job 228.
71 of 395 steps (18%) done
Select jobs to execute...

[Mon Mar 27 18:14:27 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000028.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000028.ovb, 0-correction/overlap-jobs/000028.stats
    log: 0-correction/overlap-jobs/000028.err
    jobid: 55
    reason: Missing output files: 0-correction/overlap-jobs/000028.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000028
    threads: 8
    resources: tmpdir=/data/tmp, job_id=28, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:21:37 2023]
Finished job 172.
72 of 395 steps (18%) done
Select jobs to execute...

[Mon Mar 27 18:21:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000118.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000118.ovb, 0-correction/overlap-jobs/000118.stats
    log: 0-correction/overlap-jobs/000118.err
    jobid: 145
    reason: Missing output files: 0-correction/overlap-jobs/000118.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000118
    threads: 8
    resources: tmpdir=/data/tmp, job_id=118, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:26:55 2023]
Finished job 89.
73 of 395 steps (18%) done
Select jobs to execute...

[Mon Mar 27 18:26:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000224.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000224.ovb, 0-correction/overlap-jobs/000224.stats
    log: 0-correction/overlap-jobs/000224.err
    jobid: 251
    reason: Missing output files: 0-correction/overlap-jobs/000224.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000224
    threads: 8
    resources: tmpdir=/data/tmp, job_id=224, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:28:44 2023]
Finished job 38.
74 of 395 steps (19%) done
Select jobs to execute...

[Mon Mar 27 18:28:44 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000174.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000174.ovb, 0-correction/overlap-jobs/000174.stats
    log: 0-correction/overlap-jobs/000174.err
    jobid: 201
    reason: Missing output files: 0-correction/overlap-jobs/000174.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000174
    threads: 8
    resources: tmpdir=/data/tmp, job_id=174, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:32:08 2023]
Finished job 284.
75 of 395 steps (19%) done
Select jobs to execute...

[Mon Mar 27 18:32:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000230.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000230.ovb, 0-correction/overlap-jobs/000230.stats
    log: 0-correction/overlap-jobs/000230.err
    jobid: 257
    reason: Missing output files: 0-correction/overlap-jobs/000230.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000230
    threads: 8
    resources: tmpdir=/data/tmp, job_id=230, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:34:24 2023]
Finished job 111.
76 of 395 steps (19%) done
Select jobs to execute...

[Mon Mar 27 18:34:24 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000034.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000034.ovb, 0-correction/overlap-jobs/000034.stats
    log: 0-correction/overlap-jobs/000034.err
    jobid: 61
    reason: Missing output files: 0-correction/overlap-jobs/000034.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000034
    threads: 8
    resources: tmpdir=/data/tmp, job_id=34, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:47:01 2023]
Finished job 55.
77 of 395 steps (19%) done
Select jobs to execute...

[Mon Mar 27 18:47:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000168.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000168.ovb, 0-correction/overlap-jobs/000168.stats
    log: 0-correction/overlap-jobs/000168.err
    jobid: 195
    reason: Missing output files: 0-correction/overlap-jobs/000168.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000168
    threads: 8
    resources: tmpdir=/data/tmp, job_id=168, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:56:10 2023]
Finished job 251.
78 of 395 steps (20%) done
Select jobs to execute...

[Mon Mar 27 18:56:10 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000090.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000090.ovb, 0-correction/overlap-jobs/000090.stats
    log: 0-correction/overlap-jobs/000090.err
    jobid: 117
    reason: Missing output files: 0-correction/overlap-jobs/000090.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000090
    threads: 8
    resources: tmpdir=/data/tmp, job_id=90, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:56:10 2023]
Finished job 145.
79 of 395 steps (20%) done
Select jobs to execute...

[Mon Mar 27 18:56:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000150.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000150.ovb, 0-correction/overlap-jobs/000150.stats
    log: 0-correction/overlap-jobs/000150.err
    jobid: 177
    reason: Missing output files: 0-correction/overlap-jobs/000150.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000150
    threads: 8
    resources: tmpdir=/data/tmp, job_id=150, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 18:58:18 2023]
Finished job 201.
80 of 395 steps (20%) done
Select jobs to execute...

[Mon Mar 27 18:58:19 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000146.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000146.ovb, 0-correction/overlap-jobs/000146.stats
    log: 0-correction/overlap-jobs/000146.err
    jobid: 173
    reason: Missing output files: 0-correction/overlap-jobs/000146.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000146
    threads: 8
    resources: tmpdir=/data/tmp, job_id=146, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:04:24 2023]
Finished job 257.
81 of 395 steps (21%) done
Select jobs to execute...

[Mon Mar 27 19:04:24 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000112.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000112.ovb, 0-correction/overlap-jobs/000112.stats
    log: 0-correction/overlap-jobs/000112.err
    jobid: 139
    reason: Missing output files: 0-correction/overlap-jobs/000112.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000112
    threads: 8
    resources: tmpdir=/data/tmp, job_id=112, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:06:33 2023]
Finished job 61.
82 of 395 steps (21%) done
Select jobs to execute...

[Mon Mar 27 19:06:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000202.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000202.ovb, 0-correction/overlap-jobs/000202.stats
    log: 0-correction/overlap-jobs/000202.err
    jobid: 229
    reason: Missing output files: 0-correction/overlap-jobs/000202.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000202
    threads: 8
    resources: tmpdir=/data/tmp, job_id=202, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:17:25 2023]
Finished job 195.
83 of 395 steps (21%) done
Select jobs to execute...

[Mon Mar 27 19:17:25 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000258.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000258.ovb, 0-correction/overlap-jobs/000258.stats
    log: 0-correction/overlap-jobs/000258.err
    jobid: 285
    reason: Missing output files: 0-correction/overlap-jobs/000258.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000258
    threads: 8
    resources: tmpdir=/data/tmp, job_id=258, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:17:57 2023]
Finished job 139.
84 of 395 steps (21%) done
Select jobs to execute...

[Mon Mar 27 19:17:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000010.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000010.ovb, 0-correction/overlap-jobs/000010.stats
    log: 0-correction/overlap-jobs/000010.err
    jobid: 37
    reason: Missing output files: 0-correction/overlap-jobs/000010.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000010
    threads: 8
    resources: tmpdir=/data/tmp, job_id=10, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:23:44 2023]
Finished job 177.
85 of 395 steps (22%) done
Select jobs to execute...

[Mon Mar 27 19:23:44 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000096.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000096.ovb, 0-correction/overlap-jobs/000096.stats
    log: 0-correction/overlap-jobs/000096.err
    jobid: 123
    reason: Missing output files: 0-correction/overlap-jobs/000096.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000096
    threads: 8
    resources: tmpdir=/data/tmp, job_id=96, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:25:47 2023]
Finished job 117.
86 of 395 steps (22%) done
Select jobs to execute...

[Mon Mar 27 19:25:48 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000180.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000180.ovb, 0-correction/overlap-jobs/000180.stats
    log: 0-correction/overlap-jobs/000180.err
    jobid: 207
    reason: Missing output files: 0-correction/overlap-jobs/000180.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000180
    threads: 8
    resources: tmpdir=/data/tmp, job_id=180, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:31:07 2023]
Finished job 123.
87 of 395 steps (22%) done
Select jobs to execute...

[Mon Mar 27 19:31:07 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000119.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000119.ovb, 0-correction/overlap-jobs/000119.stats
    log: 0-correction/overlap-jobs/000119.err
    jobid: 146
    reason: Missing output files: 0-correction/overlap-jobs/000119.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000119
    threads: 8
    resources: tmpdir=/data/tmp, job_id=119, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:33:20 2023]
Finished job 173.
88 of 395 steps (22%) done
Select jobs to execute...

[Mon Mar 27 19:33:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000175.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000175.ovb, 0-correction/overlap-jobs/000175.stats
    log: 0-correction/overlap-jobs/000175.err
    jobid: 202
    reason: Missing output files: 0-correction/overlap-jobs/000175.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000175
    threads: 8
    resources: tmpdir=/data/tmp, job_id=175, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:36:25 2023]
Finished job 229.
89 of 395 steps (23%) done
Select jobs to execute...

[Mon Mar 27 19:36:25 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000063.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000063.ovb, 0-correction/overlap-jobs/000063.stats
    log: 0-correction/overlap-jobs/000063.err
    jobid: 90
    reason: Missing output files: 0-correction/overlap-jobs/000063.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000063
    threads: 8
    resources: tmpdir=/data/tmp, job_id=63, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:38:34 2023]
Finished job 37.
90 of 395 steps (23%) done
Select jobs to execute...

[Mon Mar 27 19:38:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000231.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000231.ovb, 0-correction/overlap-jobs/000231.stats
    log: 0-correction/overlap-jobs/000231.err
    jobid: 258
    reason: Missing output files: 0-correction/overlap-jobs/000231.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000231
    threads: 8
    resources: tmpdir=/data/tmp, job_id=231, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:46:31 2023]
Finished job 285.
91 of 395 steps (23%) done
Select jobs to execute...

[Mon Mar 27 19:46:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000035.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000035.ovb, 0-correction/overlap-jobs/000035.stats
    log: 0-correction/overlap-jobs/000035.err
    jobid: 62
    reason: Missing output files: 0-correction/overlap-jobs/000035.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000035
    threads: 8
    resources: tmpdir=/data/tmp, job_id=35, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 19:57:07 2023]
Finished job 207.
92 of 395 steps (23%) done
Select jobs to execute...

[Mon Mar 27 19:57:07 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000091.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000091.ovb, 0-correction/overlap-jobs/000091.stats
    log: 0-correction/overlap-jobs/000091.err
    jobid: 118
    reason: Missing output files: 0-correction/overlap-jobs/000091.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000091
    threads: 8
    resources: tmpdir=/data/tmp, job_id=91, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:02:08 2023]
Finished job 202.
93 of 395 steps (24%) done
Select jobs to execute...

[Mon Mar 27 20:02:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000094.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000094.ovb, 0-correction/overlap-jobs/000094.stats
    log: 0-correction/overlap-jobs/000094.err
    jobid: 121
    reason: Missing output files: 0-correction/overlap-jobs/000094.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000094
    threads: 8
    resources: tmpdir=/data/tmp, job_id=94, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:03:25 2023]
Finished job 146.
94 of 395 steps (24%) done
Select jobs to execute...

[Mon Mar 27 20:03:25 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000147.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000147.ovb, 0-correction/overlap-jobs/000147.stats
    log: 0-correction/overlap-jobs/000147.err
    jobid: 174
    reason: Missing output files: 0-correction/overlap-jobs/000147.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000147
    threads: 8
    resources: tmpdir=/data/tmp, job_id=147, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:06:52 2023]
Finished job 90.
95 of 395 steps (24%) done
Select jobs to execute...

[Mon Mar 27 20:06:52 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000056.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000056.ovb, 0-correction/overlap-jobs/000056.stats
    log: 0-correction/overlap-jobs/000056.err
    jobid: 83
    reason: Missing output files: 0-correction/overlap-jobs/000056.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000056
    threads: 8
    resources: tmpdir=/data/tmp, job_id=56, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:09:38 2023]
Finished job 62.
96 of 395 steps (24%) done
Select jobs to execute...

[Mon Mar 27 20:09:39 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000203.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000203.ovb, 0-correction/overlap-jobs/000203.stats
    log: 0-correction/overlap-jobs/000203.err
    jobid: 230
    reason: Missing output files: 0-correction/overlap-jobs/000203.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000203
    threads: 8
    resources: tmpdir=/data/tmp, job_id=203, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:11:07 2023]
Finished job 258.
97 of 395 steps (25%) done
Select jobs to execute...

[Mon Mar 27 20:11:07 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000001.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000001.ovb, 0-correction/overlap-jobs/000001.stats
    log: 0-correction/overlap-jobs/000001.err
    jobid: 26
    reason: Missing output files: 0-correction/overlap-jobs/000001.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000001
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:17:49 2023]
Finished job 83.
98 of 395 steps (25%) done
Select jobs to execute...

[Mon Mar 27 20:17:49 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000259.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000259.ovb, 0-correction/overlap-jobs/000259.stats
    log: 0-correction/overlap-jobs/000259.err
    jobid: 286
    reason: Missing output files: 0-correction/overlap-jobs/000259.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000259
    threads: 8
    resources: tmpdir=/data/tmp, job_id=259, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:19:28 2023]
Finished job 26.
99 of 395 steps (25%) done
Select jobs to execute...

[Mon Mar 27 20:19:28 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000005.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000005.ovb, 0-correction/overlap-jobs/000005.stats
    log: 0-correction/overlap-jobs/000005.err
    jobid: 32
    reason: Missing output files: 0-correction/overlap-jobs/000005.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000005
    threads: 8
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:27:16 2023]
Finished job 118.
100 of 395 steps (25%) done
Select jobs to execute...

[Mon Mar 27 20:27:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000064.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000064.ovb, 0-correction/overlap-jobs/000064.stats
    log: 0-correction/overlap-jobs/000064.err
    jobid: 91
    reason: Missing output files: 0-correction/overlap-jobs/000064.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000064
    threads: 8
    resources: tmpdir=/data/tmp, job_id=64, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:30:51 2023]
Finished job 121.
101 of 395 steps (26%) done
Select jobs to execute...

[Mon Mar 27 20:30:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000251.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000251.ovb, 0-correction/overlap-jobs/000251.stats
    log: 0-correction/overlap-jobs/000251.err
    jobid: 278
    reason: Missing output files: 0-correction/overlap-jobs/000251.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000251
    threads: 8
    resources: tmpdir=/data/tmp, job_id=251, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:34:15 2023]
Finished job 174.
102 of 395 steps (26%) done
Select jobs to execute...

[Mon Mar 27 20:34:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000120.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000120.ovb, 0-correction/overlap-jobs/000120.stats
    log: 0-correction/overlap-jobs/000120.err
    jobid: 147
    reason: Missing output files: 0-correction/overlap-jobs/000120.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000120
    threads: 8
    resources: tmpdir=/data/tmp, job_id=120, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:35:14 2023]
Finished job 32.
103 of 395 steps (26%) done
Select jobs to execute...

[Mon Mar 27 20:35:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000195.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000195.ovb, 0-correction/overlap-jobs/000195.stats
    log: 0-correction/overlap-jobs/000195.err
    jobid: 222
    reason: Missing output files: 0-correction/overlap-jobs/000195.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000195
    threads: 8
    resources: tmpdir=/data/tmp, job_id=195, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:41:56 2023]
Finished job 230.
104 of 395 steps (26%) done
Select jobs to execute...

[Mon Mar 27 20:41:56 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000176.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000176.ovb, 0-correction/overlap-jobs/000176.stats
    log: 0-correction/overlap-jobs/000176.err
    jobid: 203
    reason: Missing output files: 0-correction/overlap-jobs/000176.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000176
    threads: 8
    resources: tmpdir=/data/tmp, job_id=176, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:49:01 2023]
Finished job 286.
105 of 395 steps (27%) done
Select jobs to execute...

[Mon Mar 27 20:49:01 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000139.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000139.ovb, 0-correction/overlap-jobs/000139.stats
    log: 0-correction/overlap-jobs/000139.err
    jobid: 166
    reason: Missing output files: 0-correction/overlap-jobs/000139.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000139
    threads: 8
    resources: tmpdir=/data/tmp, job_id=139, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:50:03 2023]
Finished job 147.
106 of 395 steps (27%) done
Select jobs to execute...

[Mon Mar 27 20:50:03 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000232.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000232.ovb, 0-correction/overlap-jobs/000232.stats
    log: 0-correction/overlap-jobs/000232.err
    jobid: 259
    reason: Missing output files: 0-correction/overlap-jobs/000232.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000232
    threads: 8
    resources: tmpdir=/data/tmp, job_id=232, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:55:26 2023]
Finished job 203.
107 of 395 steps (27%) done
Select jobs to execute...

[Mon Mar 27 20:55:26 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000036.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000036.ovb, 0-correction/overlap-jobs/000036.stats
    log: 0-correction/overlap-jobs/000036.err
    jobid: 63
    reason: Missing output files: 0-correction/overlap-jobs/000036.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000036
    threads: 8
    resources: tmpdir=/data/tmp, job_id=36, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 20:58:38 2023]
Finished job 91.
108 of 395 steps (27%) done
Select jobs to execute...

[Mon Mar 27 20:58:38 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000092.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000092.ovb, 0-correction/overlap-jobs/000092.stats
    log: 0-correction/overlap-jobs/000092.err
    jobid: 119
    reason: Missing output files: 0-correction/overlap-jobs/000092.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000092
    threads: 8
    resources: tmpdir=/data/tmp, job_id=92, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:01:42 2023]
Finished job 278.
109 of 395 steps (28%) done
Select jobs to execute...

[Mon Mar 27 21:01:42 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000083.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000083.ovb, 0-correction/overlap-jobs/000083.stats
    log: 0-correction/overlap-jobs/000083.err
    jobid: 110
    reason: Missing output files: 0-correction/overlap-jobs/000083.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000083
    threads: 8
    resources: tmpdir=/data/tmp, job_id=83, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:03:25 2023]
Finished job 222.
110 of 395 steps (28%) done
Select jobs to execute...

[Mon Mar 27 21:03:25 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000148.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000148.ovb, 0-correction/overlap-jobs/000148.stats
    log: 0-correction/overlap-jobs/000148.err
    jobid: 175
    reason: Missing output files: 0-correction/overlap-jobs/000148.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000148
    threads: 8
    resources: tmpdir=/data/tmp, job_id=148, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:20:12 2023]
Finished job 166.
111 of 395 steps (28%) done
Select jobs to execute...

[Mon Mar 27 21:20:12 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000027.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000027.ovb, 0-correction/overlap-jobs/000027.stats
    log: 0-correction/overlap-jobs/000027.err
    jobid: 54
    reason: Missing output files: 0-correction/overlap-jobs/000027.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000027
    threads: 8
    resources: tmpdir=/data/tmp, job_id=27, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:21:35 2023]
Finished job 259.
112 of 395 steps (28%) done
Select jobs to execute...

[Mon Mar 27 21:21:35 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000204.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000204.ovb, 0-correction/overlap-jobs/000204.stats
    log: 0-correction/overlap-jobs/000204.err
    jobid: 231
    reason: Missing output files: 0-correction/overlap-jobs/000204.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000204
    threads: 8
    resources: tmpdir=/data/tmp, job_id=204, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:25:08 2023]
Finished job 63.
113 of 395 steps (29%) done
Select jobs to execute...

[Mon Mar 27 21:25:09 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000040.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000040.ovb, 0-correction/overlap-jobs/000040.stats
    log: 0-correction/overlap-jobs/000040.err
    jobid: 67
    reason: Missing output files: 0-correction/overlap-jobs/000040.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000040
    threads: 8
    resources: tmpdir=/data/tmp, job_id=40, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:27:46 2023]
Finished job 119.
114 of 395 steps (29%) done
Select jobs to execute...

[Mon Mar 27 21:27:46 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000236.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000236.ovb, 0-correction/overlap-jobs/000236.stats
    log: 0-correction/overlap-jobs/000236.err
    jobid: 263
    reason: Missing output files: 0-correction/overlap-jobs/000236.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000236
    threads: 8
    resources: tmpdir=/data/tmp, job_id=236, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:28:28 2023]
Finished job 110.
115 of 395 steps (29%) done
Select jobs to execute...

[Mon Mar 27 21:28:28 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000041.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000041.ovb, 0-correction/overlap-jobs/000041.stats
    log: 0-correction/overlap-jobs/000041.err
    jobid: 68
    reason: Missing output files: 0-correction/overlap-jobs/000041.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000041
    threads: 8
    resources: tmpdir=/data/tmp, job_id=41, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:30:55 2023]
Finished job 175.
116 of 395 steps (29%) done
Select jobs to execute...

[Mon Mar 27 21:30:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000153.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000153.ovb, 0-correction/overlap-jobs/000153.stats
    log: 0-correction/overlap-jobs/000153.err
    jobid: 180
    reason: Missing output files: 0-correction/overlap-jobs/000153.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000153
    threads: 8
    resources: tmpdir=/data/tmp, job_id=153, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:37:14 2023]
Finished job 54.
117 of 395 steps (30%) done
Select jobs to execute...

[Mon Mar 27 21:37:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000177.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000177.ovb, 0-correction/overlap-jobs/000177.stats
    log: 0-correction/overlap-jobs/000177.err
    jobid: 204
    reason: Missing output files: 0-correction/overlap-jobs/000177.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000177
    threads: 8
    resources: tmpdir=/data/tmp, job_id=177, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:51:53 2023]
Finished job 231.
118 of 395 steps (30%) done
Select jobs to execute...

[Mon Mar 27 21:51:53 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000205.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000205.ovb, 0-correction/overlap-jobs/000205.stats
    log: 0-correction/overlap-jobs/000205.err
    jobid: 232
    reason: Missing output files: 0-correction/overlap-jobs/000205.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000205
    threads: 8
    resources: tmpdir=/data/tmp, job_id=205, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:54:10 2023]
Finished job 67.
119 of 395 steps (30%) done
Select jobs to execute...

[Mon Mar 27 21:54:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000121.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000121.ovb, 0-correction/overlap-jobs/000121.stats
    log: 0-correction/overlap-jobs/000121.err
    jobid: 148
    reason: Missing output files: 0-correction/overlap-jobs/000121.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000121
    threads: 8
    resources: tmpdir=/data/tmp, job_id=121, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:55:49 2023]
Finished job 68.
120 of 395 steps (30%) done
Select jobs to execute...

[Mon Mar 27 21:55:49 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000261.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000261.ovb, 0-correction/overlap-jobs/000261.stats
    log: 0-correction/overlap-jobs/000261.err
    jobid: 288
    reason: Missing output files: 0-correction/overlap-jobs/000261.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000261
    threads: 8
    resources: tmpdir=/data/tmp, job_id=261, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 21:58:09 2023]
Finished job 263.
121 of 395 steps (31%) done
Select jobs to execute...

[Mon Mar 27 21:58:09 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000065.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000065.ovb, 0-correction/overlap-jobs/000065.stats
    log: 0-correction/overlap-jobs/000065.err
    jobid: 92
    reason: Missing output files: 0-correction/overlap-jobs/000065.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000065
    threads: 8
    resources: tmpdir=/data/tmp, job_id=65, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:06:33 2023]
Finished job 180.
122 of 395 steps (31%) done
Select jobs to execute...

[Mon Mar 27 22:06:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000262.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000262.ovb, 0-correction/overlap-jobs/000262.stats
    log: 0-correction/overlap-jobs/000262.err
    jobid: 289
    reason: Missing output files: 0-correction/overlap-jobs/000262.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000262
    threads: 8
    resources: tmpdir=/data/tmp, job_id=262, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:09:56 2023]
Finished job 204.
123 of 395 steps (31%) done
Select jobs to execute...

[Mon Mar 27 22:09:56 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000209.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000209.ovb, 0-correction/overlap-jobs/000209.stats
    log: 0-correction/overlap-jobs/000209.err
    jobid: 236
    reason: Missing output files: 0-correction/overlap-jobs/000209.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000209
    threads: 8
    resources: tmpdir=/data/tmp, job_id=209, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:15:13 2023]
Finished job 92.
124 of 395 steps (31%) done
Select jobs to execute...

[Mon Mar 27 22:15:13 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000069.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000069.ovb, 0-correction/overlap-jobs/000069.stats
    log: 0-correction/overlap-jobs/000069.err
    jobid: 96
    reason: Missing output files: 0-correction/overlap-jobs/000069.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000069
    threads: 8
    resources: tmpdir=/data/tmp, job_id=69, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:17:20 2023]
Finished job 288.
125 of 395 steps (32%) done
Select jobs to execute...

[Mon Mar 27 22:17:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000125.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000125.ovb, 0-correction/overlap-jobs/000125.stats
    log: 0-correction/overlap-jobs/000125.err
    jobid: 152
    reason: Missing output files: 0-correction/overlap-jobs/000125.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000125
    threads: 8
    resources: tmpdir=/data/tmp, job_id=125, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:20:11 2023]
Finished job 232.
126 of 395 steps (32%) done
Select jobs to execute...

[Mon Mar 27 22:20:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000237.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000237.ovb, 0-correction/overlap-jobs/000237.stats
    log: 0-correction/overlap-jobs/000237.err
    jobid: 264
    reason: Missing output files: 0-correction/overlap-jobs/000237.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000237
    threads: 8
    resources: tmpdir=/data/tmp, job_id=237, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:24:08 2023]
Finished job 148.
127 of 395 steps (32%) done
Select jobs to execute...

[Mon Mar 27 22:24:09 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000009.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000009.ovb, 0-correction/overlap-jobs/000009.stats
    log: 0-correction/overlap-jobs/000009.err
    jobid: 36
    reason: Missing output files: 0-correction/overlap-jobs/000009.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000009
    threads: 8
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:32:16 2023]
Finished job 289.
128 of 395 steps (32%) done
Select jobs to execute...

[Mon Mar 27 22:32:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000098.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000098.ovb, 0-correction/overlap-jobs/000098.stats
    log: 0-correction/overlap-jobs/000098.err
    jobid: 125
    reason: Missing output files: 0-correction/overlap-jobs/000098.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000098
    threads: 8
    resources: tmpdir=/data/tmp, job_id=98, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:39:09 2023]
Finished job 236.
129 of 395 steps (33%) done
Select jobs to execute...

[Mon Mar 27 22:39:09 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000154.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000154.ovb, 0-correction/overlap-jobs/000154.stats
    log: 0-correction/overlap-jobs/000154.err
    jobid: 181
    reason: Missing output files: 0-correction/overlap-jobs/000154.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000154
    threads: 8
    resources: tmpdir=/data/tmp, job_id=154, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:44:57 2023]
Finished job 96.
130 of 395 steps (33%) done
Select jobs to execute...

[Mon Mar 27 22:44:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000266.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000266.ovb, 0-correction/overlap-jobs/000266.stats
    log: 0-correction/overlap-jobs/000266.err
    jobid: 293
    reason: Missing output files: 0-correction/overlap-jobs/000266.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000266
    threads: 8
    resources: tmpdir=/data/tmp, job_id=266, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:47:30 2023]
Finished job 152.
131 of 395 steps (33%) done
Select jobs to execute...

[Mon Mar 27 22:47:30 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000234.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000234.ovb, 0-correction/overlap-jobs/000234.stats
    log: 0-correction/overlap-jobs/000234.err
    jobid: 261
    reason: Missing output files: 0-correction/overlap-jobs/000234.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000234
    threads: 8
    resources: tmpdir=/data/tmp, job_id=234, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:48:20 2023]
Finished job 36.
132 of 395 steps (33%) done
Select jobs to execute...

[Mon Mar 27 22:48:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000126.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000126.ovb, 0-correction/overlap-jobs/000126.stats
    log: 0-correction/overlap-jobs/000126.err
    jobid: 153
    reason: Missing output files: 0-correction/overlap-jobs/000126.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000126
    threads: 8
    resources: tmpdir=/data/tmp, job_id=126, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:49:30 2023]
Finished job 264.
133 of 395 steps (34%) done
Select jobs to execute...

[Mon Mar 27 22:49:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000182.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000182.ovb, 0-correction/overlap-jobs/000182.stats
    log: 0-correction/overlap-jobs/000182.err
    jobid: 209
    reason: Missing output files: 0-correction/overlap-jobs/000182.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000182
    threads: 8
    resources: tmpdir=/data/tmp, job_id=182, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 22:54:27 2023]
Finished job 293.
134 of 395 steps (34%) done
Select jobs to execute...

[Mon Mar 27 22:54:27 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000043.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000043.ovb, 0-correction/overlap-jobs/000043.stats
    log: 0-correction/overlap-jobs/000043.err
    jobid: 70
    reason: Missing output files: 0-correction/overlap-jobs/000043.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000043
    threads: 8
    resources: tmpdir=/data/tmp, job_id=43, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:03:43 2023]
Finished job 125.
135 of 395 steps (34%) done
Select jobs to execute...

[Mon Mar 27 23:03:43 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000235.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000235.ovb, 0-correction/overlap-jobs/000235.stats
    log: 0-correction/overlap-jobs/000235.err
    jobid: 262
    reason: Missing output files: 0-correction/overlap-jobs/000235.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000235
    threads: 8
    resources: tmpdir=/data/tmp, job_id=235, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:11:47 2023]
Finished job 181.
136 of 395 steps (34%) done
Select jobs to execute...

[Mon Mar 27 23:11:47 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000265.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000265.ovb, 0-correction/overlap-jobs/000265.stats
    log: 0-correction/overlap-jobs/000265.err
    jobid: 292
    reason: Missing output files: 0-correction/overlap-jobs/000265.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000265
    threads: 8
    resources: tmpdir=/data/tmp, job_id=265, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:16:30 2023]
Finished job 261.
137 of 395 steps (35%) done
Select jobs to execute...

[Mon Mar 27 23:16:30 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000111.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000111.ovb, 0-correction/overlap-jobs/000111.stats
    log: 0-correction/overlap-jobs/000111.err
    jobid: 138
    reason: Missing output files: 0-correction/overlap-jobs/000111.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000111
    threads: 8
    resources: tmpdir=/data/tmp, job_id=111, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:18:37 2023]
Finished job 153.
138 of 395 steps (35%) done
Select jobs to execute...

[Mon Mar 27 23:18:38 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000167.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000167.ovb, 0-correction/overlap-jobs/000167.stats
    log: 0-correction/overlap-jobs/000167.err
    jobid: 194
    reason: Missing output files: 0-correction/overlap-jobs/000167.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000167
    threads: 8
    resources: tmpdir=/data/tmp, job_id=167, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:21:54 2023]
Finished job 70.
139 of 395 steps (35%) done
Select jobs to execute...

[Mon Mar 27 23:21:54 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000223.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000223.ovb, 0-correction/overlap-jobs/000223.stats
    log: 0-correction/overlap-jobs/000223.err
    jobid: 250
    reason: Missing output files: 0-correction/overlap-jobs/000223.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000223
    threads: 8
    resources: tmpdir=/data/tmp, job_id=223, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:22:37 2023]
Finished job 209.
140 of 395 steps (35%) done
Select jobs to execute...

[Mon Mar 27 23:22:38 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000260.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000260.ovb, 0-correction/overlap-jobs/000260.stats
    log: 0-correction/overlap-jobs/000260.err
    jobid: 287
    reason: Missing output files: 0-correction/overlap-jobs/000260.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000260
    threads: 8
    resources: tmpdir=/data/tmp, job_id=260, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:34:42 2023]
Finished job 262.
141 of 395 steps (36%) done
Select jobs to execute...

[Mon Mar 27 23:34:42 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000055.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000055.ovb, 0-correction/overlap-jobs/000055.stats
    log: 0-correction/overlap-jobs/000055.err
    jobid: 82
    reason: Missing output files: 0-correction/overlap-jobs/000055.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000055
    threads: 8
    resources: tmpdir=/data/tmp, job_id=55, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:37:50 2023]
Finished job 287.
142 of 395 steps (36%) done
Select jobs to execute...

[Mon Mar 27 23:37:50 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000181.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000181.ovb, 0-correction/overlap-jobs/000181.stats
    log: 0-correction/overlap-jobs/000181.err
    jobid: 208
    reason: Missing output files: 0-correction/overlap-jobs/000181.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000181
    threads: 8
    resources: tmpdir=/data/tmp, job_id=181, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:39:26 2023]
Finished job 292.
143 of 395 steps (36%) done
Select jobs to execute...

[Mon Mar 27 23:39:26 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000210.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000210.ovb, 0-correction/overlap-jobs/000210.stats
    log: 0-correction/overlap-jobs/000210.err
    jobid: 237
    reason: Missing output files: 0-correction/overlap-jobs/000210.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000210
    threads: 8
    resources: tmpdir=/data/tmp, job_id=210, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:45:48 2023]
Finished job 138.
144 of 395 steps (36%) done
Select jobs to execute...

[Mon Mar 27 23:45:48 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000070.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000070.ovb, 0-correction/overlap-jobs/000070.stats
    log: 0-correction/overlap-jobs/000070.err
    jobid: 97
    reason: Missing output files: 0-correction/overlap-jobs/000070.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000070
    threads: 8
    resources: tmpdir=/data/tmp, job_id=70, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:47:39 2023]
Finished job 194.
145 of 395 steps (37%) done
Select jobs to execute...

[Mon Mar 27 23:47:40 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000238.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000238.ovb, 0-correction/overlap-jobs/000238.stats
    log: 0-correction/overlap-jobs/000238.err
    jobid: 265
    reason: Missing output files: 0-correction/overlap-jobs/000238.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000238
    threads: 8
    resources: tmpdir=/data/tmp, job_id=238, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:50:37 2023]
Finished job 250.
146 of 395 steps (37%) done
Select jobs to execute...

[Mon Mar 27 23:50:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000155.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000155.ovb, 0-correction/overlap-jobs/000155.stats
    log: 0-correction/overlap-jobs/000155.err
    jobid: 182
    reason: Missing output files: 0-correction/overlap-jobs/000155.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000155
    threads: 8
    resources: tmpdir=/data/tmp, job_id=155, n_cpus=8, mem_gb=32, time_h=24

[Mon Mar 27 23:52:58 2023]
Finished job 208.
147 of 395 steps (37%) done
Select jobs to execute...

[Mon Mar 27 23:52:59 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000239.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000239.ovb, 0-correction/overlap-jobs/000239.stats
    log: 0-correction/overlap-jobs/000239.err
    jobid: 266
    reason: Missing output files: 0-correction/overlap-jobs/000239.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000239
    threads: 8
    resources: tmpdir=/data/tmp, job_id=239, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:06:20 2023]
Finished job 82.
148 of 395 steps (37%) done
Select jobs to execute...

[Tue Mar 28 00:06:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000183.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000183.ovb, 0-correction/overlap-jobs/000183.stats
    log: 0-correction/overlap-jobs/000183.err
    jobid: 210
    reason: Missing output files: 0-correction/overlap-jobs/000183.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000183
    threads: 8
    resources: tmpdir=/data/tmp, job_id=183, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:11:39 2023]
Finished job 237.
149 of 395 steps (38%) done
Select jobs to execute...

[Tue Mar 28 00:11:39 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000071.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000071.ovb, 0-correction/overlap-jobs/000071.stats
    log: 0-correction/overlap-jobs/000071.err
    jobid: 98
    reason: Missing output files: 0-correction/overlap-jobs/000071.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000071
    threads: 8
    resources: tmpdir=/data/tmp, job_id=71, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:15:28 2023]
Finished job 97.
150 of 395 steps (38%) done
Select jobs to execute...

[Tue Mar 28 00:15:28 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000044.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000044.ovb, 0-correction/overlap-jobs/000044.stats
    log: 0-correction/overlap-jobs/000044.err
    jobid: 71
    reason: Missing output files: 0-correction/overlap-jobs/000044.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000044
    threads: 8
    resources: tmpdir=/data/tmp, job_id=44, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:17:32 2023]
Finished job 265.
151 of 395 steps (38%) done
Select jobs to execute...

[Tue Mar 28 00:17:32 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000013.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000013.ovb, 0-correction/overlap-jobs/000013.stats
    log: 0-correction/overlap-jobs/000013.err
    jobid: 40
    reason: Missing output files: 0-correction/overlap-jobs/000013.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000013
    threads: 8
    resources: tmpdir=/data/tmp, job_id=13, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:22:24 2023]
Finished job 182.
152 of 395 steps (38%) done
Select jobs to execute...

[Tue Mar 28 00:22:24 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000212.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000212.ovb, 0-correction/overlap-jobs/000212.stats
    log: 0-correction/overlap-jobs/000212.err
    jobid: 239
    reason: Missing output files: 0-correction/overlap-jobs/000212.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000212
    threads: 8
    resources: tmpdir=/data/tmp, job_id=212, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:24:54 2023]
Finished job 266.
153 of 395 steps (39%) done
Select jobs to execute...

[Tue Mar 28 00:24:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000016.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000016.ovb, 0-correction/overlap-jobs/000016.stats
    log: 0-correction/overlap-jobs/000016.err
    jobid: 43
    reason: Missing output files: 0-correction/overlap-jobs/000016.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000016
    threads: 8
    resources: tmpdir=/data/tmp, job_id=16, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:31:16 2023]
Finished job 98.
154 of 395 steps (39%) done
Select jobs to execute...

[Tue Mar 28 00:31:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000128.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000128.ovb, 0-correction/overlap-jobs/000128.stats
    log: 0-correction/overlap-jobs/000128.err
    jobid: 155
    reason: Missing output files: 0-correction/overlap-jobs/000128.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000128
    threads: 8
    resources: tmpdir=/data/tmp, job_id=128, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:37:35 2023]
Finished job 210.
155 of 395 steps (39%) done
Select jobs to execute...

[Tue Mar 28 00:37:35 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000240.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000240.ovb, 0-correction/overlap-jobs/000240.stats
    log: 0-correction/overlap-jobs/000240.err
    jobid: 267
    reason: Missing output files: 0-correction/overlap-jobs/000240.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000240
    threads: 8
    resources: tmpdir=/data/tmp, job_id=240, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:43:52 2023]
Finished job 71.
156 of 395 steps (39%) done
Select jobs to execute...

[Tue Mar 28 00:43:52 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000157.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000157.ovb, 0-correction/overlap-jobs/000157.stats
    log: 0-correction/overlap-jobs/000157.err
    jobid: 184
    reason: Missing output files: 0-correction/overlap-jobs/000157.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000157
    threads: 8
    resources: tmpdir=/data/tmp, job_id=157, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:45:29 2023]
Finished job 40.
157 of 395 steps (40%) done
Select jobs to execute...

[Tue Mar 28 00:45:29 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000213.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000213.ovb, 0-correction/overlap-jobs/000213.stats
    log: 0-correction/overlap-jobs/000213.err
    jobid: 240
    reason: Missing output files: 0-correction/overlap-jobs/000213.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000213
    threads: 8
    resources: tmpdir=/data/tmp, job_id=213, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:51:10 2023]
Finished job 155.
158 of 395 steps (40%) done
Select jobs to execute...

[Tue Mar 28 00:51:10 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000017.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000017.ovb, 0-correction/overlap-jobs/000017.stats
    log: 0-correction/overlap-jobs/000017.err
    jobid: 44
    reason: Missing output files: 0-correction/overlap-jobs/000017.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000017
    threads: 8
    resources: tmpdir=/data/tmp, job_id=17, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:51:55 2023]
Finished job 239.
159 of 395 steps (40%) done
Select jobs to execute...

[Tue Mar 28 00:51:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000129.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000129.ovb, 0-correction/overlap-jobs/000129.stats
    log: 0-correction/overlap-jobs/000129.err
    jobid: 156
    reason: Missing output files: 0-correction/overlap-jobs/000129.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000129
    threads: 8
    resources: tmpdir=/data/tmp, job_id=129, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:53:32 2023]
Finished job 43.
160 of 395 steps (41%) done
Select jobs to execute...

[Tue Mar 28 00:53:32 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000241.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000241.ovb, 0-correction/overlap-jobs/000241.stats
    log: 0-correction/overlap-jobs/000241.err
    jobid: 268
    reason: Missing output files: 0-correction/overlap-jobs/000241.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000241
    threads: 8
    resources: tmpdir=/data/tmp, job_id=241, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 00:59:03 2023]
Finished job 44.
161 of 395 steps (41%) done
Select jobs to execute...

[Tue Mar 28 00:59:03 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000046.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000046.ovb, 0-correction/overlap-jobs/000046.stats
    log: 0-correction/overlap-jobs/000046.err
    jobid: 73
    reason: Missing output files: 0-correction/overlap-jobs/000046.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000046
    threads: 8
    resources: tmpdir=/data/tmp, job_id=46, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:07:59 2023]
Finished job 267.
162 of 395 steps (41%) done
Select jobs to execute...

[Tue Mar 28 01:08:00 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000158.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000158.ovb, 0-correction/overlap-jobs/000158.stats
    log: 0-correction/overlap-jobs/000158.err
    jobid: 185
    reason: Missing output files: 0-correction/overlap-jobs/000158.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000158
    threads: 8
    resources: tmpdir=/data/tmp, job_id=158, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:13:33 2023]
Finished job 184.
163 of 395 steps (41%) done
Select jobs to execute...

[Tue Mar 28 01:13:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000018.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000018.ovb, 0-correction/overlap-jobs/000018.stats
    log: 0-correction/overlap-jobs/000018.err
    jobid: 45
    reason: Missing output files: 0-correction/overlap-jobs/000018.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000018
    threads: 8
    resources: tmpdir=/data/tmp, job_id=18, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:14:30 2023]
Finished job 240.
164 of 395 steps (42%) done
Select jobs to execute...

[Tue Mar 28 01:14:30 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000130.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000130.ovb, 0-correction/overlap-jobs/000130.stats
    log: 0-correction/overlap-jobs/000130.err
    jobid: 157
    reason: Missing output files: 0-correction/overlap-jobs/000130.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000130
    threads: 8
    resources: tmpdir=/data/tmp, job_id=130, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:23:27 2023]
Finished job 156.
165 of 395 steps (42%) done
Select jobs to execute...

[Tue Mar 28 01:23:27 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000186.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000186.ovb, 0-correction/overlap-jobs/000186.stats
    log: 0-correction/overlap-jobs/000186.err
    jobid: 213
    reason: Missing output files: 0-correction/overlap-jobs/000186.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000186
    threads: 8
    resources: tmpdir=/data/tmp, job_id=186, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:26:31 2023]
Finished job 268.
166 of 395 steps (42%) done
Select jobs to execute...

[Tue Mar 28 01:26:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000039.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000039.ovb, 0-correction/overlap-jobs/000039.stats
    log: 0-correction/overlap-jobs/000039.err
    jobid: 66
    reason: Missing output files: 0-correction/overlap-jobs/000039.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000039
    threads: 8
    resources: tmpdir=/data/tmp, job_id=39, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:31:39 2023]
Finished job 73.
167 of 395 steps (42%) done
Select jobs to execute...

[Tue Mar 28 01:31:39 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000103.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000103.ovb, 0-correction/overlap-jobs/000103.stats
    log: 0-correction/overlap-jobs/000103.err
    jobid: 130
    reason: Missing output files: 0-correction/overlap-jobs/000103.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000103
    threads: 8
    resources: tmpdir=/data/tmp, job_id=103, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:38:08 2023]
Finished job 185.
168 of 395 steps (43%) done
Select jobs to execute...

[Tue Mar 28 01:38:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000215.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000215.ovb, 0-correction/overlap-jobs/000215.stats
    log: 0-correction/overlap-jobs/000215.err
    jobid: 242
    reason: Missing output files: 0-correction/overlap-jobs/000215.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000215
    threads: 8
    resources: tmpdir=/data/tmp, job_id=215, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:40:41 2023]
Finished job 213.
169 of 395 steps (43%) done
Select jobs to execute...

[Tue Mar 28 01:40:41 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000019.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000019.ovb, 0-correction/overlap-jobs/000019.stats
    log: 0-correction/overlap-jobs/000019.err
    jobid: 46
    reason: Missing output files: 0-correction/overlap-jobs/000019.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000019
    threads: 8
    resources: tmpdir=/data/tmp, job_id=19, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:41:54 2023]
Finished job 45.
170 of 395 steps (43%) done
Select jobs to execute...

[Tue Mar 28 01:41:54 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000131.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000131.ovb, 0-correction/overlap-jobs/000131.stats
    log: 0-correction/overlap-jobs/000131.err
    jobid: 158
    reason: Missing output files: 0-correction/overlap-jobs/000131.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000131
    threads: 8
    resources: tmpdir=/data/tmp, job_id=131, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:45:08 2023]
Finished job 157.
171 of 395 steps (43%) done
Select jobs to execute...

[Tue Mar 28 01:45:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000187.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000187.ovb, 0-correction/overlap-jobs/000187.stats
    log: 0-correction/overlap-jobs/000187.err
    jobid: 214
    reason: Missing output files: 0-correction/overlap-jobs/000187.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000187
    threads: 8
    resources: tmpdir=/data/tmp, job_id=187, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:50:14 2023]
Finished job 66.
172 of 395 steps (44%) done
Select jobs to execute...

[Tue Mar 28 01:50:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000243.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000243.ovb, 0-correction/overlap-jobs/000243.stats
    log: 0-correction/overlap-jobs/000243.err
    jobid: 270
    reason: Missing output files: 0-correction/overlap-jobs/000243.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000243
    threads: 8
    resources: tmpdir=/data/tmp, job_id=243, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 01:50:51 2023]
Finished job 46.
173 of 395 steps (44%) done
Select jobs to execute...

[Tue Mar 28 01:50:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000075.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000075.ovb, 0-correction/overlap-jobs/000075.stats
    log: 0-correction/overlap-jobs/000075.err
    jobid: 102
    reason: Missing output files: 0-correction/overlap-jobs/000075.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000075
    threads: 8
    resources: tmpdir=/data/tmp, job_id=75, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:04:55 2023]
Finished job 130.
174 of 395 steps (44%) done
Select jobs to execute...

[Tue Mar 28 02:04:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000048.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000048.ovb, 0-correction/overlap-jobs/000048.stats
    log: 0-correction/overlap-jobs/000048.err
    jobid: 75
    reason: Missing output files: 0-correction/overlap-jobs/000048.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000048
    threads: 8
    resources: tmpdir=/data/tmp, job_id=48, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:10:02 2023]
Finished job 242.
175 of 395 steps (44%) done
Select jobs to execute...

[Tue Mar 28 02:10:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000104.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000104.ovb, 0-correction/overlap-jobs/000104.stats
    log: 0-correction/overlap-jobs/000104.err
    jobid: 131
    reason: Missing output files: 0-correction/overlap-jobs/000104.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000104
    threads: 8
    resources: tmpdir=/data/tmp, job_id=104, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:10:33 2023]
Finished job 158.
176 of 395 steps (45%) done
Select jobs to execute...

[Tue Mar 28 02:10:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000160.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000160.ovb, 0-correction/overlap-jobs/000160.stats
    log: 0-correction/overlap-jobs/000160.err
    jobid: 187
    reason: Missing output files: 0-correction/overlap-jobs/000160.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000160
    threads: 8
    resources: tmpdir=/data/tmp, job_id=160, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:15:34 2023]
Finished job 214.
177 of 395 steps (45%) done
Select jobs to execute...

[Tue Mar 28 02:15:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000159.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000159.ovb, 0-correction/overlap-jobs/000159.stats
    log: 0-correction/overlap-jobs/000159.err
    jobid: 186
    reason: Missing output files: 0-correction/overlap-jobs/000159.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000159
    threads: 8
    resources: tmpdir=/data/tmp, job_id=159, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:19:33 2023]
Finished job 270.
178 of 395 steps (45%) done
Select jobs to execute...

[Tue Mar 28 02:19:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000216.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000216.ovb, 0-correction/overlap-jobs/000216.stats
    log: 0-correction/overlap-jobs/000216.err
    jobid: 243
    reason: Missing output files: 0-correction/overlap-jobs/000216.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000216
    threads: 8
    resources: tmpdir=/data/tmp, job_id=216, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:21:06 2023]
Finished job 131.
179 of 395 steps (45%) done
Select jobs to execute...

[Tue Mar 28 02:21:06 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000020.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000020.ovb, 0-correction/overlap-jobs/000020.stats
    log: 0-correction/overlap-jobs/000020.err
    jobid: 47
    reason: Missing output files: 0-correction/overlap-jobs/000020.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000020
    threads: 8
    resources: tmpdir=/data/tmp, job_id=20, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:23:34 2023]
Finished job 102.
180 of 395 steps (46%) done
Select jobs to execute...

[Tue Mar 28 02:23:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000076.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000076.ovb, 0-correction/overlap-jobs/000076.stats
    log: 0-correction/overlap-jobs/000076.err
    jobid: 103
    reason: Missing output files: 0-correction/overlap-jobs/000076.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000076
    threads: 8
    resources: tmpdir=/data/tmp, job_id=76, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:38:51 2023]
Finished job 75.
181 of 395 steps (46%) done
Select jobs to execute...

[Tue Mar 28 02:38:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000095.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000095.ovb, 0-correction/overlap-jobs/000095.stats
    log: 0-correction/overlap-jobs/000095.err
    jobid: 122
    reason: Missing output files: 0-correction/overlap-jobs/000095.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000095
    threads: 8
    resources: tmpdir=/data/tmp, job_id=95, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:42:30 2023]
Finished job 187.
182 of 395 steps (46%) done
Select jobs to execute...

[Tue Mar 28 02:42:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000151.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000151.ovb, 0-correction/overlap-jobs/000151.stats
    log: 0-correction/overlap-jobs/000151.err
    jobid: 178
    reason: Missing output files: 0-correction/overlap-jobs/000151.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000151
    threads: 8
    resources: tmpdir=/data/tmp, job_id=151, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:45:11 2023]
Finished job 186.
183 of 395 steps (46%) done
Select jobs to execute...

[Tue Mar 28 02:45:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000207.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000207.ovb, 0-correction/overlap-jobs/000207.stats
    log: 0-correction/overlap-jobs/000207.err
    jobid: 234
    reason: Missing output files: 0-correction/overlap-jobs/000207.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000207
    threads: 8
    resources: tmpdir=/data/tmp, job_id=207, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:45:39 2023]
Finished job 243.
184 of 395 steps (47%) done
Select jobs to execute...

[Tue Mar 28 02:45:39 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000263.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000263.ovb, 0-correction/overlap-jobs/000263.stats
    log: 0-correction/overlap-jobs/000263.err
    jobid: 290
    reason: Missing output files: 0-correction/overlap-jobs/000263.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000263
    threads: 8
    resources: tmpdir=/data/tmp, job_id=263, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:49:59 2023]
Finished job 47.
185 of 395 steps (47%) done
Select jobs to execute...

[Tue Mar 28 02:50:00 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000049.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000049.ovb, 0-correction/overlap-jobs/000049.stats
    log: 0-correction/overlap-jobs/000049.err
    jobid: 76
    reason: Missing output files: 0-correction/overlap-jobs/000049.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000049
    threads: 8
    resources: tmpdir=/data/tmp, job_id=49, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 02:53:02 2023]
Finished job 103.
186 of 395 steps (47%) done
Select jobs to execute...

[Tue Mar 28 02:53:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000105.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000105.ovb, 0-correction/overlap-jobs/000105.stats
    log: 0-correction/overlap-jobs/000105.err
    jobid: 132
    reason: Missing output files: 0-correction/overlap-jobs/000105.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000105
    threads: 8
    resources: tmpdir=/data/tmp, job_id=105, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:09:01 2023]
Finished job 122.
187 of 395 steps (47%) done
Select jobs to execute...

[Tue Mar 28 03:09:01 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000161.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000161.ovb, 0-correction/overlap-jobs/000161.stats
    log: 0-correction/overlap-jobs/000161.err
    jobid: 188
    reason: Missing output files: 0-correction/overlap-jobs/000161.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000161
    threads: 8
    resources: tmpdir=/data/tmp, job_id=161, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:11:08 2023]
Finished job 290.
188 of 395 steps (48%) done
Select jobs to execute...

[Tue Mar 28 03:11:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000217.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000217.ovb, 0-correction/overlap-jobs/000217.stats
    log: 0-correction/overlap-jobs/000217.err
    jobid: 244
    reason: Missing output files: 0-correction/overlap-jobs/000217.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000217
    threads: 8
    resources: tmpdir=/data/tmp, job_id=217, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:13:33 2023]
Finished job 178.
189 of 395 steps (48%) done
Select jobs to execute...

[Tue Mar 28 03:13:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000244.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000244.ovb, 0-correction/overlap-jobs/000244.stats
    log: 0-correction/overlap-jobs/000244.err
    jobid: 271
    reason: Missing output files: 0-correction/overlap-jobs/000244.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000244
    threads: 8
    resources: tmpdir=/data/tmp, job_id=244, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:16:51 2023]
Finished job 234.
190 of 395 steps (48%) done
Select jobs to execute...

[Tue Mar 28 03:16:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000021.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000021.ovb, 0-correction/overlap-jobs/000021.stats
    log: 0-correction/overlap-jobs/000021.err
    jobid: 48
    reason: Missing output files: 0-correction/overlap-jobs/000021.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000021
    threads: 8
    resources: tmpdir=/data/tmp, job_id=21, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:18:05 2023]
Finished job 188.
191 of 395 steps (48%) done
Select jobs to execute...

[Tue Mar 28 03:18:05 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000077.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000077.ovb, 0-correction/overlap-jobs/000077.stats
    log: 0-correction/overlap-jobs/000077.err
    jobid: 104
    reason: Missing output files: 0-correction/overlap-jobs/000077.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000077
    threads: 8
    resources: tmpdir=/data/tmp, job_id=77, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:22:48 2023]
Finished job 76.
192 of 395 steps (49%) done
Select jobs to execute...

[Tue Mar 28 03:22:49 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000133.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000133.ovb, 0-correction/overlap-jobs/000133.stats
    log: 0-correction/overlap-jobs/000133.err
    jobid: 160
    reason: Missing output files: 0-correction/overlap-jobs/000133.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000133
    threads: 8
    resources: tmpdir=/data/tmp, job_id=133, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:24:51 2023]
Finished job 132.
193 of 395 steps (49%) done
Select jobs to execute...

[Tue Mar 28 03:24:51 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000188.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000188.ovb, 0-correction/overlap-jobs/000188.stats
    log: 0-correction/overlap-jobs/000188.err
    jobid: 215
    reason: Missing output files: 0-correction/overlap-jobs/000188.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000188
    threads: 8
    resources: tmpdir=/data/tmp, job_id=188, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:27:40 2023]
Finished job 48.
194 of 395 steps (49%) done
Select jobs to execute...

[Tue Mar 28 03:27:40 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000002.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000002.ovb, 0-correction/overlap-jobs/000002.stats
    log: 0-correction/overlap-jobs/000002.err
    jobid: 29
    reason: Missing output files: 0-correction/overlap-jobs/000002.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000002
    threads: 8
    resources: tmpdir=/data/tmp, job_id=2, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:38:36 2023]
Finished job 29.
195 of 395 steps (49%) done
Select jobs to execute...

[Tue Mar 28 03:38:36 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000054.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000054.ovb, 0-correction/overlap-jobs/000054.stats
    log: 0-correction/overlap-jobs/000054.err
    jobid: 81
    reason: Missing output files: 0-correction/overlap-jobs/000054.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000054
    threads: 8
    resources: tmpdir=/data/tmp, job_id=54, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:40:37 2023]
Finished job 244.
196 of 395 steps (50%) done
Select jobs to execute...

[Tue Mar 28 03:40:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000110.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000110.ovb, 0-correction/overlap-jobs/000110.stats
    log: 0-correction/overlap-jobs/000110.err
    jobid: 137
    reason: Missing output files: 0-correction/overlap-jobs/000110.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000110
    threads: 8
    resources: tmpdir=/data/tmp, job_id=110, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:42:57 2023]
Finished job 271.
197 of 395 steps (50%) done
Select jobs to execute...

[Tue Mar 28 03:42:58 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000193.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000193.ovb, 0-correction/overlap-jobs/000193.stats
    log: 0-correction/overlap-jobs/000193.err
    jobid: 220
    reason: Missing output files: 0-correction/overlap-jobs/000193.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000193
    threads: 8
    resources: tmpdir=/data/tmp, job_id=193, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:43:11 2023]
Finished job 104.
198 of 395 steps (50%) done
Select jobs to execute...

[Tue Mar 28 03:43:11 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000166.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000166.ovb, 0-correction/overlap-jobs/000166.stats
    log: 0-correction/overlap-jobs/000166.err
    jobid: 193
    reason: Missing output files: 0-correction/overlap-jobs/000166.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000166
    threads: 8
    resources: tmpdir=/data/tmp, job_id=166, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:51:00 2023]
Finished job 160.
199 of 395 steps (50%) done
Select jobs to execute...

[Tue Mar 28 03:51:01 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000222.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000222.ovb, 0-correction/overlap-jobs/000222.stats
    log: 0-correction/overlap-jobs/000222.err
    jobid: 249
    reason: Missing output files: 0-correction/overlap-jobs/000222.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000222
    threads: 8
    resources: tmpdir=/data/tmp, job_id=222, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:53:40 2023]
Finished job 193.
200 of 395 steps (51%) done
Select jobs to execute...

[Tue Mar 28 03:53:40 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000047.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000047.ovb, 0-correction/overlap-jobs/000047.stats
    log: 0-correction/overlap-jobs/000047.err
    jobid: 74
    reason: Missing output files: 0-correction/overlap-jobs/000047.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000047
    threads: 8
    resources: tmpdir=/data/tmp, job_id=47, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 03:55:36 2023]
Finished job 215.
201 of 395 steps (51%) done
Select jobs to execute...

[Tue Mar 28 03:55:36 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000249.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000249.ovb, 0-correction/overlap-jobs/000249.stats
    log: 0-correction/overlap-jobs/000249.err
    jobid: 276
    reason: Missing output files: 0-correction/overlap-jobs/000249.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000249
    threads: 8
    resources: tmpdir=/data/tmp, job_id=249, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:08:37 2023]
Finished job 81.
202 of 395 steps (51%) done
Select jobs to execute...

[Tue Mar 28 04:08:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000026.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000026.ovb, 0-correction/overlap-jobs/000026.stats
    log: 0-correction/overlap-jobs/000026.err
    jobid: 53
    reason: Missing output files: 0-correction/overlap-jobs/000026.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000026
    threads: 8
    resources: tmpdir=/data/tmp, job_id=26, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:10:15 2023]
Finished job 137.
203 of 395 steps (51%) done
Select jobs to execute...

[Tue Mar 28 04:10:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000050.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000050.ovb, 0-correction/overlap-jobs/000050.stats
    log: 0-correction/overlap-jobs/000050.err
    jobid: 77
    reason: Missing output files: 0-correction/overlap-jobs/000050.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000050
    threads: 8
    resources: tmpdir=/data/tmp, job_id=50, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:14:16 2023]
Finished job 220.
204 of 395 steps (52%) done
Select jobs to execute...

[Tue Mar 28 04:14:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000106.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000106.ovb, 0-correction/overlap-jobs/000106.stats
    log: 0-correction/overlap-jobs/000106.err
    jobid: 133
    reason: Missing output files: 0-correction/overlap-jobs/000106.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000106
    threads: 8
    resources: tmpdir=/data/tmp, job_id=106, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:19:14 2023]
Finished job 77.
205 of 395 steps (52%) done
Select jobs to execute...

[Tue Mar 28 04:19:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000014.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000014.ovb, 0-correction/overlap-jobs/000014.stats
    log: 0-correction/overlap-jobs/000014.err
    jobid: 41
    reason: Missing output files: 0-correction/overlap-jobs/000014.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000014
    threads: 8
    resources: tmpdir=/data/tmp, job_id=14, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:22:46 2023]
Finished job 74.
206 of 395 steps (52%) done
Select jobs to execute...

[Tue Mar 28 04:22:46 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000162.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000162.ovb, 0-correction/overlap-jobs/000162.stats
    log: 0-correction/overlap-jobs/000162.err
    jobid: 189
    reason: Missing output files: 0-correction/overlap-jobs/000162.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000162
    threads: 8
    resources: tmpdir=/data/tmp, job_id=162, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:23:19 2023]
Finished job 249.
207 of 395 steps (52%) done
Select jobs to execute...

[Tue Mar 28 04:23:20 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000245.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000245.ovb, 0-correction/overlap-jobs/000245.stats
    log: 0-correction/overlap-jobs/000245.err
    jobid: 272
    reason: Missing output files: 0-correction/overlap-jobs/000245.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000245
    threads: 8
    resources: tmpdir=/data/tmp, job_id=245, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:28:26 2023]
Finished job 276.
208 of 395 steps (53%) done
Select jobs to execute...

[Tue Mar 28 04:28:27 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000218.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000218.ovb, 0-correction/overlap-jobs/000218.stats
    log: 0-correction/overlap-jobs/000218.err
    jobid: 245
    reason: Missing output files: 0-correction/overlap-jobs/000218.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000218
    threads: 8
    resources: tmpdir=/data/tmp, job_id=218, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:39:59 2023]
Finished job 53.
209 of 395 steps (53%) done
Select jobs to execute...

[Tue Mar 28 04:39:59 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000189.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000189.ovb, 0-correction/overlap-jobs/000189.stats
    log: 0-correction/overlap-jobs/000189.err
    jobid: 216
    reason: Missing output files: 0-correction/overlap-jobs/000189.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000189
    threads: 8
    resources: tmpdir=/data/tmp, job_id=189, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:47:04 2023]
Finished job 133.
210 of 395 steps (53%) done
Select jobs to execute...

[Tue Mar 28 04:47:05 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000220.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000220.ovb, 0-correction/overlap-jobs/000220.stats
    log: 0-correction/overlap-jobs/000220.err
    jobid: 247
    reason: Missing output files: 0-correction/overlap-jobs/000220.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000220
    threads: 8
    resources: tmpdir=/data/tmp, job_id=220, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:47:44 2023]
Finished job 41.
211 of 395 steps (53%) done
Select jobs to execute...

[Tue Mar 28 04:47:44 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000042.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000042.ovb, 0-correction/overlap-jobs/000042.stats
    log: 0-correction/overlap-jobs/000042.err
    jobid: 69
    reason: Missing output files: 0-correction/overlap-jobs/000042.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000042
    threads: 8
    resources: tmpdir=/data/tmp, job_id=42, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:52:07 2023]
Finished job 272.
212 of 395 steps (54%) done
Select jobs to execute...

[Tue Mar 28 04:52:07 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000099.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000099.ovb, 0-correction/overlap-jobs/000099.stats
    log: 0-correction/overlap-jobs/000099.err
    jobid: 126
    reason: Missing output files: 0-correction/overlap-jobs/000099.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000099
    threads: 8
    resources: tmpdir=/data/tmp, job_id=99, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:56:14 2023]
Finished job 189.
213 of 395 steps (54%) done
Select jobs to execute...

[Tue Mar 28 04:56:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000101.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000101.ovb, 0-correction/overlap-jobs/000101.stats
    log: 0-correction/overlap-jobs/000101.err
    jobid: 128
    reason: Missing output files: 0-correction/overlap-jobs/000101.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000101
    threads: 8
    resources: tmpdir=/data/tmp, job_id=101, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 04:57:37 2023]
Finished job 245.
214 of 395 steps (54%) done
Select jobs to execute...

[Tue Mar 28 04:57:37 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000211.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000211.ovb, 0-correction/overlap-jobs/000211.stats
    log: 0-correction/overlap-jobs/000211.err
    jobid: 238
    reason: Missing output files: 0-correction/overlap-jobs/000211.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000211
    threads: 8
    resources: tmpdir=/data/tmp, job_id=211, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:12:24 2023]
Finished job 216.
215 of 395 steps (54%) done
Select jobs to execute...

[Tue Mar 28 05:12:24 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000132.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000132.ovb, 0-correction/overlap-jobs/000132.stats
    log: 0-correction/overlap-jobs/000132.err
    jobid: 159
    reason: Missing output files: 0-correction/overlap-jobs/000132.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000132
    threads: 8
    resources: tmpdir=/data/tmp, job_id=132, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:17:23 2023]
Finished job 247.
216 of 395 steps (55%) done
Select jobs to execute...

[Tue Mar 28 05:17:23 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000078.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000078.ovb, 0-correction/overlap-jobs/000078.stats
    log: 0-correction/overlap-jobs/000078.err
    jobid: 105
    reason: Missing output files: 0-correction/overlap-jobs/000078.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000078
    threads: 8
    resources: tmpdir=/data/tmp, job_id=78, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:19:31 2023]
Finished job 69.
217 of 395 steps (55%) done
Select jobs to execute...

[Tue Mar 28 05:19:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000164.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000164.ovb, 0-correction/overlap-jobs/000164.stats
    log: 0-correction/overlap-jobs/000164.err
    jobid: 191
    reason: Missing output files: 0-correction/overlap-jobs/000164.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000164
    threads: 8
    resources: tmpdir=/data/tmp, job_id=164, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:20:30 2023]
Finished job 238.
218 of 395 steps (55%) done
Select jobs to execute...

[Tue Mar 28 05:20:30 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000134.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000134.ovb, 0-correction/overlap-jobs/000134.stats
    log: 0-correction/overlap-jobs/000134.err
    jobid: 161
    reason: Missing output files: 0-correction/overlap-jobs/000134.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000134
    threads: 8
    resources: tmpdir=/data/tmp, job_id=134, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:21:15 2023]
Finished job 126.
219 of 395 steps (55%) done
Select jobs to execute...

[Tue Mar 28 05:21:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000108.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000108.ovb, 0-correction/overlap-jobs/000108.stats
    log: 0-correction/overlap-jobs/000108.err
    jobid: 135
    reason: Missing output files: 0-correction/overlap-jobs/000108.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000108
    threads: 8
    resources: tmpdir=/data/tmp, job_id=108, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:26:02 2023]
Finished job 128.
220 of 395 steps (56%) done
Select jobs to execute...

[Tue Mar 28 05:26:02 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000246.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000246.ovb, 0-correction/overlap-jobs/000246.stats
    log: 0-correction/overlap-jobs/000246.err
    jobid: 273
    reason: Missing output files: 0-correction/overlap-jobs/000246.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000246
    threads: 8
    resources: tmpdir=/data/tmp, job_id=246, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:33:15 2023]
Finished job 135.
221 of 395 steps (56%) done
Select jobs to execute...

[Tue Mar 28 05:33:15 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000185.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000185.ovb, 0-correction/overlap-jobs/000185.stats
    log: 0-correction/overlap-jobs/000185.err
    jobid: 212
    reason: Missing output files: 0-correction/overlap-jobs/000185.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000185
    threads: 8
    resources: tmpdir=/data/tmp, job_id=185, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:35:21 2023]
Finished job 159.
222 of 395 steps (56%) done
Select jobs to execute...

[Tue Mar 28 05:35:21 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000136.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000136.ovb, 0-correction/overlap-jobs/000136.stats
    log: 0-correction/overlap-jobs/000136.err
    jobid: 163
    reason: Missing output files: 0-correction/overlap-jobs/000136.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000136
    threads: 8
    resources: tmpdir=/data/tmp, job_id=136, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:46:16 2023]
Finished job 105.
223 of 395 steps (56%) done
Select jobs to execute...

[Tue Mar 28 05:46:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000022.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000022.ovb, 0-correction/overlap-jobs/000022.stats
    log: 0-correction/overlap-jobs/000022.err
    jobid: 49
    reason: Missing output files: 0-correction/overlap-jobs/000022.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000022
    threads: 8
    resources: tmpdir=/data/tmp, job_id=22, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:48:22 2023]
Finished job 191.
224 of 395 steps (57%) done
Select jobs to execute...

[Tue Mar 28 05:48:22 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000127.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000127.ovb, 0-correction/overlap-jobs/000127.stats
    log: 0-correction/overlap-jobs/000127.err
    jobid: 154
    reason: Missing output files: 0-correction/overlap-jobs/000127.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000127
    threads: 8
    resources: tmpdir=/data/tmp, job_id=127, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:50:17 2023]
Finished job 161.
225 of 395 steps (57%) done
Select jobs to execute...

[Tue Mar 28 05:50:17 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000190.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000190.ovb, 0-correction/overlap-jobs/000190.stats
    log: 0-correction/overlap-jobs/000190.err
    jobid: 217
    reason: Missing output files: 0-correction/overlap-jobs/000190.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000190
    threads: 8
    resources: tmpdir=/data/tmp, job_id=190, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:57:47 2023]
Finished job 273.
226 of 395 steps (57%) done
Select jobs to execute...

[Tue Mar 28 05:57:47 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000015.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000015.ovb, 0-correction/overlap-jobs/000015.stats
    log: 0-correction/overlap-jobs/000015.err
    jobid: 42
    reason: Missing output files: 0-correction/overlap-jobs/000015.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000015
    threads: 8
    resources: tmpdir=/data/tmp, job_id=15, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 05:58:14 2023]
Finished job 163.
227 of 395 steps (57%) done
Select jobs to execute...

[Tue Mar 28 05:58:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000012.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000012.ovb, 0-correction/overlap-jobs/000012.stats
    log: 0-correction/overlap-jobs/000012.err
    jobid: 39
    reason: Missing output files: 0-correction/overlap-jobs/000012.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000012
    threads: 8
    resources: tmpdir=/data/tmp, job_id=12, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:03:46 2023]
Finished job 212.
228 of 395 steps (58%) done
Select jobs to execute...

[Tue Mar 28 06:03:46 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000051.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000051.ovb, 0-correction/overlap-jobs/000051.stats
    log: 0-correction/overlap-jobs/000051.err
    jobid: 78
    reason: Missing output files: 0-correction/overlap-jobs/000051.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000051
    threads: 8
    resources: tmpdir=/data/tmp, job_id=51, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:17:22 2023]
Finished job 49.
229 of 395 steps (58%) done
Select jobs to execute...

[Tue Mar 28 06:17:22 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000250.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000250.ovb, 0-correction/overlap-jobs/000250.stats
    log: 0-correction/overlap-jobs/000250.err
    jobid: 277
    reason: Missing output files: 0-correction/overlap-jobs/000250.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000250
    threads: 8
    resources: tmpdir=/data/tmp, job_id=250, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:18:48 2023]
Finished job 154.
230 of 395 steps (58%) done
Select jobs to execute...

[Tue Mar 28 06:18:49 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000107.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000107.ovb, 0-correction/overlap-jobs/000107.stats
    log: 0-correction/overlap-jobs/000107.err
    jobid: 134
    reason: Missing output files: 0-correction/overlap-jobs/000107.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000107
    threads: 8
    resources: tmpdir=/data/tmp, job_id=107, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:22:05 2023]
Finished job 217.
231 of 395 steps (58%) done
Select jobs to execute...

[Tue Mar 28 06:22:05 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000194.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000194.ovb, 0-correction/overlap-jobs/000194.stats
    log: 0-correction/overlap-jobs/000194.err
    jobid: 221
    reason: Missing output files: 0-correction/overlap-jobs/000194.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000194
    threads: 8
    resources: tmpdir=/data/tmp, job_id=194, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:23:13 2023]
Finished job 39.
232 of 395 steps (59%) done
Select jobs to execute...

[Tue Mar 28 06:23:13 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000163.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000163.ovb, 0-correction/overlap-jobs/000163.stats
    log: 0-correction/overlap-jobs/000163.err
    jobid: 190
    reason: Missing output files: 0-correction/overlap-jobs/000163.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000163
    threads: 8
    resources: tmpdir=/data/tmp, job_id=163, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:26:56 2023]
Finished job 42.
233 of 395 steps (59%) done
Select jobs to execute...

[Tue Mar 28 06:26:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000138.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000138.ovb, 0-correction/overlap-jobs/000138.stats
    log: 0-correction/overlap-jobs/000138.err
    jobid: 165
    reason: Missing output files: 0-correction/overlap-jobs/000138.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000138
    threads: 8
    resources: tmpdir=/data/tmp, job_id=138, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:35:01 2023]
Finished job 78.
234 of 395 steps (59%) done
Select jobs to execute...

[Tue Mar 28 06:35:01 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000219.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000219.ovb, 0-correction/overlap-jobs/000219.stats
    log: 0-correction/overlap-jobs/000219.err
    jobid: 246
    reason: Missing output files: 0-correction/overlap-jobs/000219.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000219
    threads: 8
    resources: tmpdir=/data/tmp, job_id=219, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:48:48 2023]
Finished job 277.
235 of 395 steps (59%) done
Select jobs to execute...

[Tue Mar 28 06:48:48 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000082.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000082.ovb, 0-correction/overlap-jobs/000082.stats
    log: 0-correction/overlap-jobs/000082.err
    jobid: 109
    reason: Missing output files: 0-correction/overlap-jobs/000082.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000082
    threads: 8
    resources: tmpdir=/data/tmp, job_id=82, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:51:08 2023]
Finished job 134.
236 of 395 steps (60%) done
Select jobs to execute...

[Tue Mar 28 06:51:08 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000100.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000100.ovb, 0-correction/overlap-jobs/000100.stats
    log: 0-correction/overlap-jobs/000100.err
    jobid: 127
    reason: Missing output files: 0-correction/overlap-jobs/000100.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000100
    threads: 8
    resources: tmpdir=/data/tmp, job_id=100, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:51:17 2023]
Finished job 221.
237 of 395 steps (60%) done
Select jobs to execute...

[Tue Mar 28 06:51:17 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000080.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000080.ovb, 0-correction/overlap-jobs/000080.stats
    log: 0-correction/overlap-jobs/000080.err
    jobid: 107
    reason: Missing output files: 0-correction/overlap-jobs/000080.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000080
    threads: 8
    resources: tmpdir=/data/tmp, job_id=80, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:55:00 2023]
Finished job 190.
238 of 395 steps (60%) done
Select jobs to execute...

[Tue Mar 28 06:55:00 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000192.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000192.ovb, 0-correction/overlap-jobs/000192.stats
    log: 0-correction/overlap-jobs/000192.err
    jobid: 219
    reason: Missing output files: 0-correction/overlap-jobs/000192.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000192
    threads: 8
    resources: tmpdir=/data/tmp, job_id=192, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 06:59:41 2023]
Finished job 127.
239 of 395 steps (61%) done
Select jobs to execute...

[Tue Mar 28 06:59:41 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000248.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000248.ovb, 0-correction/overlap-jobs/000248.stats
    log: 0-correction/overlap-jobs/000248.err
    jobid: 275
    reason: Missing output files: 0-correction/overlap-jobs/000248.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000248
    threads: 8
    resources: tmpdir=/data/tmp, job_id=248, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:00:53 2023]
Finished job 165.
240 of 395 steps (61%) done
Select jobs to execute...

[Tue Mar 28 07:00:53 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000073.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000073.ovb, 0-correction/overlap-jobs/000073.stats
    log: 0-correction/overlap-jobs/000073.err
    jobid: 100
    reason: Missing output files: 0-correction/overlap-jobs/000073.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000073
    threads: 8
    resources: tmpdir=/data/tmp, job_id=73, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:08:14 2023]
Finished job 246.
241 of 395 steps (61%) done
Select jobs to execute...

[Tue Mar 28 07:08:14 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000122.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000122.ovb, 0-correction/overlap-jobs/000122.stats
    log: 0-correction/overlap-jobs/000122.err
    jobid: 149
    reason: Missing output files: 0-correction/overlap-jobs/000122.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000122
    threads: 8
    resources: tmpdir=/data/tmp, job_id=122, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:09:25 2023]
Finished job 275.
242 of 395 steps (61%) done
Select jobs to execute...

[Tue Mar 28 07:09:25 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000178.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000178.ovb, 0-correction/overlap-jobs/000178.stats
    log: 0-correction/overlap-jobs/000178.err
    jobid: 205
    reason: Missing output files: 0-correction/overlap-jobs/000178.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000178
    threads: 8
    resources: tmpdir=/data/tmp, job_id=178, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:12:38 2023]
Finished job 107.
243 of 395 steps (62%) done
Select jobs to execute...

[Tue Mar 28 07:12:38 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000066.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000066.ovb, 0-correction/overlap-jobs/000066.stats
    log: 0-correction/overlap-jobs/000066.err
    jobid: 93
    reason: Missing output files: 0-correction/overlap-jobs/000066.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000066
    threads: 8
    resources: tmpdir=/data/tmp, job_id=66, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:17:15 2023]
Finished job 109.
244 of 395 steps (62%) done
Select jobs to execute...

[Tue Mar 28 07:17:16 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000053.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000053.ovb, 0-correction/overlap-jobs/000053.stats
    log: 0-correction/overlap-jobs/000053.err
    jobid: 80
    reason: Missing output files: 0-correction/overlap-jobs/000053.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000053
    threads: 8
    resources: tmpdir=/data/tmp, job_id=53, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:23:32 2023]
Finished job 219.
245 of 395 steps (62%) done
Select jobs to execute...

[Tue Mar 28 07:23:32 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000109.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000109.ovb, 0-correction/overlap-jobs/000109.stats
    log: 0-correction/overlap-jobs/000109.err
    jobid: 136
    reason: Missing output files: 0-correction/overlap-jobs/000109.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000109
    threads: 8
    resources: tmpdir=/data/tmp, job_id=109, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:27:38 2023]
Finished job 80.
246 of 395 steps (62%) done
Select jobs to execute...

[Tue Mar 28 07:27:38 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000165.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000165.ovb, 0-correction/overlap-jobs/000165.stats
    log: 0-correction/overlap-jobs/000165.err
    jobid: 192
    reason: Missing output files: 0-correction/overlap-jobs/000165.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000165
    threads: 8
    resources: tmpdir=/data/tmp, job_id=165, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:29:32 2023]
Finished job 100.
247 of 395 steps (63%) done
Select jobs to execute...

[Tue Mar 28 07:29:32 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000221.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000221.ovb, 0-correction/overlap-jobs/000221.stats
    log: 0-correction/overlap-jobs/000221.err
    jobid: 248
    reason: Missing output files: 0-correction/overlap-jobs/000221.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000221
    threads: 8
    resources: tmpdir=/data/tmp, job_id=221, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:37:54 2023]
Finished job 149.
248 of 395 steps (63%) done
Select jobs to execute...

[Tue Mar 28 07:37:55 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000102.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000102.ovb, 0-correction/overlap-jobs/000102.stats
    log: 0-correction/overlap-jobs/000102.err
    jobid: 129
    reason: Missing output files: 0-correction/overlap-jobs/000102.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000102
    threads: 8
    resources: tmpdir=/data/tmp, job_id=102, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:40:27 2023]
Finished job 93.
249 of 395 steps (63%) done
Select jobs to execute...

[Tue Mar 28 07:40:27 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000214.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000214.ovb, 0-correction/overlap-jobs/000214.stats
    log: 0-correction/overlap-jobs/000214.err
    jobid: 241
    reason: Missing output files: 0-correction/overlap-jobs/000214.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000214
    threads: 8
    resources: tmpdir=/data/tmp, job_id=214, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:40:57 2023]
Finished job 205.
250 of 395 steps (63%) done
Select jobs to execute...

[Tue Mar 28 07:40:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000081.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000081.ovb, 0-correction/overlap-jobs/000081.stats
    log: 0-correction/overlap-jobs/000081.err
    jobid: 108
    reason: Missing output files: 0-correction/overlap-jobs/000081.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000081
    threads: 8
    resources: tmpdir=/data/tmp, job_id=81, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:52:41 2023]
Finished job 136.
251 of 395 steps (64%) done
Select jobs to execute...

[Tue Mar 28 07:52:41 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000137.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000137.ovb, 0-correction/overlap-jobs/000137.stats
    log: 0-correction/overlap-jobs/000137.err
    jobid: 164
    reason: Missing output files: 0-correction/overlap-jobs/000137.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000137
    threads: 8
    resources: tmpdir=/data/tmp, job_id=137, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:53:57 2023]
Finished job 248.
252 of 395 steps (64%) done
Select jobs to execute...

[Tue Mar 28 07:53:57 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000045.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000045.ovb, 0-correction/overlap-jobs/000045.stats
    log: 0-correction/overlap-jobs/000045.err
    jobid: 72
    reason: Missing output files: 0-correction/overlap-jobs/000045.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000045
    threads: 8
    resources: tmpdir=/data/tmp, job_id=45, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 07:59:26 2023]
Finished job 192.
253 of 395 steps (64%) done
Select jobs to execute...

[Tue Mar 28 07:59:26 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000156.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000156.ovb, 0-correction/overlap-jobs/000156.stats
    log: 0-correction/overlap-jobs/000156.err
    jobid: 183
    reason: Missing output files: 0-correction/overlap-jobs/000156.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000156
    threads: 8
    resources: tmpdir=/data/tmp, job_id=156, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:07:18 2023]
Finished job 129.
254 of 395 steps (64%) done
Select jobs to execute...

[Tue Mar 28 08:07:18 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000179.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000179.ovb, 0-correction/overlap-jobs/000179.stats
    log: 0-correction/overlap-jobs/000179.err
    jobid: 206
    reason: Missing output files: 0-correction/overlap-jobs/000179.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000179
    threads: 8
    resources: tmpdir=/data/tmp, job_id=179, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:10:36 2023]
Finished job 108.
255 of 395 steps (65%) done
Select jobs to execute...

[Tue Mar 28 08:10:36 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000067.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000067.ovb, 0-correction/overlap-jobs/000067.stats
    log: 0-correction/overlap-jobs/000067.err
    jobid: 94
    reason: Missing output files: 0-correction/overlap-jobs/000067.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000067
    threads: 8
    resources: tmpdir=/data/tmp, job_id=67, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:12:33 2023]
Finished job 241.
256 of 395 steps (65%) done
Select jobs to execute...

[Tue Mar 28 08:12:33 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000123.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000123.ovb, 0-correction/overlap-jobs/000123.stats
    log: 0-correction/overlap-jobs/000123.err
    jobid: 150
    reason: Missing output files: 0-correction/overlap-jobs/000123.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000123
    threads: 8
    resources: tmpdir=/data/tmp, job_id=123, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:20:10 2023]
Finished job 72.
257 of 395 steps (65%) done
Select jobs to execute...

[Tue Mar 28 08:20:10 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000007.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000007.ovb, 0-correction/overlap-jobs/000007.stats
    log: 0-correction/overlap-jobs/000007.err
    jobid: 34
    reason: Missing output files: 0-correction/overlap-jobs/000007.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000007
    threads: 8
    resources: tmpdir=/data/tmp, job_id=7, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:25:31 2023]
Finished job 164.
258 of 395 steps (65%) done
Select jobs to execute...

[Tue Mar 28 08:25:31 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000247.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000247.ovb, 0-correction/overlap-jobs/000247.stats
    log: 0-correction/overlap-jobs/000247.err
    jobid: 274
    reason: Missing output files: 0-correction/overlap-jobs/000247.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000247
    threads: 8
    resources: tmpdir=/data/tmp, job_id=247, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:29:21 2023]
Finished job 183.
259 of 395 steps (66%) done
Select jobs to execute...

[Tue Mar 28 08:29:21 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000025.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000025.ovb, 0-correction/overlap-jobs/000025.stats
    log: 0-correction/overlap-jobs/000025.err
    jobid: 52
    reason: Missing output files: 0-correction/overlap-jobs/000025.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000025
    threads: 8
    resources: tmpdir=/data/tmp, job_id=25, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:36:19 2023]
Finished job 206.
260 of 395 steps (66%) done
Select jobs to execute...

[Tue Mar 28 08:36:19 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000052.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000052.ovb, 0-correction/overlap-jobs/000052.stats
    log: 0-correction/overlap-jobs/000052.err
    jobid: 79
    reason: Missing output files: 0-correction/overlap-jobs/000052.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000052
    threads: 8
    resources: tmpdir=/data/tmp, job_id=52, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:38:10 2023]
Finished job 34.
261 of 395 steps (66%) done
Select jobs to execute...

[Tue Mar 28 08:38:10 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000074.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000074.ovb, 0-correction/overlap-jobs/000074.stats
    log: 0-correction/overlap-jobs/000074.err
    jobid: 101
    reason: Missing output files: 0-correction/overlap-jobs/000074.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000074
    threads: 8
    resources: tmpdir=/data/tmp, job_id=74, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:40:05 2023]
Finished job 94.
262 of 395 steps (66%) done
Select jobs to execute...

[Tue Mar 28 08:40:05 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000242.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000242.ovb, 0-correction/overlap-jobs/000242.stats
    log: 0-correction/overlap-jobs/000242.err
    jobid: 269
    reason: Missing output files: 0-correction/overlap-jobs/000242.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000242
    threads: 8
    resources: tmpdir=/data/tmp, job_id=242, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:44:39 2023]
Finished job 150.
263 of 395 steps (67%) done
Select jobs to execute...

[Tue Mar 28 08:44:40 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000191.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000191.ovb, 0-correction/overlap-jobs/000191.stats
    log: 0-correction/overlap-jobs/000191.err
    jobid: 218
    reason: Missing output files: 0-correction/overlap-jobs/000191.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000191
    threads: 8
    resources: tmpdir=/data/tmp, job_id=191, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:44:49 2023]
Finished job 52.
264 of 395 steps (67%) done
Select jobs to execute...

[Tue Mar 28 08:44:49 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000023.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000023.ovb, 0-correction/overlap-jobs/000023.stats
    log: 0-correction/overlap-jobs/000023.err
    jobid: 50
    reason: Missing output files: 0-correction/overlap-jobs/000023.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000023
    threads: 8
    resources: tmpdir=/data/tmp, job_id=23, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:50:34 2023]
Finished job 269.
265 of 395 steps (67%) done
Select jobs to execute...

[Tue Mar 28 08:50:34 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000184.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000184.ovb, 0-correction/overlap-jobs/000184.stats
    log: 0-correction/overlap-jobs/000184.err
    jobid: 211
    reason: Missing output files: 0-correction/overlap-jobs/000184.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000184
    threads: 8
    resources: tmpdir=/data/tmp, job_id=184, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:55:06 2023]
Finished job 274.
266 of 395 steps (67%) done
Select jobs to execute...

[Tue Mar 28 08:55:07 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000079.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000079.ovb, 0-correction/overlap-jobs/000079.stats
    log: 0-correction/overlap-jobs/000079.err
    jobid: 106
    reason: Missing output files: 0-correction/overlap-jobs/000079.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000079
    threads: 8
    resources: tmpdir=/data/tmp, job_id=79, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:56:44 2023]
Finished job 50.
267 of 395 steps (68%) done
Select jobs to execute...

[Tue Mar 28 08:56:45 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000135.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000135.ovb, 0-correction/overlap-jobs/000135.stats
    log: 0-correction/overlap-jobs/000135.err
    jobid: 162
    reason: Missing output files: 0-correction/overlap-jobs/000135.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000135
    threads: 8
    resources: tmpdir=/data/tmp, job_id=135, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 08:57:18 2023]
Finished job 101.
268 of 395 steps (68%) done
Select jobs to execute...

[Tue Mar 28 08:57:19 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000072.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000072.ovb, 0-correction/overlap-jobs/000072.stats
    log: 0-correction/overlap-jobs/000072.err
    jobid: 99
    reason: Missing output files: 0-correction/overlap-jobs/000072.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000072
    threads: 8
    resources: tmpdir=/data/tmp, job_id=72, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 09:02:28 2023]
Finished job 218.
269 of 395 steps (68%) done
Select jobs to execute...

[Tue Mar 28 09:02:28 2023]
rule computeOverlaps:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ignoremers, 0-correction/overlap-jobs/000024.params, 0-correction/configureOverlaps.finished
    output: 0-correction/overlap-jobs/000024.ovb, 0-correction/overlap-jobs/000024.stats
    log: 0-correction/overlap-jobs/000024.err
    jobid: 51
    reason: Missing output files: 0-correction/overlap-jobs/000024.ovb; Input files updated by another job: 0-correction/hifi.ignoremers
    wildcards: nnnn=000024
    threads: 8
    resources: tmpdir=/data/tmp, job_id=24, n_cpus=8, mem_gb=32, time_h=24

[Tue Mar 28 09:05:16 2023]
Finished job 79.
270 of 395 steps (68%) done
[Tue Mar 28 09:18:39 2023]
Finished job 211.
271 of 395 steps (69%) done
[Tue Mar 28 09:24:12 2023]
Finished job 106.
272 of 395 steps (69%) done
[Tue Mar 28 09:25:35 2023]
Finished job 162.
273 of 395 steps (69%) done
[Tue Mar 28 09:26:50 2023]
Finished job 99.
274 of 395 steps (69%) done
[Tue Mar 28 09:33:12 2023]
Finished job 51.
275 of 395 steps (70%) done
Select jobs to execute...

[Tue Mar 28 09:33:12 2023]
rule combineOverlapsConfigure:
    input: 0-correction/configureOverlaps.finished, 0-correction/hifi.seqStore, 0-correction/overlap-jobs/000001.ovb, 0-correction/overlap-jobs/000002.ovb, 0-correction/overlap-jobs/000003.ovb, 0-correction/overlap-jobs/000004.ovb, 0-correction/overlap-jobs/000005.ovb, 0-correction/overlap-jobs/000006.ovb, 0-correction/overlap-jobs/000007.ovb, 0-correction/overlap-jobs/000008.ovb, 0-correction/overlap-jobs/000009.ovb, 0-correction/overlap-jobs/000010.ovb, 0-correction/overlap-jobs/000011.ovb, 0-correction/overlap-jobs/000012.ovb, 0-correction/overlap-jobs/000013.ovb, 0-correction/overlap-jobs/000014.ovb, 0-correction/overlap-jobs/000015.ovb, 0-correction/overlap-jobs/000016.ovb, 0-correction/overlap-jobs/000017.ovb, 0-correction/overlap-jobs/000018.ovb, 0-correction/overlap-jobs/000019.ovb, 0-correction/overlap-jobs/000020.ovb, 0-correction/overlap-jobs/000021.ovb, 0-correction/overlap-jobs/000022.ovb, 0-correction/overlap-jobs/000023.ovb, 0-correction/overlap-jobs/000024.ovb, 0-correction/overlap-jobs/000025.ovb, 0-correction/overlap-jobs/000026.ovb, 0-correction/overlap-jobs/000027.ovb, 0-correction/overlap-jobs/000028.ovb, 0-correction/overlap-jobs/000029.ovb, 0-correction/overlap-jobs/000030.ovb, 0-correction/overlap-jobs/000031.ovb, 0-correction/overlap-jobs/000032.ovb, 0-correction/overlap-jobs/000033.ovb, 0-correction/overlap-jobs/000034.ovb, 0-correction/overlap-jobs/000035.ovb, 0-correction/overlap-jobs/000036.ovb, 0-correction/overlap-jobs/000037.ovb, 0-correction/overlap-jobs/000038.ovb, 0-correction/overlap-jobs/000039.ovb, 0-correction/overlap-jobs/000040.ovb, 0-correction/overlap-jobs/000041.ovb, 0-correction/overlap-jobs/000042.ovb, 0-correction/overlap-jobs/000043.ovb, 0-correction/overlap-jobs/000044.ovb, 0-correction/overlap-jobs/000045.ovb, 0-correction/overlap-jobs/000046.ovb, 0-correction/overlap-jobs/000047.ovb, 0-correction/overlap-jobs/000048.ovb, 0-correction/overlap-jobs/000049.ovb, 0-correction/overlap-jobs/000050.ovb, 0-correction/overlap-jobs/000051.ovb, 0-correction/overlap-jobs/000052.ovb, 0-correction/overlap-jobs/000053.ovb, 0-correction/overlap-jobs/000054.ovb, 0-correction/overlap-jobs/000055.ovb, 0-correction/overlap-jobs/000056.ovb, 0-correction/overlap-jobs/000057.ovb, 0-correction/overlap-jobs/000058.ovb, 0-correction/overlap-jobs/000059.ovb, 0-correction/overlap-jobs/000060.ovb, 0-correction/overlap-jobs/000061.ovb, 0-correction/overlap-jobs/000062.ovb, 0-correction/overlap-jobs/000063.ovb, 0-correction/overlap-jobs/000064.ovb, 0-correction/overlap-jobs/000065.ovb, 0-correction/overlap-jobs/000066.ovb, 0-correction/overlap-jobs/000067.ovb, 0-correction/overlap-jobs/000068.ovb, 0-correction/overlap-jobs/000069.ovb, 0-correction/overlap-jobs/000070.ovb, 0-correction/overlap-jobs/000071.ovb, 0-correction/overlap-jobs/000072.ovb, 0-correction/overlap-jobs/000073.ovb, 0-correction/overlap-jobs/000074.ovb, 0-correction/overlap-jobs/000075.ovb, 0-correction/overlap-jobs/000076.ovb, 0-correction/overlap-jobs/000077.ovb, 0-correction/overlap-jobs/000078.ovb, 0-correction/overlap-jobs/000079.ovb, 0-correction/overlap-jobs/000080.ovb, 0-correction/overlap-jobs/000081.ovb, 0-correction/overlap-jobs/000082.ovb, 0-correction/overlap-jobs/000083.ovb, 0-correction/overlap-jobs/000084.ovb, 0-correction/overlap-jobs/000085.ovb, 0-correction/overlap-jobs/000086.ovb, 0-correction/overlap-jobs/000087.ovb, 0-correction/overlap-jobs/000088.ovb, 0-correction/overlap-jobs/000089.ovb, 0-correction/overlap-jobs/000090.ovb, 0-correction/overlap-jobs/000091.ovb, 0-correction/overlap-jobs/000092.ovb, 0-correction/overlap-jobs/000093.ovb, 0-correction/overlap-jobs/000094.ovb, 0-correction/overlap-jobs/000095.ovb, 0-correction/overlap-jobs/000096.ovb, 0-correction/overlap-jobs/000097.ovb, 0-correction/overlap-jobs/000098.ovb, 0-correction/overlap-jobs/000099.ovb, 0-correction/overlap-jobs/000100.ovb, 0-correction/overlap-jobs/000101.ovb, 0-correction/overlap-jobs/000102.ovb, 0-correction/overlap-jobs/000103.ovb, 0-correction/overlap-jobs/000104.ovb, 0-correction/overlap-jobs/000105.ovb, 0-correction/overlap-jobs/000106.ovb, 0-correction/overlap-jobs/000107.ovb, 0-correction/overlap-jobs/000108.ovb, 0-correction/overlap-jobs/000109.ovb, 0-correction/overlap-jobs/000110.ovb, 0-correction/overlap-jobs/000111.ovb, 0-correction/overlap-jobs/000112.ovb, 0-correction/overlap-jobs/000113.ovb, 0-correction/overlap-jobs/000114.ovb, 0-correction/overlap-jobs/000115.ovb, 0-correction/overlap-jobs/000116.ovb, 0-correction/overlap-jobs/000117.ovb, 0-correction/overlap-jobs/000118.ovb, 0-correction/overlap-jobs/000119.ovb, 0-correction/overlap-jobs/000120.ovb, 0-correction/overlap-jobs/000121.ovb, 0-correction/overlap-jobs/000122.ovb, 0-correction/overlap-jobs/000123.ovb, 0-correction/overlap-jobs/000124.ovb, 0-correction/overlap-jobs/000125.ovb, 0-correction/overlap-jobs/000126.ovb, 0-correction/overlap-jobs/000127.ovb, 0-correction/overlap-jobs/000128.ovb, 0-correction/overlap-jobs/000129.ovb, 0-correction/overlap-jobs/000130.ovb, 0-correction/overlap-jobs/000131.ovb, 0-correction/overlap-jobs/000132.ovb, 0-correction/overlap-jobs/000133.ovb, 0-correction/overlap-jobs/000134.ovb, 0-correction/overlap-jobs/000135.ovb, 0-correction/overlap-jobs/000136.ovb, 0-correction/overlap-jobs/000137.ovb, 0-correction/overlap-jobs/000138.ovb, 0-correction/overlap-jobs/000139.ovb, 0-correction/overlap-jobs/000140.ovb, 0-correction/overlap-jobs/000141.ovb, 0-correction/overlap-jobs/000142.ovb, 0-correction/overlap-jobs/000143.ovb, 0-correction/overlap-jobs/000144.ovb, 0-correction/overlap-jobs/000145.ovb, 0-correction/overlap-jobs/000146.ovb, 0-correction/overlap-jobs/000147.ovb, 0-correction/overlap-jobs/000148.ovb, 0-correction/overlap-jobs/000149.ovb, 0-correction/overlap-jobs/000150.ovb, 0-correction/overlap-jobs/000151.ovb, 0-correction/overlap-jobs/000152.ovb, 0-correction/overlap-jobs/000153.ovb, 0-correction/overlap-jobs/000154.ovb, 0-correction/overlap-jobs/000155.ovb, 0-correction/overlap-jobs/000156.ovb, 0-correction/overlap-jobs/000157.ovb, 0-correction/overlap-jobs/000158.ovb, 0-correction/overlap-jobs/000159.ovb, 0-correction/overlap-jobs/000160.ovb, 0-correction/overlap-jobs/000161.ovb, 0-correction/overlap-jobs/000162.ovb, 0-correction/overlap-jobs/000163.ovb, 0-correction/overlap-jobs/000164.ovb, 0-correction/overlap-jobs/000165.ovb, 0-correction/overlap-jobs/000166.ovb, 0-correction/overlap-jobs/000167.ovb, 0-correction/overlap-jobs/000168.ovb, 0-correction/overlap-jobs/000169.ovb, 0-correction/overlap-jobs/000170.ovb, 0-correction/overlap-jobs/000171.ovb, 0-correction/overlap-jobs/000172.ovb, 0-correction/overlap-jobs/000173.ovb, 0-correction/overlap-jobs/000174.ovb, 0-correction/overlap-jobs/000175.ovb, 0-correction/overlap-jobs/000176.ovb, 0-correction/overlap-jobs/000177.ovb, 0-correction/overlap-jobs/000178.ovb, 0-correction/overlap-jobs/000179.ovb, 0-correction/overlap-jobs/000180.ovb, 0-correction/overlap-jobs/000181.ovb, 0-correction/overlap-jobs/000182.ovb, 0-correction/overlap-jobs/000183.ovb, 0-correction/overlap-jobs/000184.ovb, 0-correction/overlap-jobs/000185.ovb, 0-correction/overlap-jobs/000186.ovb, 0-correction/overlap-jobs/000187.ovb, 0-correction/overlap-jobs/000188.ovb, 0-correction/overlap-jobs/000189.ovb, 0-correction/overlap-jobs/000190.ovb, 0-correction/overlap-jobs/000191.ovb, 0-correction/overlap-jobs/000192.ovb, 0-correction/overlap-jobs/000193.ovb, 0-correction/overlap-jobs/000194.ovb, 0-correction/overlap-jobs/000195.ovb, 0-correction/overlap-jobs/000196.ovb, 0-correction/overlap-jobs/000197.ovb, 0-correction/overlap-jobs/000198.ovb, 0-correction/overlap-jobs/000199.ovb, 0-correction/overlap-jobs/000200.ovb, 0-correction/overlap-jobs/000201.ovb, 0-correction/overlap-jobs/000202.ovb, 0-correction/overlap-jobs/000203.ovb, 0-correction/overlap-jobs/000204.ovb, 0-correction/overlap-jobs/000205.ovb, 0-correction/overlap-jobs/000206.ovb, 0-correction/overlap-jobs/000207.ovb, 0-correction/overlap-jobs/000208.ovb, 0-correction/overlap-jobs/000209.ovb, 0-correction/overlap-jobs/000210.ovb, 0-correction/overlap-jobs/000211.ovb, 0-correction/overlap-jobs/000212.ovb, 0-correction/overlap-jobs/000213.ovb, 0-correction/overlap-jobs/000214.ovb, 0-correction/overlap-jobs/000215.ovb, 0-correction/overlap-jobs/000216.ovb, 0-correction/overlap-jobs/000217.ovb, 0-correction/overlap-jobs/000218.ovb, 0-correction/overlap-jobs/000219.ovb, 0-correction/overlap-jobs/000220.ovb, 0-correction/overlap-jobs/000221.ovb, 0-correction/overlap-jobs/000222.ovb, 0-correction/overlap-jobs/000223.ovb, 0-correction/overlap-jobs/000224.ovb, 0-correction/overlap-jobs/000225.ovb, 0-correction/overlap-jobs/000226.ovb, 0-correction/overlap-jobs/000227.ovb, 0-correction/overlap-jobs/000228.ovb, 0-correction/overlap-jobs/000229.ovb, 0-correction/overlap-jobs/000230.ovb, 0-correction/overlap-jobs/000231.ovb, 0-correction/overlap-jobs/000232.ovb, 0-correction/overlap-jobs/000233.ovb, 0-correction/overlap-jobs/000234.ovb, 0-correction/overlap-jobs/000235.ovb, 0-correction/overlap-jobs/000236.ovb, 0-correction/overlap-jobs/000237.ovb, 0-correction/overlap-jobs/000238.ovb, 0-correction/overlap-jobs/000239.ovb, 0-correction/overlap-jobs/000240.ovb, 0-correction/overlap-jobs/000241.ovb, 0-correction/overlap-jobs/000242.ovb, 0-correction/overlap-jobs/000243.ovb, 0-correction/overlap-jobs/000244.ovb, 0-correction/overlap-jobs/000245.ovb, 0-correction/overlap-jobs/000246.ovb, 0-correction/overlap-jobs/000247.ovb, 0-correction/overlap-jobs/000248.ovb, 0-correction/overlap-jobs/000249.ovb, 0-correction/overlap-jobs/000250.ovb, 0-correction/overlap-jobs/000251.ovb, 0-correction/overlap-jobs/000252.ovb, 0-correction/overlap-jobs/000253.ovb, 0-correction/overlap-jobs/000254.ovb, 0-correction/overlap-jobs/000255.ovb, 0-correction/overlap-jobs/000256.ovb, 0-correction/overlap-jobs/000257.ovb, 0-correction/overlap-jobs/000258.ovb, 0-correction/overlap-jobs/000259.ovb, 0-correction/overlap-jobs/000260.ovb, 0-correction/overlap-jobs/000261.ovb, 0-correction/overlap-jobs/000262.ovb, 0-correction/overlap-jobs/000263.ovb, 0-correction/overlap-jobs/000264.ovb, 0-correction/overlap-jobs/000265.ovb, 0-correction/overlap-jobs/000266.ovb
    output: 0-correction/hifi.ovlStore.config, 0-correction/hifi.ovlStore.config.memory-request
    log: 0-correction/combineOverlapsConfigure.err
    jobid: 10
    reason: Missing output files: 0-correction/hifi.ovlStore.config, 0-correction/hifi.ovlStore.config.memory-request; Input files updated by another job: 0-correction/overlap-jobs/000139.ovb, 0-correction/overlap-jobs/000050.ovb, 0-correction/overlap-jobs/000071.ovb, 0-correction/overlap-jobs/000176.ovb, 0-correction/overlap-jobs/000080.ovb, 0-correction/overlap-jobs/000059.ovb, 0-correction/overlap-jobs/000148.ovb, 0-correction/overlap-jobs/000187.ovb, 0-correction/overlap-jobs/000046.ovb, 0-correction/overlap-jobs/000180.ovb, 0-correction/overlap-jobs/000209.ovb, 0-correction/overlap-jobs/000179.ovb, 0-correction/overlap-jobs/000013.ovb, 0-correction/overlap-jobs/000123.ovb, 0-correction/overlap-jobs/000149.ovb, 0-correction/overlap-jobs/000185.ovb, 0-correction/overlap-jobs/000098.ovb, 0-correction/overlap-jobs/000264.ovb, 0-correction/overlap-jobs/000261.ovb, 0-correction/overlap-jobs/000063.ovb, 0-correction/overlap-jobs/000109.ovb, 0-correction/overlap-jobs/000262.ovb, 0-correction/overlap-jobs/000021.ovb, 0-correction/overlap-jobs/000144.ovb, 0-correction/overlap-jobs/000175.ovb, 0-correction/overlap-jobs/000219.ovb, 0-correction/overlap-jobs/000003.ovb, 0-correction/overlap-jobs/000077.ovb, 0-correction/overlap-jobs/000213.ovb, 0-correction/overlap-jobs/000073.ovb, 0-correction/overlap-jobs/000090.ovb, 0-correction/overlap-jobs/000141.ovb, 0-correction/overlap-jobs/000034.ovb, 0-correction/overlap-jobs/000150.ovb, 0-correction/overlap-jobs/000253.ovb, 0-correction/overlap-jobs/000238.ovb, 0-correction/overlap-jobs/000120.ovb, 0-correction/overlap-jobs/000125.ovb, 0-correction/overlap-jobs/000085.ovb, 0-correction/overlap-jobs/000074.ovb, 0-correction/overlap-jobs/000122.ovb, 0-correction/overlap-jobs/000065.ovb, 0-correction/overlap-jobs/000052.ovb, 0-correction/overlap-jobs/000172.ovb, 0-correction/overlap-jobs/000208.ovb, 0-correction/overlap-jobs/000082.ovb, 0-correction/overlap-jobs/000143.ovb, 0-correction/overlap-jobs/000100.ovb, 0-correction/overlap-jobs/000135.ovb, 0-correction/overlap-jobs/000239.ovb, 0-correction/overlap-jobs/000062.ovb, 0-correction/overlap-jobs/000029.ovb, 0-correction/overlap-jobs/000188.ovb, 0-correction/overlap-jobs/000159.ovb, 0-correction/overlap-jobs/000131.ovb, 0-correction/overlap-jobs/000163.ovb, 0-correction/overlap-jobs/000157.ovb, 0-correction/overlap-jobs/000210.ovb, 0-correction/overlap-jobs/000067.ovb, 0-correction/overlap-jobs/000115.ovb, 0-correction/overlap-jobs/000040.ovb, 0-correction/overlap-jobs/000038.ovb, 0-correction/overlap-jobs/000266.ovb, 0-correction/overlap-jobs/000012.ovb, 0-correction/overlap-jobs/000058.ovb, 0-correction/overlap-jobs/000205.ovb, 0-correction/overlap-jobs/000160.ovb, 0-correction/overlap-jobs/000212.ovb, 0-correction/overlap-jobs/000244.ovb, 0-correction/overlap-jobs/000022.ovb, 0-correction/overlap-jobs/000016.ovb, 0-correction/overlap-jobs/000178.ovb, 0-correction/overlap-jobs/000190.ovb, 0-correction/overlap-jobs/000240.ovb, 0-correction/overlap-jobs/000020.ovb, 0-correction/overlap-jobs/000242.ovb, 0-correction/overlap-jobs/000186.ovb, 0-correction/overlap-jobs/000007.ovb, 0-correction/overlap-jobs/000254.ovb, 0-correction/overlap-jobs/000116.ovb, 0-correction/overlap-jobs/000167.ovb, 0-correction/overlap-jobs/000127.ovb, 0-correction/overlap-jobs/000130.ovb, 0-correction/overlap-jobs/000265.ovb, 0-correction/overlap-jobs/000215.ovb, 0-correction/overlap-jobs/000070.ovb, 0-correction/overlap-jobs/000162.ovb, 0-correction/overlap-jobs/000045.ovb, 0-correction/overlap-jobs/000243.ovb, 0-correction/overlap-jobs/000008.ovb, 0-correction/overlap-jobs/000233.ovb, 0-correction/overlap-jobs/000035.ovb, 0-correction/overlap-jobs/000177.ovb, 0-correction/overlap-jobs/000257.ovb, 0-correction/overlap-jobs/000031.ovb, 0-correction/overlap-jobs/000119.ovb, 0-correction/overlap-jobs/000230.ovb, 0-correction/overlap-jobs/000075.ovb, 0-correction/overlap-jobs/000165.ovb, 0-correction/overlap-jobs/000030.ovb, 0-correction/overlap-jobs/000164.ovb, 0-correction/overlap-jobs/000004.ovb, 0-correction/overlap-jobs/000181.ovb, 0-correction/overlap-jobs/000252.ovb, 0-correction/overlap-jobs/000094.ovb, 0-correction/overlap-jobs/000136.ovb, 0-correction/overlap-jobs/000200.ovb, 0-correction/overlap-jobs/000027.ovb, 0-correction/overlap-jobs/000041.ovb, 0-correction/overlap-jobs/000202.ovb, 0-correction/overlap-jobs/000097.ovb, 0-correction/overlap-jobs/000032.ovb, 0-correction/overlap-jobs/000055.ovb, 0-correction/overlap-jobs/000158.ovb, 0-correction/overlap-jobs/000072.ovb, 0-correction/overlap-jobs/000168.ovb, 0-correction/overlap-jobs/000096.ovb, 0-correction/overlap-jobs/000199.ovb, 0-correction/overlap-jobs/000024.ovb, 0-correction/overlap-jobs/000218.ovb, 0-correction/overlap-jobs/000036.ovb, 0-correction/overlap-jobs/000222.ovb, 0-correction/overlap-jobs/000237.ovb, 0-correction/overlap-jobs/000023.ovb, 0-correction/overlap-jobs/000153.ovb, 0-correction/overlap-jobs/000117.ovb, 0-correction/overlap-jobs/000133.ovb, 0-correction/overlap-jobs/000170.ovb, 0-correction/overlap-jobs/000193.ovb, 0-correction/overlap-jobs/000241.ovb, 0-correction/overlap-jobs/000216.ovb, 0-correction/overlap-jobs/000044.ovb, 0-correction/overlap-jobs/000124.ovb, 0-correction/overlap-jobs/000220.ovb, 0-correction/overlap-jobs/000053.ovb, 0-correction/overlap-jobs/000011.ovb, 0-correction/overlap-jobs/000056.ovb, 0-correction/overlap-jobs/000099.ovb, 0-correction/overlap-jobs/000118.ovb, 0-correction/overlap-jobs/000255.ovb, 0-correction/overlap-jobs/000114.ovb, 0-correction/overlap-jobs/000005.ovb, 0-correction/overlap-jobs/000105.ovb, 0-correction/overlap-jobs/000083.ovb, 0-correction/overlap-jobs/000224.ovb, 0-correction/overlap-jobs/000142.ovb, 0-correction/overlap-jobs/000171.ovb, 0-correction/overlap-jobs/000028.ovb, 0-correction/overlap-jobs/000245.ovb, 0-correction/overlap-jobs/000260.ovb, 0-correction/overlap-jobs/000235.ovb, 0-correction/overlap-jobs/000093.ovb, 0-correction/overlap-jobs/000169.ovb, 0-correction/overlap-jobs/000095.ovb, 0-correction/overlap-jobs/000152.ovb, 0-correction/overlap-jobs/000248.ovb, 0-correction/overlap-jobs/000196.ovb, 0-correction/overlap-jobs/000069.ovb, 0-correction/overlap-jobs/000068.ovb, 0-correction/overlap-jobs/000156.ovb, 0-correction/overlap-jobs/000198.ovb, 0-correction/overlap-jobs/000228.ovb, 0-correction/overlap-jobs/000106.ovb, 0-correction/overlap-jobs/000236.ovb, 0-correction/overlap-jobs/000042.ovb, 0-correction/overlap-jobs/000084.ovb, 0-correction/overlap-jobs/000140.ovb, 0-correction/overlap-jobs/000192.ovb, 0-correction/overlap-jobs/000018.ovb, 0-correction/overlap-jobs/000037.ovb, 0-correction/overlap-jobs/000108.ovb, 0-correction/overlap-jobs/000182.ovb, 0-correction/overlap-jobs/000145.ovb, 0-correction/overlap-jobs/000174.ovb, 0-correction/overlap-jobs/000066.ovb, 0-correction/overlap-jobs/000203.ovb, 0-correction/overlap-jobs/000033.ovb, 0-correction/overlap-jobs/000006.ovb, 0-correction/overlap-jobs/000250.ovb, 0-correction/overlap-jobs/000019.ovb, 0-correction/overlap-jobs/000137.ovb, 0-correction/overlap-jobs/000247.ovb, 0-correction/overlap-jobs/000102.ovb, 0-correction/overlap-jobs/000154.ovb, 0-correction/overlap-jobs/000223.ovb, 0-correction/overlap-jobs/000251.ovb, 0-correction/overlap-jobs/000049.ovb, 0-correction/overlap-jobs/000089.ovb, 0-correction/overlap-jobs/000161.ovb, 0-correction/overlap-jobs/000183.ovb, 0-correction/overlap-jobs/000001.ovb, 0-correction/overlap-jobs/000146.ovb, 0-correction/overlap-jobs/000132.ovb, 0-correction/overlap-jobs/000103.ovb, 0-correction/overlap-jobs/000147.ovb, 0-correction/overlap-jobs/000043.ovb, 0-correction/overlap-jobs/000173.ovb, 0-correction/overlap-jobs/000211.ovb, 0-correction/overlap-jobs/000221.ovb, 0-correction/overlap-jobs/000138.ovb, 0-correction/overlap-jobs/000092.ovb, 0-correction/overlap-jobs/000121.ovb, 0-correction/overlap-jobs/000047.ovb, 0-correction/overlap-jobs/000134.ovb, 0-correction/overlap-jobs/000009.ovb, 0-correction/overlap-jobs/000234.ovb, 0-correction/overlap-jobs/000214.ovb, 0-correction/overlap-jobs/000227.ovb, 0-correction/overlap-jobs/000112.ovb, 0-correction/overlap-jobs/000207.ovb, 0-correction/overlap-jobs/000091.ovb, 0-correction/overlap-jobs/000258.ovb, 0-correction/overlap-jobs/000259.ovb, 0-correction/overlap-jobs/000104.ovb, 0-correction/overlap-jobs/000002.ovb, 0-correction/overlap-jobs/000232.ovb, 0-correction/overlap-jobs/000039.ovb, 0-correction/overlap-jobs/000206.ovb, 0-correction/overlap-jobs/000076.ovb, 0-correction/overlap-jobs/000189.ovb, 0-correction/overlap-jobs/000064.ovb, 0-correction/overlap-jobs/000101.ovb, 0-correction/overlap-jobs/000111.ovb, 0-correction/overlap-jobs/000197.ovb, 0-correction/overlap-jobs/000246.ovb, 0-correction/overlap-jobs/000017.ovb, 0-correction/overlap-jobs/000107.ovb, 0-correction/overlap-jobs/000217.ovb, 0-correction/overlap-jobs/000088.ovb, 0-correction/overlap-jobs/000263.ovb, 0-correction/overlap-jobs/000010.ovb, 0-correction/overlap-jobs/000128.ovb, 0-correction/overlap-jobs/000126.ovb, 0-correction/overlap-jobs/000129.ovb, 0-correction/overlap-jobs/000191.ovb, 0-correction/overlap-jobs/000113.ovb, 0-correction/overlap-jobs/000051.ovb, 0-correction/overlap-jobs/000087.ovb, 0-correction/overlap-jobs/000014.ovb, 0-correction/overlap-jobs/000079.ovb, 0-correction/overlap-jobs/000048.ovb, 0-correction/overlap-jobs/000054.ovb, 0-correction/overlap-jobs/000086.ovb, 0-correction/overlap-jobs/000015.ovb, 0-correction/overlap-jobs/000078.ovb, 0-correction/overlap-jobs/000110.ovb, 0-correction/overlap-jobs/000061.ovb, 0-correction/overlap-jobs/000194.ovb, 0-correction/overlap-jobs/000256.ovb, 0-correction/overlap-jobs/000151.ovb, 0-correction/overlap-jobs/000201.ovb, 0-correction/overlap-jobs/000225.ovb, 0-correction/overlap-jobs/000026.ovb, 0-correction/overlap-jobs/000226.ovb, 0-correction/overlap-jobs/000249.ovb, 0-correction/overlap-jobs/000231.ovb, 0-correction/overlap-jobs/000195.ovb, 0-correction/overlap-jobs/000204.ovb, 0-correction/overlap-jobs/000184.ovb, 0-correction/overlap-jobs/000057.ovb, 0-correction/overlap-jobs/000229.ovb, 0-correction/overlap-jobs/000025.ovb, 0-correction/overlap-jobs/000060.ovb, 0-correction/overlap-jobs/000155.ovb, 0-correction/overlap-jobs/000081.ovb, 0-correction/overlap-jobs/000166.ovb
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=128, time_h=12

[Tue Mar 28 09:33:25 2023]
Finished job 10.
276 of 395 steps (70%) done
Select jobs to execute...

[Tue Mar 28 09:33:25 2023]
rule combineOverlaps:
    input: 0-correction/configureOverlaps.finished, 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore.config, 0-correction/hifi.ovlStore.config.memory-request
    output: 0-correction/hifi.ovlStore
    log: 0-correction/combineOverlaps.err
    jobid: 8
    reason: Missing output files: 0-correction/hifi.ovlStore; Input files updated by another job: 0-correction/hifi.ovlStore.config, 0-correction/hifi.ovlStore.config.memory-request
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=7, time_h=12

[Tue Mar 28 09:35:39 2023]
Finished job 8.
277 of 395 steps (70%) done
Select jobs to execute...

[Tue Mar 28 09:35:39 2023]
localcheckpoint configureFindErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore
    output: 0-correction/configureFindErrors.finished
    log: 0-correction/configureFindErrors.err
    jobid: 11
    reason: Missing output files: 0-correction/configureFindErrors.finished; Input files updated by another job: 0-correction/hifi.ovlStore, 0-correction/hifi.seqStore
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=1, time_h=1
DAG of jobs will be updated after completion.

[Tue Mar 28 09:35:45 2023]
Finished job 11.
278 of 395 steps (70%) done
Select jobs to execute...

[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0051.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0051.red
    log: 0-correction/find-errors-jobs/0051.err
    jobid: 451
    reason: Missing output files: 0-correction/find-errors-jobs/0051.red
    wildcards: nnnn=0051
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0275.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0275.red
    log: 0-correction/find-errors-jobs/0275.err
    jobid: 675
    reason: Missing output files: 0-correction/find-errors-jobs/0275.red
    wildcards: nnnn=0275
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0107.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0107.red
    log: 0-correction/find-errors-jobs/0107.err
    jobid: 507
    reason: Missing output files: 0-correction/find-errors-jobs/0107.red
    wildcards: nnnn=0107
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0163.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0163.red
    log: 0-correction/find-errors-jobs/0163.err
    jobid: 563
    reason: Missing output files: 0-correction/find-errors-jobs/0163.red
    wildcards: nnnn=0163
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0219.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0219.red
    log: 0-correction/find-errors-jobs/0219.err
    jobid: 619
    reason: Missing output files: 0-correction/find-errors-jobs/0219.red
    wildcards: nnnn=0219
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0024.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0024.red
    log: 0-correction/find-errors-jobs/0024.err
    jobid: 424
    reason: Missing output files: 0-correction/find-errors-jobs/0024.red
    wildcards: nnnn=0024
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0080.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0080.red
    log: 0-correction/find-errors-jobs/0080.err
    jobid: 480
    reason: Missing output files: 0-correction/find-errors-jobs/0080.red
    wildcards: nnnn=0080
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0113.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0113.red
    log: 0-correction/find-errors-jobs/0113.err
    jobid: 513
    reason: Missing output files: 0-correction/find-errors-jobs/0113.red
    wildcards: nnnn=0113
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0192.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0192.red
    log: 0-correction/find-errors-jobs/0192.err
    jobid: 592
    reason: Missing output files: 0-correction/find-errors-jobs/0192.red
    wildcards: nnnn=0192
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0136.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0136.red
    log: 0-correction/find-errors-jobs/0136.err
    jobid: 536
    reason: Missing output files: 0-correction/find-errors-jobs/0136.red
    wildcards: nnnn=0136
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0248.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0248.red
    log: 0-correction/find-errors-jobs/0248.err
    jobid: 648
    reason: Missing output files: 0-correction/find-errors-jobs/0248.red
    wildcards: nnnn=0248
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4


[Tue Mar 28 09:35:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0052.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0052.red
    log: 0-correction/find-errors-jobs/0052.err
    jobid: 452
    reason: Missing output files: 0-correction/find-errors-jobs/0052.red
    wildcards: nnnn=0052
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:41:56 2023]
Finished job 563.
279 of 695 steps (40%) done
Select jobs to execute...

[Tue Mar 28 09:41:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0210.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0210.red
    log: 0-correction/find-errors-jobs/0210.err
    jobid: 610
    reason: Missing output files: 0-correction/find-errors-jobs/0210.red
    wildcards: nnnn=0210
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:00 2023]
Finished job 480.
280 of 695 steps (40%) done
Select jobs to execute...

[Tue Mar 28 09:42:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0015.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0015.red
    log: 0-correction/find-errors-jobs/0015.err
    jobid: 415
    reason: Missing output files: 0-correction/find-errors-jobs/0015.red
    wildcards: nnnn=0015
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:18 2023]
Finished job 424.
281 of 695 steps (40%) done
Select jobs to execute...

[Tue Mar 28 09:42:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0071.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0071.red
    log: 0-correction/find-errors-jobs/0071.err
    jobid: 471
    reason: Missing output files: 0-correction/find-errors-jobs/0071.red
    wildcards: nnnn=0071
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:18 2023]
Finished job 452.
282 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0112.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0112.red
    log: 0-correction/find-errors-jobs/0112.err
    jobid: 512
    reason: Missing output files: 0-correction/find-errors-jobs/0112.red
    wildcards: nnnn=0112
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:19 2023]
Finished job 675.
283 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0224.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0224.red
    log: 0-correction/find-errors-jobs/0224.err
    jobid: 624
    reason: Missing output files: 0-correction/find-errors-jobs/0224.red
    wildcards: nnnn=0224
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:22 2023]
Finished job 451.
284 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0028.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0028.red
    log: 0-correction/find-errors-jobs/0028.err
    jobid: 428
    reason: Missing output files: 0-correction/find-errors-jobs/0028.red
    wildcards: nnnn=0028
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:23 2023]
Finished job 513.
285 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:23 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0140.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0140.red
    log: 0-correction/find-errors-jobs/0140.err
    jobid: 540
    reason: Missing output files: 0-correction/find-errors-jobs/0140.red
    wildcards: nnnn=0140
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:26 2023]
Finished job 619.
286 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:26 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0239.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0239.red
    log: 0-correction/find-errors-jobs/0239.err
    jobid: 639
    reason: Missing output files: 0-correction/find-errors-jobs/0239.red
    wildcards: nnnn=0239
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:26 2023]
Finished job 592.
287 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:27 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0043.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0043.red
    log: 0-correction/find-errors-jobs/0043.err
    jobid: 443
    reason: Missing output files: 0-correction/find-errors-jobs/0043.red
    wildcards: nnnn=0043
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:33 2023]
Finished job 648.
288 of 695 steps (41%) done
Select jobs to execute...

[Tue Mar 28 09:42:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0127.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0127.red
    log: 0-correction/find-errors-jobs/0127.err
    jobid: 527
    reason: Missing output files: 0-correction/find-errors-jobs/0127.red
    wildcards: nnnn=0127
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:35 2023]
Finished job 536.
289 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:42:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0155.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0155.red
    log: 0-correction/find-errors-jobs/0155.err
    jobid: 555
    reason: Missing output files: 0-correction/find-errors-jobs/0155.red
    wildcards: nnnn=0155
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:42:36 2023]
Finished job 507.
290 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:42:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0295.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0295.red
    log: 0-correction/find-errors-jobs/0295.err
    jobid: 695
    reason: Missing output files: 0-correction/find-errors-jobs/0295.red
    wildcards: nnnn=0295
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:22 2023]
Finished job 415.
291 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:48:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0267.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0267.red
    log: 0-correction/find-errors-jobs/0267.err
    jobid: 667
    reason: Missing output files: 0-correction/find-errors-jobs/0267.red
    wildcards: nnnn=0267
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:29 2023]
Finished job 428.
292 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:48:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0099.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0099.red
    log: 0-correction/find-errors-jobs/0099.err
    jobid: 499
    reason: Missing output files: 0-correction/find-errors-jobs/0099.red
    wildcards: nnnn=0099
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:35 2023]
Finished job 471.
293 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:48:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0211.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0211.red
    log: 0-correction/find-errors-jobs/0211.err
    jobid: 611
    reason: Missing output files: 0-correction/find-errors-jobs/0211.red
    wildcards: nnnn=0211
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:35 2023]
Finished job 610.
294 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:48:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0183.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0183.red
    log: 0-correction/find-errors-jobs/0183.err
    jobid: 583
    reason: Missing output files: 0-correction/find-errors-jobs/0183.red
    wildcards: nnnn=0183
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:41 2023]
Finished job 540.
295 of 695 steps (42%) done
Select jobs to execute...

[Tue Mar 28 09:48:41 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0016.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0016.red
    log: 0-correction/find-errors-jobs/0016.err
    jobid: 416
    reason: Missing output files: 0-correction/find-errors-jobs/0016.red
    wildcards: nnnn=0016
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:46 2023]
Finished job 512.
296 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:48:46 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0297.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0297.red
    log: 0-correction/find-errors-jobs/0297.err
    jobid: 697
    reason: Missing output files: 0-correction/find-errors-jobs/0297.red
    wildcards: nnnn=0297
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:48 2023]
Finished job 443.
297 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:48:48 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0129.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0129.red
    log: 0-correction/find-errors-jobs/0129.err
    jobid: 529
    reason: Missing output files: 0-correction/find-errors-jobs/0129.red
    wildcards: nnnn=0129
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:51 2023]
Finished job 555.
298 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:48:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0185.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0185.red
    log: 0-correction/find-errors-jobs/0185.err
    jobid: 585
    reason: Missing output files: 0-correction/find-errors-jobs/0185.red
    wildcards: nnnn=0185
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:48:58 2023]
Finished job 639.
299 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:48:58 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0241.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0241.red
    log: 0-correction/find-errors-jobs/0241.err
    jobid: 641
    reason: Missing output files: 0-correction/find-errors-jobs/0241.red
    wildcards: nnnn=0241
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:49:01 2023]
Finished job 624.
300 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:49:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0045.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0045.red
    log: 0-correction/find-errors-jobs/0045.err
    jobid: 445
    reason: Missing output files: 0-correction/find-errors-jobs/0045.red
    wildcards: nnnn=0045
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:49:05 2023]
Finished job 527.
301 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:49:05 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0157.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0157.red
    log: 0-correction/find-errors-jobs/0157.err
    jobid: 557
    reason: Missing output files: 0-correction/find-errors-jobs/0157.red
    wildcards: nnnn=0157
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:49:12 2023]
Finished job 695.
302 of 695 steps (43%) done
Select jobs to execute...

[Tue Mar 28 09:49:12 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0073.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0073.red
    log: 0-correction/find-errors-jobs/0073.err
    jobid: 473
    reason: Missing output files: 0-correction/find-errors-jobs/0073.red
    wildcards: nnnn=0073
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:54:44 2023]
Finished job 499.
303 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:54:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0269.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0269.red
    log: 0-correction/find-errors-jobs/0269.err
    jobid: 669
    reason: Missing output files: 0-correction/find-errors-jobs/0269.red
    wildcards: nnnn=0269
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:54:53 2023]
Finished job 416.
304 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:54:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0017.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0017.red
    log: 0-correction/find-errors-jobs/0017.err
    jobid: 417
    reason: Missing output files: 0-correction/find-errors-jobs/0017.red
    wildcards: nnnn=0017
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:54:57 2023]
Finished job 667.
305 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:54:57 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0101.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0101.red
    log: 0-correction/find-errors-jobs/0101.err
    jobid: 501
    reason: Missing output files: 0-correction/find-errors-jobs/0101.red
    wildcards: nnnn=0101
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:06 2023]
Finished job 583.
306 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:55:06 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0212.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0212.red
    log: 0-correction/find-errors-jobs/0212.err
    jobid: 612
    reason: Missing output files: 0-correction/find-errors-jobs/0212.red
    wildcards: nnnn=0212
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:12 2023]
Finished job 445.
307 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:55:12 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0213.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0213.red
    log: 0-correction/find-errors-jobs/0213.err
    jobid: 613
    reason: Missing output files: 0-correction/find-errors-jobs/0213.red
    wildcards: nnnn=0213
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:12 2023]
Finished job 611.
308 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:55:12 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0018.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0018.red
    log: 0-correction/find-errors-jobs/0018.err
    jobid: 418
    reason: Missing output files: 0-correction/find-errors-jobs/0018.red
    wildcards: nnnn=0018
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:13 2023]
Finished job 529.
309 of 695 steps (44%) done
Select jobs to execute...

[Tue Mar 28 09:55:13 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0074.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0074.red
    log: 0-correction/find-errors-jobs/0074.err
    jobid: 474
    reason: Missing output files: 0-correction/find-errors-jobs/0074.red
    wildcards: nnnn=0074
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:19 2023]
Finished job 473.
310 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 09:55:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0100.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0100.red
    log: 0-correction/find-errors-jobs/0100.err
    jobid: 500
    reason: Missing output files: 0-correction/find-errors-jobs/0100.red
    wildcards: nnnn=0100
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:21 2023]
Finished job 585.
311 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 09:55:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0186.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0186.red
    log: 0-correction/find-errors-jobs/0186.err
    jobid: 586
    reason: Missing output files: 0-correction/find-errors-jobs/0186.red
    wildcards: nnnn=0186
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:29 2023]
Finished job 697.
312 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 09:55:30 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0268.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0268.red
    log: 0-correction/find-errors-jobs/0268.err
    jobid: 668
    reason: Missing output files: 0-correction/find-errors-jobs/0268.red
    wildcards: nnnn=0268
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:34 2023]
Finished job 557.
313 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 09:55:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0298.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0298.red
    log: 0-correction/find-errors-jobs/0298.err
    jobid: 698
    reason: Missing output files: 0-correction/find-errors-jobs/0298.red
    wildcards: nnnn=0298
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 09:55:41 2023]
Finished job 641.
314 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 09:55:42 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0156.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0156.red
    log: 0-correction/find-errors-jobs/0156.err
    jobid: 556
    reason: Missing output files: 0-correction/find-errors-jobs/0156.red
    wildcards: nnnn=0156
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:00:58 2023]
Finished job 417.
315 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 10:00:58 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0130.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0130.red
    log: 0-correction/find-errors-jobs/0130.err
    jobid: 530
    reason: Missing output files: 0-correction/find-errors-jobs/0130.red
    wildcards: nnnn=0130
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:02 2023]
Finished job 501.
316 of 695 steps (45%) done
Select jobs to execute...

[Tue Mar 28 10:01:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0242.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0242.red
    log: 0-correction/find-errors-jobs/0242.err
    jobid: 642
    reason: Missing output files: 0-correction/find-errors-jobs/0242.red
    wildcards: nnnn=0242
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:12 2023]
Finished job 669.
317 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:12 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0046.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0046.red
    log: 0-correction/find-errors-jobs/0046.err
    jobid: 446
    reason: Missing output files: 0-correction/find-errors-jobs/0046.red
    wildcards: nnnn=0046
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:15 2023]
Finished job 418.
318 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:15 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0044.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0044.red
    log: 0-correction/find-errors-jobs/0044.err
    jobid: 444
    reason: Missing output files: 0-correction/find-errors-jobs/0044.red
    wildcards: nnnn=0044
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:18 2023]
Finished job 612.
319 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0158.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0158.red
    log: 0-correction/find-errors-jobs/0158.err
    jobid: 558
    reason: Missing output files: 0-correction/find-errors-jobs/0158.red
    wildcards: nnnn=0158
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:18 2023]
Finished job 500.
320 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0240.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0240.red
    log: 0-correction/find-errors-jobs/0240.err
    jobid: 640
    reason: Missing output files: 0-correction/find-errors-jobs/0240.red
    wildcards: nnnn=0240
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:40 2023]
Finished job 474.
321 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0270.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0270.red
    log: 0-correction/find-errors-jobs/0270.err
    jobid: 670
    reason: Missing output files: 0-correction/find-errors-jobs/0270.red
    wildcards: nnnn=0270
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:51 2023]
Finished job 613.
322 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0252.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0252.red
    log: 0-correction/find-errors-jobs/0252.err
    jobid: 652
    reason: Missing output files: 0-correction/find-errors-jobs/0252.red
    wildcards: nnnn=0252
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:52 2023]
Finished job 556.
323 of 695 steps (46%) done
Select jobs to execute...

[Tue Mar 28 10:01:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0084.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0084.red
    log: 0-correction/find-errors-jobs/0084.err
    jobid: 484
    reason: Missing output files: 0-correction/find-errors-jobs/0084.red
    wildcards: nnnn=0084
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:01:53 2023]
Finished job 586.
324 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:01:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0196.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0196.red
    log: 0-correction/find-errors-jobs/0196.err
    jobid: 596
    reason: Missing output files: 0-correction/find-errors-jobs/0196.red
    wildcards: nnnn=0196
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:02:10 2023]
Finished job 668.
325 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:02:10 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0057.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0057.red
    log: 0-correction/find-errors-jobs/0057.err
    jobid: 457
    reason: Missing output files: 0-correction/find-errors-jobs/0057.red
    wildcards: nnnn=0057
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:02:31 2023]
Finished job 698.
326 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:02:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0075.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0075.red
    log: 0-correction/find-errors-jobs/0075.err
    jobid: 475
    reason: Missing output files: 0-correction/find-errors-jobs/0075.red
    wildcards: nnnn=0075
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:12 2023]
Finished job 446.
327 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:07:13 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0187.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0187.red
    log: 0-correction/find-errors-jobs/0187.err
    jobid: 587
    reason: Missing output files: 0-correction/find-errors-jobs/0187.red
    wildcards: nnnn=0187
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:15 2023]
Finished job 642.
328 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:07:15 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0019.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0019.red
    log: 0-correction/find-errors-jobs/0019.err
    jobid: 419
    reason: Missing output files: 0-correction/find-errors-jobs/0019.red
    wildcards: nnnn=0019
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:21 2023]
Finished job 444.
329 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:07:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0299.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0299.red
    log: 0-correction/find-errors-jobs/0299.err
    jobid: 699
    reason: Missing output files: 0-correction/find-errors-jobs/0299.red
    wildcards: nnnn=0299
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:25 2023]
Finished job 558.
330 of 695 steps (47%) done
Select jobs to execute...

[Tue Mar 28 10:07:25 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0214.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0214.red
    log: 0-correction/find-errors-jobs/0214.err
    jobid: 614
    reason: Missing output files: 0-correction/find-errors-jobs/0214.red
    wildcards: nnnn=0214
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:25 2023]
Finished job 530.
331 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:07:25 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0131.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0131.red
    log: 0-correction/find-errors-jobs/0131.err
    jobid: 531
    reason: Missing output files: 0-correction/find-errors-jobs/0131.red
    wildcards: nnnn=0131
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:07:41 2023]
Finished job 640.
332 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:07:41 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0243.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0243.red
    log: 0-correction/find-errors-jobs/0243.err
    jobid: 643
    reason: Missing output files: 0-correction/find-errors-jobs/0243.red
    wildcards: nnnn=0243
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:11 2023]
Finished job 484.
333 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:08:11 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0271.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0271.red
    log: 0-correction/find-errors-jobs/0271.err
    jobid: 671
    reason: Missing output files: 0-correction/find-errors-jobs/0271.red
    wildcards: nnnn=0271
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:16 2023]
Finished job 652.
334 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:08:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0102.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0102.red
    log: 0-correction/find-errors-jobs/0102.err
    jobid: 502
    reason: Missing output files: 0-correction/find-errors-jobs/0102.red
    wildcards: nnnn=0102
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:19 2023]
Finished job 670.
335 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:08:20 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0159.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0159.red
    log: 0-correction/find-errors-jobs/0159.err
    jobid: 559
    reason: Missing output files: 0-correction/find-errors-jobs/0159.red
    wildcards: nnnn=0159
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:20 2023]
Finished job 475.
336 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:08:20 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0128.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0128.red
    log: 0-correction/find-errors-jobs/0128.err
    jobid: 528
    reason: Missing output files: 0-correction/find-errors-jobs/0128.red
    wildcards: nnnn=0128
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:20 2023]
Finished job 457.
337 of 695 steps (48%) done
Select jobs to execute...

[Tue Mar 28 10:08:20 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0047.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0047.red
    log: 0-correction/find-errors-jobs/0047.err
    jobid: 447
    reason: Missing output files: 0-correction/find-errors-jobs/0047.red
    wildcards: nnnn=0047
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:08:34 2023]
Finished job 596.
338 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:08:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0296.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0296.red
    log: 0-correction/find-errors-jobs/0296.err
    jobid: 696
    reason: Missing output files: 0-correction/find-errors-jobs/0296.red
    wildcards: nnnn=0296
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:13:07 2023]
Finished job 419.
339 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:13:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0103.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0103.red
    log: 0-correction/find-errors-jobs/0103.err
    jobid: 503
    reason: Missing output files: 0-correction/find-errors-jobs/0103.red
    wildcards: nnnn=0103
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:13:38 2023]
Finished job 699.
340 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:13:38 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0215.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0215.red
    log: 0-correction/find-errors-jobs/0215.err
    jobid: 615
    reason: Missing output files: 0-correction/find-errors-jobs/0215.red
    wildcards: nnnn=0215
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:13:41 2023]
Finished job 587.
341 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:13:41 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0020.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0020.red
    log: 0-correction/find-errors-jobs/0020.err
    jobid: 420
    reason: Missing output files: 0-correction/find-errors-jobs/0020.red
    wildcards: nnnn=0020
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:13:55 2023]
Finished job 614.
342 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:13:55 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0184.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0184.red
    log: 0-correction/find-errors-jobs/0184.err
    jobid: 584
    reason: Missing output files: 0-correction/find-errors-jobs/0184.red
    wildcards: nnnn=0184
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:13:59 2023]
Finished job 643.
343 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:14:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0076.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0076.red
    log: 0-correction/find-errors-jobs/0076.err
    jobid: 476
    reason: Missing output files: 0-correction/find-errors-jobs/0076.red
    wildcards: nnnn=0076
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:00 2023]
Finished job 531.
344 of 695 steps (49%) done
Select jobs to execute...

[Tue Mar 28 10:14:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0072.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0072.red
    log: 0-correction/find-errors-jobs/0072.err
    jobid: 472
    reason: Missing output files: 0-correction/find-errors-jobs/0072.red
    wildcards: nnnn=0072
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:02 2023]
Finished job 502.
345 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:14:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0188.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0188.red
    log: 0-correction/find-errors-jobs/0188.err
    jobid: 588
    reason: Missing output files: 0-correction/find-errors-jobs/0188.red
    wildcards: nnnn=0188
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:35 2023]
Finished job 447.
346 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:14:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0098.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0098.red
    log: 0-correction/find-errors-jobs/0098.err
    jobid: 498
    reason: Missing output files: 0-correction/find-errors-jobs/0098.red
    wildcards: nnnn=0098
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:38 2023]
Finished job 559.
347 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:14:38 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0300.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0300.red
    log: 0-correction/find-errors-jobs/0300.err
    jobid: 700
    reason: Missing output files: 0-correction/find-errors-jobs/0300.red
    wildcards: nnnn=0300
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:53 2023]
Finished job 671.
348 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:14:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0132.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0132.red
    log: 0-correction/find-errors-jobs/0132.err
    jobid: 532
    reason: Missing output files: 0-correction/find-errors-jobs/0132.red
    wildcards: nnnn=0132
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:14:56 2023]
Finished job 528.
349 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:14:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0244.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0244.red
    log: 0-correction/find-errors-jobs/0244.err
    jobid: 644
    reason: Missing output files: 0-correction/find-errors-jobs/0244.red
    wildcards: nnnn=0244
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:15:07 2023]
Finished job 696.
350 of 695 steps (50%) done
Select jobs to execute...

[Tue Mar 28 10:15:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0266.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0266.red
    log: 0-correction/find-errors-jobs/0266.err
    jobid: 666
    reason: Missing output files: 0-correction/find-errors-jobs/0266.red
    wildcards: nnnn=0266
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:15:57 2023]
Finished job 700.
351 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:15:57 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0048.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0048.red
    log: 0-correction/find-errors-jobs/0048.err
    jobid: 448
    reason: Missing output files: 0-correction/find-errors-jobs/0048.red
    wildcards: nnnn=0048
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:19:18 2023]
Finished job 503.
352 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:19:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0280.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0280.red
    log: 0-correction/find-errors-jobs/0280.err
    jobid: 680
    reason: Missing output files: 0-correction/find-errors-jobs/0280.red
    wildcards: nnnn=0280
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:19:44 2023]
Finished job 420.
353 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:19:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0169.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0169.red
    log: 0-correction/find-errors-jobs/0169.err
    jobid: 569
    reason: Missing output files: 0-correction/find-errors-jobs/0169.red
    wildcards: nnnn=0169
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:19:56 2023]
Finished job 615.
354 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:19:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0272.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0272.red
    log: 0-correction/find-errors-jobs/0272.err
    jobid: 672
    reason: Missing output files: 0-correction/find-errors-jobs/0272.red
    wildcards: nnnn=0272
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:20:03 2023]
Finished job 476.
355 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:20:03 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0104.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0104.red
    log: 0-correction/find-errors-jobs/0104.err
    jobid: 504
    reason: Missing output files: 0-correction/find-errors-jobs/0104.red
    wildcards: nnnn=0104
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:20:10 2023]
Finished job 472.
356 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:20:10 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0216.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0216.red
    log: 0-correction/find-errors-jobs/0216.err
    jobid: 616
    reason: Missing output files: 0-correction/find-errors-jobs/0216.red
    wildcards: nnnn=0216
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:20:16 2023]
Finished job 584.
357 of 695 steps (51%) done
Select jobs to execute...

[Tue Mar 28 10:20:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0021.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0021.red
    log: 0-correction/find-errors-jobs/0021.err
    jobid: 421
    reason: Missing output files: 0-correction/find-errors-jobs/0021.red
    wildcards: nnnn=0021
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:20:20 2023]
Finished job 588.
358 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:20:20 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0160.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0160.red
    log: 0-correction/find-errors-jobs/0160.err
    jobid: 560
    reason: Missing output files: 0-correction/find-errors-jobs/0160.red
    wildcards: nnnn=0160
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:20:31 2023]
Finished job 498.
359 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:20:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0077.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0077.red
    log: 0-correction/find-errors-jobs/0077.err
    jobid: 477
    reason: Missing output files: 0-correction/find-errors-jobs/0077.red
    wildcards: nnnn=0077
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:21:04 2023]
Finished job 644.
360 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:21:04 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0154.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0154.red
    log: 0-correction/find-errors-jobs/0154.err
    jobid: 554
    reason: Missing output files: 0-correction/find-errors-jobs/0154.red
    wildcards: nnnn=0154
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:21:05 2023]
Finished job 532.
361 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:21:05 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0189.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0189.red
    log: 0-correction/find-errors-jobs/0189.err
    jobid: 589
    reason: Missing output files: 0-correction/find-errors-jobs/0189.red
    wildcards: nnnn=0189
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:21:31 2023]
Finished job 666.
362 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:21:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0042.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0042.red
    log: 0-correction/find-errors-jobs/0042.err
    jobid: 442
    reason: Missing output files: 0-correction/find-errors-jobs/0042.red
    wildcards: nnnn=0042
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:22:06 2023]
Finished job 448.
363 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:22:06 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0133.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0133.red
    log: 0-correction/find-errors-jobs/0133.err
    jobid: 533
    reason: Missing output files: 0-correction/find-errors-jobs/0133.red
    wildcards: nnnn=0133
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:25:52 2023]
Finished job 680.
364 of 695 steps (52%) done
Select jobs to execute...

[Tue Mar 28 10:25:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0245.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0245.red
    log: 0-correction/find-errors-jobs/0245.err
    jobid: 645
    reason: Missing output files: 0-correction/find-errors-jobs/0245.red
    wildcards: nnnn=0245
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:09 2023]
Finished job 569.
365 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0049.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0049.red
    log: 0-correction/find-errors-jobs/0049.err
    jobid: 449
    reason: Missing output files: 0-correction/find-errors-jobs/0049.red
    wildcards: nnnn=0049
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:18 2023]
Finished job 504.
366 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0238.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0238.red
    log: 0-correction/find-errors-jobs/0238.err
    jobid: 638
    reason: Missing output files: 0-correction/find-errors-jobs/0238.red
    wildcards: nnnn=0238
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:19 2023]
Finished job 477.
367 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0161.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0161.red
    log: 0-correction/find-errors-jobs/0161.err
    jobid: 561
    reason: Missing output files: 0-correction/find-errors-jobs/0161.red
    wildcards: nnnn=0161
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:22 2023]
Finished job 421.
368 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0126.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0126.red
    log: 0-correction/find-errors-jobs/0126.err
    jobid: 526
    reason: Missing output files: 0-correction/find-errors-jobs/0126.red
    wildcards: nnnn=0126
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:28 2023]
Finished job 672.
369 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0273.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0273.red
    log: 0-correction/find-errors-jobs/0273.err
    jobid: 673
    reason: Missing output files: 0-correction/find-errors-jobs/0273.red
    wildcards: nnnn=0273
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:33 2023]
Finished job 616.
370 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:33 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0222.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0222.red
    log: 0-correction/find-errors-jobs/0222.err
    jobid: 622
    reason: Missing output files: 0-correction/find-errors-jobs/0222.red
    wildcards: nnnn=0222
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:26:36 2023]
Finished job 560.
371 of 695 steps (53%) done
Select jobs to execute...

[Tue Mar 28 10:26:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0105.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0105.red
    log: 0-correction/find-errors-jobs/0105.err
    jobid: 505
    reason: Missing output files: 0-correction/find-errors-jobs/0105.red
    wildcards: nnnn=0105
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:27:34 2023]
Finished job 554.
372 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:27:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0217.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0217.red
    log: 0-correction/find-errors-jobs/0217.err
    jobid: 617
    reason: Missing output files: 0-correction/find-errors-jobs/0217.red
    wildcards: nnnn=0217
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:27:37 2023]
Finished job 442.
373 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:27:37 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0022.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0022.red
    log: 0-correction/find-errors-jobs/0022.err
    jobid: 422
    reason: Missing output files: 0-correction/find-errors-jobs/0022.red
    wildcards: nnnn=0022
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:28:03 2023]
Finished job 589.
374 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:28:03 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0294.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0294.red
    log: 0-correction/find-errors-jobs/0294.err
    jobid: 694
    reason: Missing output files: 0-correction/find-errors-jobs/0294.red
    wildcards: nnnn=0294
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:28:41 2023]
Finished job 533.
375 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:28:41 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0078.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0078.red
    log: 0-correction/find-errors-jobs/0078.err
    jobid: 478
    reason: Missing output files: 0-correction/find-errors-jobs/0078.red
    wildcards: nnnn=0078
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:24 2023]
Finished job 449.
376 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:32:24 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0182.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0182.red
    log: 0-correction/find-errors-jobs/0182.err
    jobid: 582
    reason: Missing output files: 0-correction/find-errors-jobs/0182.red
    wildcards: nnnn=0182
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:39 2023]
Finished job 638.
377 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:32:39 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0190.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0190.red
    log: 0-correction/find-errors-jobs/0190.err
    jobid: 590
    reason: Missing output files: 0-correction/find-errors-jobs/0190.red
    wildcards: nnnn=0190
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:39 2023]
Finished job 645.
378 of 695 steps (54%) done
Select jobs to execute...

[Tue Mar 28 10:32:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0070.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0070.red
    log: 0-correction/find-errors-jobs/0070.err
    jobid: 470
    reason: Missing output files: 0-correction/find-errors-jobs/0070.red
    wildcards: nnnn=0070
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:44 2023]
Finished job 561.
379 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:32:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0134.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0134.red
    log: 0-correction/find-errors-jobs/0134.err
    jobid: 534
    reason: Missing output files: 0-correction/find-errors-jobs/0134.red
    wildcards: nnnn=0134
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:47 2023]
Finished job 622.
380 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:32:48 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0246.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0246.red
    log: 0-correction/find-errors-jobs/0246.err
    jobid: 646
    reason: Missing output files: 0-correction/find-errors-jobs/0246.red
    wildcards: nnnn=0246
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:54 2023]
Finished job 505.
381 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:32:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0274.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0274.red
    log: 0-correction/find-errors-jobs/0274.err
    jobid: 674
    reason: Missing output files: 0-correction/find-errors-jobs/0274.red
    wildcards: nnnn=0274
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:32:56 2023]
Finished job 526.
382 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:32:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0168.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0168.red
    log: 0-correction/find-errors-jobs/0168.err
    jobid: 568
    reason: Missing output files: 0-correction/find-errors-jobs/0168.red
    wildcards: nnnn=0168
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:33:01 2023]
Finished job 673.
383 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:33:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0281.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0281.red
    log: 0-correction/find-errors-jobs/0281.err
    jobid: 681
    reason: Missing output files: 0-correction/find-errors-jobs/0281.red
    wildcards: nnnn=0281
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:33:21 2023]
Finished job 422.
384 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:33:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0162.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0162.red
    log: 0-correction/find-errors-jobs/0162.err
    jobid: 562
    reason: Missing output files: 0-correction/find-errors-jobs/0162.red
    wildcards: nnnn=0162
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:34:09 2023]
Finished job 617.
385 of 695 steps (55%) done
Select jobs to execute...

[Tue Mar 28 10:34:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0106.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0106.red
    log: 0-correction/find-errors-jobs/0106.err
    jobid: 506
    reason: Missing output files: 0-correction/find-errors-jobs/0106.red
    wildcards: nnnn=0106
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:34:26 2023]
Finished job 694.
386 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:34:26 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0050.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0050.red
    log: 0-correction/find-errors-jobs/0050.err
    jobid: 450
    reason: Missing output files: 0-correction/find-errors-jobs/0050.red
    wildcards: nnnn=0050
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:34:44 2023]
Finished job 478.
387 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:34:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0218.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0218.red
    log: 0-correction/find-errors-jobs/0218.err
    jobid: 618
    reason: Missing output files: 0-correction/find-errors-jobs/0218.red
    wildcards: nnnn=0218
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:38:45 2023]
Finished job 470.
388 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:38:45 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0023.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0023.red
    log: 0-correction/find-errors-jobs/0023.err
    jobid: 423
    reason: Missing output files: 0-correction/find-errors-jobs/0023.red
    wildcards: nnnn=0023
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:38:54 2023]
Finished job 582.
389 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:38:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0079.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0079.red
    log: 0-correction/find-errors-jobs/0079.err
    jobid: 479
    reason: Missing output files: 0-correction/find-errors-jobs/0079.red
    wildcards: nnnn=0079
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:05 2023]
Finished job 568.
390 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:39:05 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0014.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0014.red
    log: 0-correction/find-errors-jobs/0014.err
    jobid: 414
    reason: Missing output files: 0-correction/find-errors-jobs/0014.red
    wildcards: nnnn=0014
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:07 2023]
Finished job 534.
391 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:39:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0191.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0191.red
    log: 0-correction/find-errors-jobs/0191.err
    jobid: 591
    reason: Missing output files: 0-correction/find-errors-jobs/0191.red
    wildcards: nnnn=0191
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:09 2023]
Finished job 590.
392 of 695 steps (56%) done
Select jobs to execute...

[Tue Mar 28 10:39:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0209.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0209.red
    log: 0-correction/find-errors-jobs/0209.err
    jobid: 609
    reason: Missing output files: 0-correction/find-errors-jobs/0209.red
    wildcards: nnnn=0209
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:14 2023]
Finished job 681.
393 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:39:14 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0135.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0135.red
    log: 0-correction/find-errors-jobs/0135.err
    jobid: 535
    reason: Missing output files: 0-correction/find-errors-jobs/0135.red
    wildcards: nnnn=0135
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:31 2023]
Finished job 646.
394 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:39:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0097.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0097.red
    log: 0-correction/find-errors-jobs/0097.err
    jobid: 497
    reason: Missing output files: 0-correction/find-errors-jobs/0097.red
    wildcards: nnnn=0097
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:39:35 2023]
Finished job 674.
395 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:39:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0247.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0247.red
    log: 0-correction/find-errors-jobs/0247.err
    jobid: 647
    reason: Missing output files: 0-correction/find-errors-jobs/0247.red
    wildcards: nnnn=0247
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:40:01 2023]
Finished job 562.
396 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:40:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0166.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0166.red
    log: 0-correction/find-errors-jobs/0166.err
    jobid: 566
    reason: Missing output files: 0-correction/find-errors-jobs/0166.red
    wildcards: nnnn=0166
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:40:25 2023]
Finished job 450.
397 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:40:26 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0164.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0164.red
    log: 0-correction/find-errors-jobs/0164.err
    jobid: 564
    reason: Missing output files: 0-correction/find-errors-jobs/0164.red
    wildcards: nnnn=0164
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:40:36 2023]
Finished job 506.
398 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:40:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0265.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0265.red
    log: 0-correction/find-errors-jobs/0265.err
    jobid: 665
    reason: Missing output files: 0-correction/find-errors-jobs/0265.red
    wildcards: nnnn=0265
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:41:03 2023]
Finished job 618.
399 of 695 steps (57%) done
Select jobs to execute...

[Tue Mar 28 10:41:03 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0276.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0276.red
    log: 0-correction/find-errors-jobs/0276.err
    jobid: 676
    reason: Missing output files: 0-correction/find-errors-jobs/0276.red
    wildcards: nnnn=0276
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:44:46 2023]
Finished job 423.
400 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:44:46 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0153.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0153.red
    log: 0-correction/find-errors-jobs/0153.err
    jobid: 553
    reason: Missing output files: 0-correction/find-errors-jobs/0153.red
    wildcards: nnnn=0153
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:08 2023]
Finished job 479.
401 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0108.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0108.red
    log: 0-correction/find-errors-jobs/0108.err
    jobid: 508
    reason: Missing output files: 0-correction/find-errors-jobs/0108.red
    wildcards: nnnn=0108
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:21 2023]
Finished job 414.
402 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0041.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0041.red
    log: 0-correction/find-errors-jobs/0041.err
    jobid: 441
    reason: Missing output files: 0-correction/find-errors-jobs/0041.red
    wildcards: nnnn=0041
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:23 2023]
Finished job 591.
403 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:23 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0220.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0220.red
    log: 0-correction/find-errors-jobs/0220.err
    jobid: 620
    reason: Missing output files: 0-correction/find-errors-jobs/0220.red
    wildcards: nnnn=0220
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:34 2023]
Finished job 609.
404 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0025.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0025.red
    log: 0-correction/find-errors-jobs/0025.err
    jobid: 425
    reason: Missing output files: 0-correction/find-errors-jobs/0025.red
    wildcards: nnnn=0025
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:35 2023]
Finished job 647.
405 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0081.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0081.red
    log: 0-correction/find-errors-jobs/0081.err
    jobid: 481
    reason: Missing output files: 0-correction/find-errors-jobs/0081.red
    wildcards: nnnn=0081
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:39 2023]
Finished job 497.
406 of 695 steps (58%) done
Select jobs to execute...

[Tue Mar 28 10:45:39 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0237.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0237.red
    log: 0-correction/find-errors-jobs/0237.err
    jobid: 637
    reason: Missing output files: 0-correction/find-errors-jobs/0237.red
    wildcards: nnnn=0237
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:45:49 2023]
Finished job 535.
407 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:45:49 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0193.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0193.red
    log: 0-correction/find-errors-jobs/0193.err
    jobid: 593
    reason: Missing output files: 0-correction/find-errors-jobs/0193.red
    wildcards: nnnn=0193
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:46:15 2023]
Finished job 566.
408 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:46:15 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0125.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0125.red
    log: 0-correction/find-errors-jobs/0125.err
    jobid: 525
    reason: Missing output files: 0-correction/find-errors-jobs/0125.red
    wildcards: nnnn=0125
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:46:44 2023]
Finished job 564.
409 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:46:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0137.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0137.red
    log: 0-correction/find-errors-jobs/0137.err
    jobid: 537
    reason: Missing output files: 0-correction/find-errors-jobs/0137.red
    wildcards: nnnn=0137
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:47:20 2023]
Finished job 665.
410 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:47:20 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0056.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0056.red
    log: 0-correction/find-errors-jobs/0056.err
    jobid: 456
    reason: Missing output files: 0-correction/find-errors-jobs/0056.red
    wildcards: nnnn=0056
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:47:39 2023]
Finished job 676.
411 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:47:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0225.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0225.red
    log: 0-correction/find-errors-jobs/0225.err
    jobid: 625
    reason: Missing output files: 0-correction/find-errors-jobs/0225.red
    wildcards: nnnn=0225
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:50:54 2023]
Finished job 553.
412 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:50:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0253.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0253.red
    log: 0-correction/find-errors-jobs/0253.err
    jobid: 653
    reason: Missing output files: 0-correction/find-errors-jobs/0253.red
    wildcards: nnnn=0253
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:51:17 2023]
Finished job 508.
413 of 695 steps (59%) done
Select jobs to execute...

[Tue Mar 28 10:51:17 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0029.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0029.red
    log: 0-correction/find-errors-jobs/0029.err
    jobid: 429
    reason: Missing output files: 0-correction/find-errors-jobs/0029.red
    wildcards: nnnn=0029
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:51:27 2023]
Finished job 441.
414 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:51:27 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0053.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0053.red
    log: 0-correction/find-errors-jobs/0053.err
    jobid: 453
    reason: Missing output files: 0-correction/find-errors-jobs/0053.red
    wildcards: nnnn=0053
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:51:33 2023]
Finished job 481.
415 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:51:33 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0277.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0277.red
    log: 0-correction/find-errors-jobs/0277.err
    jobid: 677
    reason: Missing output files: 0-correction/find-errors-jobs/0277.red
    wildcards: nnnn=0277
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:51:56 2023]
Finished job 620.
416 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:51:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0109.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0109.red
    log: 0-correction/find-errors-jobs/0109.err
    jobid: 509
    reason: Missing output files: 0-correction/find-errors-jobs/0109.red
    wildcards: nnnn=0109
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:52:03 2023]
Finished job 593.
417 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:52:04 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0221.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0221.red
    log: 0-correction/find-errors-jobs/0221.err
    jobid: 621
    reason: Missing output files: 0-correction/find-errors-jobs/0221.red
    wildcards: nnnn=0221
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:52:10 2023]
Finished job 637.
418 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:52:10 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0165.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0165.red
    log: 0-correction/find-errors-jobs/0165.err
    jobid: 565
    reason: Missing output files: 0-correction/find-errors-jobs/0165.red
    wildcards: nnnn=0165
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:52:15 2023]
Finished job 425.
419 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:52:15 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0278.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0278.red
    log: 0-correction/find-errors-jobs/0278.err
    jobid: 678
    reason: Missing output files: 0-correction/find-errors-jobs/0278.red
    wildcards: nnnn=0278
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:52:52 2023]
Finished job 525.
420 of 695 steps (60%) done
Select jobs to execute...

[Tue Mar 28 10:52:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0085.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0085.red
    log: 0-correction/find-errors-jobs/0085.err
    jobid: 485
    reason: Missing output files: 0-correction/find-errors-jobs/0085.red
    wildcards: nnnn=0085
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:53:00 2023]
Finished job 537.
421 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:53:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0141.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0141.red
    log: 0-correction/find-errors-jobs/0141.err
    jobid: 541
    reason: Missing output files: 0-correction/find-errors-jobs/0141.red
    wildcards: nnnn=0141
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:53:24 2023]
Finished job 456.
422 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:53:24 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0058.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0058.red
    log: 0-correction/find-errors-jobs/0058.err
    jobid: 458
    reason: Missing output files: 0-correction/find-errors-jobs/0058.red
    wildcards: nnnn=0058
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:54:07 2023]
Finished job 625.
423 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:54:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0282.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0282.red
    log: 0-correction/find-errors-jobs/0282.err
    jobid: 682
    reason: Missing output files: 0-correction/find-errors-jobs/0282.red
    wildcards: nnnn=0282
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:57:28 2023]
Finished job 453.
424 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:57:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0114.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0114.red
    log: 0-correction/find-errors-jobs/0114.err
    jobid: 514
    reason: Missing output files: 0-correction/find-errors-jobs/0114.red
    wildcards: nnnn=0114
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:57:30 2023]
Finished job 653.
425 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:57:30 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0030.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0030.red
    log: 0-correction/find-errors-jobs/0030.err
    jobid: 430
    reason: Missing output files: 0-correction/find-errors-jobs/0030.red
    wildcards: nnnn=0030
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:57:34 2023]
Finished job 429.
426 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:57:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0142.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0142.red
    log: 0-correction/find-errors-jobs/0142.err
    jobid: 542
    reason: Missing output files: 0-correction/find-errors-jobs/0142.red
    wildcards: nnnn=0142
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:58:00 2023]
Finished job 677.
427 of 695 steps (61%) done
Select jobs to execute...

[Tue Mar 28 10:58:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0086.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0086.red
    log: 0-correction/find-errors-jobs/0086.err
    jobid: 486
    reason: Missing output files: 0-correction/find-errors-jobs/0086.red
    wildcards: nnnn=0086
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:58:24 2023]
Finished job 678.
428 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:58:24 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0138.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0138.red
    log: 0-correction/find-errors-jobs/0138.err
    jobid: 538
    reason: Missing output files: 0-correction/find-errors-jobs/0138.red
    wildcards: nnnn=0138
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:58:28 2023]
Finished job 509.
429 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:58:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0171.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0171.red
    log: 0-correction/find-errors-jobs/0171.err
    jobid: 571
    reason: Missing output files: 0-correction/find-errors-jobs/0171.red
    wildcards: nnnn=0171
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:58:34 2023]
Finished job 565.
430 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:58:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0283.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0283.red
    log: 0-correction/find-errors-jobs/0283.err
    jobid: 683
    reason: Missing output files: 0-correction/find-errors-jobs/0283.red
    wildcards: nnnn=0283
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:58:42 2023]
Finished job 621.
431 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:58:42 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0115.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0115.red
    log: 0-correction/find-errors-jobs/0115.err
    jobid: 515
    reason: Missing output files: 0-correction/find-errors-jobs/0115.red
    wildcards: nnnn=0115
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:59:08 2023]
Finished job 485.
432 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:59:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0195.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0195.red
    log: 0-correction/find-errors-jobs/0195.err
    jobid: 595
    reason: Missing output files: 0-correction/find-errors-jobs/0195.red
    wildcards: nnnn=0195
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:59:21 2023]
Finished job 541.
433 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:59:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0197.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0197.red
    log: 0-correction/find-errors-jobs/0197.err
    jobid: 597
    reason: Missing output files: 0-correction/find-errors-jobs/0197.red
    wildcards: nnnn=0197
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 10:59:36 2023]
Finished job 458.
434 of 695 steps (62%) done
Select jobs to execute...

[Tue Mar 28 10:59:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0293.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0293.red
    log: 0-correction/find-errors-jobs/0293.err
    jobid: 693
    reason: Missing output files: 0-correction/find-errors-jobs/0293.red
    wildcards: nnnn=0293
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:00:44 2023]
Finished job 682.
435 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:00:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0001.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0001.red
    log: 0-correction/find-errors-jobs/0001.err
    jobid: 401
    reason: Missing output files: 0-correction/find-errors-jobs/0001.red
    wildcards: nnnn=0001
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:03:36 2023]
Finished job 430.
436 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:03:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0249.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0249.red
    log: 0-correction/find-errors-jobs/0249.err
    jobid: 649
    reason: Missing output files: 0-correction/find-errors-jobs/0249.red
    wildcards: nnnn=0249
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:03:45 2023]
Finished job 514.
437 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:03:45 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0054.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0054.red
    log: 0-correction/find-errors-jobs/0054.err
    jobid: 454
    reason: Missing output files: 0-correction/find-errors-jobs/0054.red
    wildcards: nnnn=0054
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:03:55 2023]
Finished job 542.
438 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:03:55 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0110.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0110.red
    log: 0-correction/find-errors-jobs/0110.err
    jobid: 510
    reason: Missing output files: 0-correction/find-errors-jobs/0110.red
    wildcards: nnnn=0110
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:04:08 2023]
Finished job 486.
439 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:04:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0170.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0170.red
    log: 0-correction/find-errors-jobs/0170.err
    jobid: 570
    reason: Missing output files: 0-correction/find-errors-jobs/0170.red
    wildcards: nnnn=0170
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:04:37 2023]
Finished job 538.
440 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:04:37 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0254.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0254.red
    log: 0-correction/find-errors-jobs/0254.err
    jobid: 654
    reason: Missing output files: 0-correction/find-errors-jobs/0254.red
    wildcards: nnnn=0254
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:04:52 2023]
Finished job 571.
441 of 695 steps (63%) done
Select jobs to execute...

[Tue Mar 28 11:04:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0059.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0059.red
    log: 0-correction/find-errors-jobs/0059.err
    jobid: 459
    reason: Missing output files: 0-correction/find-errors-jobs/0059.red
    wildcards: nnnn=0059
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:04:56 2023]
Finished job 683.
442 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:04:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0003.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0003.red
    log: 0-correction/find-errors-jobs/0003.err
    jobid: 403
    reason: Missing output files: 0-correction/find-errors-jobs/0003.red
    wildcards: nnnn=0003
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:04:58 2023]
Finished job 515.
443 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:04:58 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0031.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0031.red
    log: 0-correction/find-errors-jobs/0031.err
    jobid: 431
    reason: Missing output files: 0-correction/find-errors-jobs/0031.red
    wildcards: nnnn=0031
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:05:36 2023]
Finished job 595.
444 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:05:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0087.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0087.red
    log: 0-correction/find-errors-jobs/0087.err
    jobid: 487
    reason: Missing output files: 0-correction/find-errors-jobs/0087.red
    wildcards: nnnn=0087
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:05:43 2023]
Finished job 597.
445 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:05:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0255.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0255.red
    log: 0-correction/find-errors-jobs/0255.err
    jobid: 655
    reason: Missing output files: 0-correction/find-errors-jobs/0255.red
    wildcards: nnnn=0255
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:06:03 2023]
Finished job 693.
446 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:06:03 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0228.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0228.red
    log: 0-correction/find-errors-jobs/0228.err
    jobid: 628
    reason: Missing output files: 0-correction/find-errors-jobs/0228.red
    wildcards: nnnn=0228
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:06:54 2023]
Finished job 401.
447 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:06:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0172.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0172.red
    log: 0-correction/find-errors-jobs/0172.err
    jobid: 572
    reason: Missing output files: 0-correction/find-errors-jobs/0172.red
    wildcards: nnnn=0172
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:09:39 2023]
Finished job 454.
448 of 695 steps (64%) done
Select jobs to execute...

[Tue Mar 28 11:09:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0026.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0026.red
    log: 0-correction/find-errors-jobs/0026.err
    jobid: 426
    reason: Missing output files: 0-correction/find-errors-jobs/0026.red
    wildcards: nnnn=0026
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:10:00 2023]
Finished job 510.
449 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:10:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0116.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0116.red
    log: 0-correction/find-errors-jobs/0116.err
    jobid: 516
    reason: Missing output files: 0-correction/find-errors-jobs/0116.red
    wildcards: nnnn=0116
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:10:07 2023]
Finished job 649.
450 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:10:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0032.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0032.red
    log: 0-correction/find-errors-jobs/0032.err
    jobid: 432
    reason: Missing output files: 0-correction/find-errors-jobs/0032.red
    wildcards: nnnn=0032
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:10:16 2023]
Finished job 570.
451 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:10:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0256.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0256.red
    log: 0-correction/find-errors-jobs/0256.err
    jobid: 656
    reason: Missing output files: 0-correction/find-errors-jobs/0256.red
    wildcards: nnnn=0256
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:10:51 2023]
Finished job 431.
452 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:10:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0200.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0200.red
    log: 0-correction/find-errors-jobs/0200.err
    jobid: 600
    reason: Missing output files: 0-correction/find-errors-jobs/0200.red
    wildcards: nnnn=0200
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:11:02 2023]
Finished job 654.
453 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:11:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0173.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0173.red
    log: 0-correction/find-errors-jobs/0173.err
    jobid: 573
    reason: Missing output files: 0-correction/find-errors-jobs/0173.red
    wildcards: nnnn=0173
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:11:05 2023]
Finished job 403.
454 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:11:05 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0117.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0117.red
    log: 0-correction/find-errors-jobs/0117.err
    jobid: 517
    reason: Missing output files: 0-correction/find-errors-jobs/0117.red
    wildcards: nnnn=0117
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:11:19 2023]
Finished job 459.
455 of 695 steps (65%) done
Select jobs to execute...

[Tue Mar 28 11:11:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0285.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0285.red
    log: 0-correction/find-errors-jobs/0285.err
    jobid: 685
    reason: Missing output files: 0-correction/find-errors-jobs/0285.red
    wildcards: nnnn=0285
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:11:30 2023]
Finished job 487.
456 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:11:30 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0145.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0145.red
    log: 0-correction/find-errors-jobs/0145.err
    jobid: 545
    reason: Missing output files: 0-correction/find-errors-jobs/0145.red
    wildcards: nnnn=0145
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:12:06 2023]
Finished job 655.
457 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:12:06 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0089.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0089.red
    log: 0-correction/find-errors-jobs/0089.err
    jobid: 489
    reason: Missing output files: 0-correction/find-errors-jobs/0089.red
    wildcards: nnnn=0089
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:12:44 2023]
Finished job 628.
458 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:12:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0201.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0201.red
    log: 0-correction/find-errors-jobs/0201.err
    jobid: 601
    reason: Missing output files: 0-correction/find-errors-jobs/0201.red
    wildcards: nnnn=0201
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:13:07 2023]
Finished job 572.
459 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:13:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0062.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0062.red
    log: 0-correction/find-errors-jobs/0062.err
    jobid: 462
    reason: Missing output files: 0-correction/find-errors-jobs/0062.red
    wildcards: nnnn=0062
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:15:22 2023]
Finished job 426.
460 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:15:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0286.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0286.red
    log: 0-correction/find-errors-jobs/0286.err
    jobid: 686
    reason: Missing output files: 0-correction/find-errors-jobs/0286.red
    wildcards: nnnn=0286
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:16:19 2023]
Finished job 432.
461 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:16:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0118.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0118.red
    log: 0-correction/find-errors-jobs/0118.err
    jobid: 518
    reason: Missing output files: 0-correction/find-errors-jobs/0118.red
    wildcards: nnnn=0118
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:16:35 2023]
Finished job 516.
462 of 695 steps (66%) done
Select jobs to execute...

[Tue Mar 28 11:16:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0230.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0230.red
    log: 0-correction/find-errors-jobs/0230.err
    jobid: 630
    reason: Missing output files: 0-correction/find-errors-jobs/0230.red
    wildcards: nnnn=0230
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:16:53 2023]
Finished job 656.
463 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:16:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0055.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0055.red
    log: 0-correction/find-errors-jobs/0055.err
    jobid: 455
    reason: Missing output files: 0-correction/find-errors-jobs/0055.red
    wildcards: nnnn=0055
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:17:16 2023]
Finished job 600.
464 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:17:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0258.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0258.red
    log: 0-correction/find-errors-jobs/0258.err
    jobid: 658
    reason: Missing output files: 0-correction/find-errors-jobs/0258.red
    wildcards: nnnn=0258
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:17:28 2023]
Finished job 517.
465 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:17:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0202.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0202.red
    log: 0-correction/find-errors-jobs/0202.err
    jobid: 602
    reason: Missing output files: 0-correction/find-errors-jobs/0202.red
    wildcards: nnnn=0202
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:17:29 2023]
Finished job 573.
466 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:17:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0006.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0006.red
    log: 0-correction/find-errors-jobs/0006.err
    jobid: 406
    reason: Missing output files: 0-correction/find-errors-jobs/0006.red
    wildcards: nnnn=0006
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:17:36 2023]
Finished job 545.
467 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:17:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0175.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0175.red
    log: 0-correction/find-errors-jobs/0175.err
    jobid: 575
    reason: Missing output files: 0-correction/find-errors-jobs/0175.red
    wildcards: nnnn=0175
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:17:56 2023]
Finished job 685.
468 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:17:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0287.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0287.red
    log: 0-correction/find-errors-jobs/0287.err
    jobid: 687
    reason: Missing output files: 0-correction/find-errors-jobs/0287.red
    wildcards: nnnn=0287
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:18:08 2023]
Finished job 489.
469 of 695 steps (67%) done
Select jobs to execute...

[Tue Mar 28 11:18:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0119.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0119.red
    log: 0-correction/find-errors-jobs/0119.err
    jobid: 519
    reason: Missing output files: 0-correction/find-errors-jobs/0119.red
    wildcards: nnnn=0119
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:18:51 2023]
Finished job 601.
470 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:18:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0063.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0063.red
    log: 0-correction/find-errors-jobs/0063.err
    jobid: 463
    reason: Missing output files: 0-correction/find-errors-jobs/0063.red
    wildcards: nnnn=0063
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:18:55 2023]
Finished job 462.
471 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:18:56 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0231.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0231.red
    log: 0-correction/find-errors-jobs/0231.err
    jobid: 631
    reason: Missing output files: 0-correction/find-errors-jobs/0231.red
    wildcards: nnnn=0231
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:21:44 2023]
Finished job 686.
472 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:21:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0035.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0035.red
    log: 0-correction/find-errors-jobs/0035.err
    jobid: 435
    reason: Missing output files: 0-correction/find-errors-jobs/0035.red
    wildcards: nnnn=0035
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:22:31 2023]
Finished job 518.
473 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:22:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0147.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0147.red
    log: 0-correction/find-errors-jobs/0147.err
    jobid: 547
    reason: Missing output files: 0-correction/find-errors-jobs/0147.red
    wildcards: nnnn=0147
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:22:35 2023]
Finished job 455.
474 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:22:35 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0090.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0090.red
    log: 0-correction/find-errors-jobs/0090.err
    jobid: 490
    reason: Missing output files: 0-correction/find-errors-jobs/0090.red
    wildcards: nnnn=0090
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:23:02 2023]
Finished job 630.
475 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:23:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0259.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0259.red
    log: 0-correction/find-errors-jobs/0259.err
    jobid: 659
    reason: Missing output files: 0-correction/find-errors-jobs/0259.red
    wildcards: nnnn=0259
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:23:14 2023]
Finished job 406.
476 of 695 steps (68%) done
Select jobs to execute...

[Tue Mar 28 11:23:14 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0091.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0091.red
    log: 0-correction/find-errors-jobs/0091.err
    jobid: 491
    reason: Missing output files: 0-correction/find-errors-jobs/0091.red
    wildcards: nnnn=0091
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:23:45 2023]
Finished job 658.
477 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:23:45 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0203.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0203.red
    log: 0-correction/find-errors-jobs/0203.err
    jobid: 603
    reason: Missing output files: 0-correction/find-errors-jobs/0203.red
    wildcards: nnnn=0203
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:24:01 2023]
Finished job 575.
478 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:24:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0167.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0167.red
    log: 0-correction/find-errors-jobs/0167.err
    jobid: 567
    reason: Missing output files: 0-correction/find-errors-jobs/0167.red
    wildcards: nnnn=0167
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:24:09 2023]
Finished job 602.
479 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:24:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0279.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0279.red
    log: 0-correction/find-errors-jobs/0279.err
    jobid: 679
    reason: Missing output files: 0-correction/find-errors-jobs/0279.red
    wildcards: nnnn=0279
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:24:23 2023]
Finished job 687.
480 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:24:23 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0111.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0111.red
    log: 0-correction/find-errors-jobs/0111.err
    jobid: 511
    reason: Missing output files: 0-correction/find-errors-jobs/0111.red
    wildcards: nnnn=0111
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:24:28 2023]
Finished job 519.
481 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:24:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0223.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0223.red
    log: 0-correction/find-errors-jobs/0223.err
    jobid: 623
    reason: Missing output files: 0-correction/find-errors-jobs/0223.red
    wildcards: nnnn=0223
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:24:43 2023]
Finished job 463.
482 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:24:43 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0288.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0288.red
    log: 0-correction/find-errors-jobs/0288.err
    jobid: 688
    reason: Missing output files: 0-correction/find-errors-jobs/0288.red
    wildcards: nnnn=0288
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:25:28 2023]
Finished job 631.
483 of 695 steps (69%) done
Select jobs to execute...

[Tue Mar 28 11:25:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0120.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0120.red
    log: 0-correction/find-errors-jobs/0120.err
    jobid: 520
    reason: Missing output files: 0-correction/find-errors-jobs/0120.red
    wildcards: nnnn=0120
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:27:47 2023]
Finished job 435.
484 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:27:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0232.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0232.red
    log: 0-correction/find-errors-jobs/0232.err
    jobid: 632
    reason: Missing output files: 0-correction/find-errors-jobs/0232.red
    wildcards: nnnn=0232
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:28:29 2023]
Finished job 547.
485 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:28:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0036.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0036.red
    log: 0-correction/find-errors-jobs/0036.err
    jobid: 436
    reason: Missing output files: 0-correction/find-errors-jobs/0036.red
    wildcards: nnnn=0036
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:28:40 2023]
Finished job 490.
486 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:28:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0176.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0176.red
    log: 0-correction/find-errors-jobs/0176.err
    jobid: 576
    reason: Missing output files: 0-correction/find-errors-jobs/0176.red
    wildcards: nnnn=0176
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:29:29 2023]
Finished job 491.
487 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:29:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0148.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0148.red
    log: 0-correction/find-errors-jobs/0148.err
    jobid: 548
    reason: Missing output files: 0-correction/find-errors-jobs/0148.red
    wildcards: nnnn=0148
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:29:40 2023]
Finished job 659.
488 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:29:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0260.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0260.red
    log: 0-correction/find-errors-jobs/0260.err
    jobid: 660
    reason: Missing output files: 0-correction/find-errors-jobs/0260.red
    wildcards: nnnn=0260
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:30:13 2023]
Finished job 603.
489 of 695 steps (70%) done
Select jobs to execute...

[Tue Mar 28 11:30:13 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0092.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0092.red
    log: 0-correction/find-errors-jobs/0092.err
    jobid: 492
    reason: Missing output files: 0-correction/find-errors-jobs/0092.red
    wildcards: nnnn=0092
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:30:17 2023]
Finished job 567.
490 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:30:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0064.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0064.red
    log: 0-correction/find-errors-jobs/0064.err
    jobid: 464
    reason: Missing output files: 0-correction/find-errors-jobs/0064.red
    wildcards: nnnn=0064
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:30:39 2023]
Finished job 679.
491 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:30:39 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0204.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0204.red
    log: 0-correction/find-errors-jobs/0204.err
    jobid: 604
    reason: Missing output files: 0-correction/find-errors-jobs/0204.red
    wildcards: nnnn=0204
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:30:58 2023]
Finished job 511.
492 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:30:58 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0235.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0235.red
    log: 0-correction/find-errors-jobs/0235.err
    jobid: 635
    reason: Missing output files: 0-correction/find-errors-jobs/0235.red
    wildcards: nnnn=0235
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:31:02 2023]
Finished job 688.
493 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:31:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0005.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0005.red
    log: 0-correction/find-errors-jobs/0005.err
    jobid: 405
    reason: Missing output files: 0-correction/find-errors-jobs/0005.red
    wildcards: nnnn=0005
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:31:06 2023]
Finished job 623.
494 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:31:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0180.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0180.red
    log: 0-correction/find-errors-jobs/0180.err
    jobid: 580
    reason: Missing output files: 0-correction/find-errors-jobs/0180.red
    wildcards: nnnn=0180
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:31:30 2023]
Finished job 520.
495 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:31:30 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0065.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0065.red
    log: 0-correction/find-errors-jobs/0065.err
    jobid: 465
    reason: Missing output files: 0-correction/find-errors-jobs/0065.red
    wildcards: nnnn=0065
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:34:07 2023]
Finished job 632.
496 of 695 steps (71%) done
Select jobs to execute...

[Tue Mar 28 11:34:08 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0177.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0177.red
    log: 0-correction/find-errors-jobs/0177.err
    jobid: 577
    reason: Missing output files: 0-correction/find-errors-jobs/0177.red
    wildcards: nnnn=0177
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:34:47 2023]
Finished job 436.
497 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:34:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0289.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0289.red
    log: 0-correction/find-errors-jobs/0289.err
    jobid: 689
    reason: Missing output files: 0-correction/find-errors-jobs/0289.red
    wildcards: nnnn=0289
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:34:52 2023]
Finished job 576.
498 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:34:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0008.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0008.red
    log: 0-correction/find-errors-jobs/0008.err
    jobid: 408
    reason: Missing output files: 0-correction/find-errors-jobs/0008.red
    wildcards: nnnn=0008
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:35:45 2023]
Finished job 548.
499 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:35:45 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0004.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0004.red
    log: 0-correction/find-errors-jobs/0004.err
    jobid: 404
    reason: Missing output files: 0-correction/find-errors-jobs/0004.red
    wildcards: nnnn=0004
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:36:21 2023]
Finished job 464.
500 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:36:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0290.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0290.red
    log: 0-correction/find-errors-jobs/0290.err
    jobid: 690
    reason: Missing output files: 0-correction/find-errors-jobs/0290.red
    wildcards: nnnn=0290
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:36:25 2023]
Finished job 660.
501 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:36:25 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0122.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0122.red
    log: 0-correction/find-errors-jobs/0122.err
    jobid: 522
    reason: Missing output files: 0-correction/find-errors-jobs/0122.red
    wildcards: nnnn=0122
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:36:29 2023]
Finished job 492.
502 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:36:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0227.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0227.red
    log: 0-correction/find-errors-jobs/0227.err
    jobid: 627
    reason: Missing output files: 0-correction/find-errors-jobs/0227.red
    wildcards: nnnn=0227
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:36:47 2023]
Finished job 604.
503 of 695 steps (72%) done
Select jobs to execute...

[Tue Mar 28 11:36:47 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0234.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0234.red
    log: 0-correction/find-errors-jobs/0234.err
    jobid: 634
    reason: Missing output files: 0-correction/find-errors-jobs/0234.red
    wildcards: nnnn=0234
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:37:09 2023]
Finished job 405.
504 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:37:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0178.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0178.red
    log: 0-correction/find-errors-jobs/0178.err
    jobid: 578
    reason: Missing output files: 0-correction/find-errors-jobs/0178.red
    wildcards: nnnn=0178
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:37:16 2023]
Finished job 635.
505 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:37:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0124.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0124.red
    log: 0-correction/find-errors-jobs/0124.err
    jobid: 524
    reason: Missing output files: 0-correction/find-errors-jobs/0124.red
    wildcards: nnnn=0124
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:37:33 2023]
Finished job 465.
506 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:37:33 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0066.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0066.red
    log: 0-correction/find-errors-jobs/0066.err
    jobid: 466
    reason: Missing output files: 0-correction/find-errors-jobs/0066.red
    wildcards: nnnn=0066
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:37:42 2023]
Finished job 580.
507 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:37:42 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0038.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0038.red
    log: 0-correction/find-errors-jobs/0038.err
    jobid: 438
    reason: Missing output files: 0-correction/find-errors-jobs/0038.red
    wildcards: nnnn=0038
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:40:09 2023]
Finished job 577.
508 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:40:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0123.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0123.red
    log: 0-correction/find-errors-jobs/0123.err
    jobid: 523
    reason: Missing output files: 0-correction/find-errors-jobs/0123.red
    wildcards: nnnn=0123
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:40:52 2023]
Finished job 408.
509 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:40:53 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0150.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0150.red
    log: 0-correction/find-errors-jobs/0150.err
    jobid: 550
    reason: Missing output files: 0-correction/find-errors-jobs/0150.red
    wildcards: nnnn=0150
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:41:00 2023]
Finished job 689.
510 of 695 steps (73%) done
Select jobs to execute...

[Tue Mar 28 11:41:00 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0205.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0205.red
    log: 0-correction/find-errors-jobs/0205.err
    jobid: 605
    reason: Missing output files: 0-correction/find-errors-jobs/0205.red
    wildcards: nnnn=0205
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:41:54 2023]
Finished job 404.
511 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:41:55 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0262.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0262.red
    log: 0-correction/find-errors-jobs/0262.err
    jobid: 662
    reason: Missing output files: 0-correction/find-errors-jobs/0262.red
    wildcards: nnnn=0262
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:42:41 2023]
Finished job 522.
512 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:42:41 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0093.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0093.red
    log: 0-correction/find-errors-jobs/0093.err
    jobid: 493
    reason: Missing output files: 0-correction/find-errors-jobs/0093.red
    wildcards: nnnn=0093
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:42:52 2023]
Finished job 690.
513 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:42:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0094.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0094.red
    log: 0-correction/find-errors-jobs/0094.err
    jobid: 494
    reason: Missing output files: 0-correction/find-errors-jobs/0094.red
    wildcards: nnnn=0094
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:10 2023]
Finished job 627.
514 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:43:10 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0261.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0261.red
    log: 0-correction/find-errors-jobs/0261.err
    jobid: 661
    reason: Missing output files: 0-correction/find-errors-jobs/0261.red
    wildcards: nnnn=0261
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:18 2023]
Finished job 578.
515 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:43:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0206.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0206.red
    log: 0-correction/find-errors-jobs/0206.err
    jobid: 606
    reason: Missing output files: 0-correction/find-errors-jobs/0206.red
    wildcards: nnnn=0206
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:32 2023]
Finished job 634.
516 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:43:32 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0198.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0198.red
    log: 0-correction/find-errors-jobs/0198.err
    jobid: 598
    reason: Missing output files: 0-correction/find-errors-jobs/0198.red
    wildcards: nnnn=0198
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:32 2023]
Finished job 524.
517 of 695 steps (74%) done
Select jobs to execute...

[Tue Mar 28 11:43:32 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0199.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0199.red
    log: 0-correction/find-errors-jobs/0199.err
    jobid: 599
    reason: Missing output files: 0-correction/find-errors-jobs/0199.red
    wildcards: nnnn=0199
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:36 2023]
Finished job 466.
518 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:43:36 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0257.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0257.red
    log: 0-correction/find-errors-jobs/0257.err
    jobid: 657
    reason: Missing output files: 0-correction/find-errors-jobs/0257.red
    wildcards: nnnn=0257
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:43:46 2023]
Finished job 438.
519 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:43:46 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0264.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0264.red
    log: 0-correction/find-errors-jobs/0264.err
    jobid: 664
    reason: Missing output files: 0-correction/find-errors-jobs/0264.red
    wildcards: nnnn=0264
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:46:25 2023]
Finished job 523.
520 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:46:25 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0013.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0013.red
    log: 0-correction/find-errors-jobs/0013.err
    jobid: 413
    reason: Missing output files: 0-correction/find-errors-jobs/0013.red
    wildcards: nnnn=0013
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:47:04 2023]
Finished job 550.
521 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:47:05 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0067.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0067.red
    log: 0-correction/find-errors-jobs/0067.err
    jobid: 467
    reason: Missing output files: 0-correction/find-errors-jobs/0067.red
    wildcards: nnnn=0067
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:47:30 2023]
Finished job 605.
522 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:47:30 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0143.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0143.red
    log: 0-correction/find-errors-jobs/0143.err
    jobid: 543
    reason: Missing output files: 0-correction/find-errors-jobs/0143.red
    wildcards: nnnn=0143
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:48:21 2023]
Finished job 662.
523 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:48:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0179.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0179.red
    log: 0-correction/find-errors-jobs/0179.err
    jobid: 579
    reason: Missing output files: 0-correction/find-errors-jobs/0179.red
    wildcards: nnnn=0179
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:48:47 2023]
Finished job 494.
524 of 695 steps (75%) done
Select jobs to execute...

[Tue Mar 28 11:48:48 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0149.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0149.red
    log: 0-correction/find-errors-jobs/0149.err
    jobid: 549
    reason: Missing output files: 0-correction/find-errors-jobs/0149.red
    wildcards: nnnn=0149
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:48:51 2023]
Finished job 493.
525 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:48:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0291.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0291.red
    log: 0-correction/find-errors-jobs/0291.err
    jobid: 691
    reason: Missing output files: 0-correction/find-errors-jobs/0291.red
    wildcards: nnnn=0291
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:49:34 2023]
Finished job 599.
526 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:49:34 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0037.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0037.red
    log: 0-correction/find-errors-jobs/0037.err
    jobid: 437
    reason: Missing output files: 0-correction/find-errors-jobs/0037.red
    wildcards: nnnn=0037
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:49:51 2023]
Finished job 664.
527 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:49:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0002.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0002.red
    log: 0-correction/find-errors-jobs/0002.err
    jobid: 402
    reason: Missing output files: 0-correction/find-errors-jobs/0002.red
    wildcards: nnnn=0002
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:49:55 2023]
Finished job 598.
528 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:49:55 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0226.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0226.red
    log: 0-correction/find-errors-jobs/0226.err
    jobid: 626
    reason: Missing output files: 0-correction/find-errors-jobs/0226.red
    wildcards: nnnn=0226
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:50:01 2023]
Finished job 657.
529 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:50:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0060.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0060.red
    log: 0-correction/find-errors-jobs/0060.err
    jobid: 460
    reason: Missing output files: 0-correction/find-errors-jobs/0060.red
    wildcards: nnnn=0060
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:50:03 2023]
Finished job 661.
530 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:50:03 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0233.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0233.red
    log: 0-correction/find-errors-jobs/0233.err
    jobid: 633
    reason: Missing output files: 0-correction/find-errors-jobs/0233.red
    wildcards: nnnn=0233
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:50:18 2023]
Finished job 606.
531 of 695 steps (76%) done
Select jobs to execute...

[Tue Mar 28 11:50:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0284.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0284.red
    log: 0-correction/find-errors-jobs/0284.err
    jobid: 684
    reason: Missing output files: 0-correction/find-errors-jobs/0284.red
    wildcards: nnnn=0284
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:52:28 2023]
Finished job 413.
532 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:52:28 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0121.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0121.red
    log: 0-correction/find-errors-jobs/0121.err
    jobid: 521
    reason: Missing output files: 0-correction/find-errors-jobs/0121.red
    wildcards: nnnn=0121
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:52:54 2023]
Finished job 467.
533 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:52:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0012.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0012.red
    log: 0-correction/find-errors-jobs/0012.err
    jobid: 412
    reason: Missing output files: 0-correction/find-errors-jobs/0012.red
    wildcards: nnnn=0012
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:53:38 2023]
Finished job 543.
534 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:53:38 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0152.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0152.red
    log: 0-correction/find-errors-jobs/0152.err
    jobid: 552
    reason: Missing output files: 0-correction/find-errors-jobs/0152.red
    wildcards: nnnn=0152
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:54:45 2023]
Finished job 579.
535 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:54:45 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0096.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0096.red
    log: 0-correction/find-errors-jobs/0096.err
    jobid: 496
    reason: Missing output files: 0-correction/find-errors-jobs/0096.red
    wildcards: nnnn=0096
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:54:58 2023]
Finished job 549.
536 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:54:58 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0208.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0208.red
    log: 0-correction/find-errors-jobs/0208.err
    jobid: 608
    reason: Missing output files: 0-correction/find-errors-jobs/0208.red
    wildcards: nnnn=0208
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:55:07 2023]
Finished job 691.
537 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:55:07 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0033.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0033.red
    log: 0-correction/find-errors-jobs/0033.err
    jobid: 433
    reason: Missing output files: 0-correction/find-errors-jobs/0033.red
    wildcards: nnnn=0033
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:55:37 2023]
Finished job 437.
538 of 695 steps (77%) done
Select jobs to execute...

[Tue Mar 28 11:55:37 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0082.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0082.red
    log: 0-correction/find-errors-jobs/0082.err
    jobid: 482
    reason: Missing output files: 0-correction/find-errors-jobs/0082.red
    wildcards: nnnn=0082
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:56:18 2023]
Finished job 460.
539 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:56:18 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0194.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0194.red
    log: 0-correction/find-errors-jobs/0194.err
    jobid: 594
    reason: Missing output files: 0-correction/find-errors-jobs/0194.red
    wildcards: nnnn=0194
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:56:21 2023]
Finished job 402.
540 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:56:21 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0250.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0250.red
    log: 0-correction/find-errors-jobs/0250.err
    jobid: 650
    reason: Missing output files: 0-correction/find-errors-jobs/0250.red
    wildcards: nnnn=0250
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:56:24 2023]
Finished job 626.
541 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:56:24 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0009.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0009.red
    log: 0-correction/find-errors-jobs/0009.err
    jobid: 409
    reason: Missing output files: 0-correction/find-errors-jobs/0009.red
    wildcards: nnnn=0009
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:56:31 2023]
Finished job 633.
542 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:56:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0069.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0069.red
    log: 0-correction/find-errors-jobs/0069.err
    jobid: 469
    reason: Missing output files: 0-correction/find-errors-jobs/0069.red
    wildcards: nnnn=0069
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:56:46 2023]
Finished job 684.
543 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:56:46 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0181.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0181.red
    log: 0-correction/find-errors-jobs/0181.err
    jobid: 581
    reason: Missing output files: 0-correction/find-errors-jobs/0181.red
    wildcards: nnnn=0181
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:58:44 2023]
Finished job 521.
544 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:58:44 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0007.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0007.red
    log: 0-correction/find-errors-jobs/0007.err
    jobid: 407
    reason: Missing output files: 0-correction/find-errors-jobs/0007.red
    wildcards: nnnn=0007
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 11:59:01 2023]
Finished job 412.
545 of 695 steps (78%) done
Select jobs to execute...

[Tue Mar 28 11:59:01 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0174.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0174.red
    log: 0-correction/find-errors-jobs/0174.err
    jobid: 574
    reason: Missing output files: 0-correction/find-errors-jobs/0174.red
    wildcards: nnnn=0174
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:00:19 2023]
Finished job 552.
546 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:00:19 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0011.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0011.red
    log: 0-correction/find-errors-jobs/0011.err
    jobid: 411
    reason: Missing output files: 0-correction/find-errors-jobs/0011.red
    wildcards: nnnn=0011
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:00:29 2023]
Finished job 496.
547 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:00:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0034.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0034.red
    log: 0-correction/find-errors-jobs/0034.err
    jobid: 434
    reason: Missing output files: 0-correction/find-errors-jobs/0034.red
    wildcards: nnnn=0034
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:01:16 2023]
Finished job 433.
548 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:01:16 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0146.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0146.red
    log: 0-correction/find-errors-jobs/0146.err
    jobid: 546
    reason: Missing output files: 0-correction/find-errors-jobs/0146.red
    wildcards: nnnn=0146
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:01:21 2023]
Finished job 608.
549 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:01:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0229.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0229.red
    log: 0-correction/find-errors-jobs/0229.err
    jobid: 629
    reason: Missing output files: 0-correction/find-errors-jobs/0229.red
    wildcards: nnnn=0229
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:01:51 2023]
Finished job 482.
550 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:01:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0039.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0039.red
    log: 0-correction/find-errors-jobs/0039.err
    jobid: 439
    reason: Missing output files: 0-correction/find-errors-jobs/0039.red
    wildcards: nnnn=0039
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:02:22 2023]
Finished job 594.
551 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:02:22 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0083.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0083.red
    log: 0-correction/find-errors-jobs/0083.err
    jobid: 483
    reason: Missing output files: 0-correction/find-errors-jobs/0083.red
    wildcards: nnnn=0083
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:02:23 2023]
Finished job 469.
552 of 695 steps (79%) done
Select jobs to execute...

[Tue Mar 28 12:02:24 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0139.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0139.red
    log: 0-correction/find-errors-jobs/0139.err
    jobid: 539
    reason: Missing output files: 0-correction/find-errors-jobs/0139.red
    wildcards: nnnn=0139
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:02:29 2023]
Finished job 409.
553 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:02:29 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0251.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0251.red
    log: 0-correction/find-errors-jobs/0251.err
    jobid: 651
    reason: Missing output files: 0-correction/find-errors-jobs/0251.red
    wildcards: nnnn=0251
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:02:51 2023]
Finished job 650.
554 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:02:51 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0027.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0027.red
    log: 0-correction/find-errors-jobs/0027.err
    jobid: 427
    reason: Missing output files: 0-correction/find-errors-jobs/0027.red
    wildcards: nnnn=0027
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:03:09 2023]
Finished job 581.
555 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:03:09 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0236.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0236.red
    log: 0-correction/find-errors-jobs/0236.err
    jobid: 636
    reason: Missing output files: 0-correction/find-errors-jobs/0236.red
    wildcards: nnnn=0236
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:04:50 2023]
Finished job 407.
556 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:04:50 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0068.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0068.red
    log: 0-correction/find-errors-jobs/0068.err
    jobid: 468
    reason: Missing output files: 0-correction/find-errors-jobs/0068.red
    wildcards: nnnn=0068
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:04:54 2023]
Finished job 574.
557 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:04:54 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0061.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0061.red
    log: 0-correction/find-errors-jobs/0061.err
    jobid: 461
    reason: Missing output files: 0-correction/find-errors-jobs/0061.red
    wildcards: nnnn=0061
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:06:10 2023]
Finished job 411.
558 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:06:10 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0292.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0292.red
    log: 0-correction/find-errors-jobs/0292.err
    jobid: 692
    reason: Missing output files: 0-correction/find-errors-jobs/0292.red
    wildcards: nnnn=0292
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:06:26 2023]
Finished job 434.
559 of 695 steps (80%) done
Select jobs to execute...

[Tue Mar 28 12:06:26 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0010.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0010.red
    log: 0-correction/find-errors-jobs/0010.err
    jobid: 410
    reason: Missing output files: 0-correction/find-errors-jobs/0010.red
    wildcards: nnnn=0010
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:07:50 2023]
Finished job 629.
560 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:07:50 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0207.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0207.red
    log: 0-correction/find-errors-jobs/0207.err
    jobid: 607
    reason: Missing output files: 0-correction/find-errors-jobs/0207.red
    wildcards: nnnn=0207
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:07:52 2023]
Finished job 439.
561 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:07:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0151.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0151.red
    log: 0-correction/find-errors-jobs/0151.err
    jobid: 551
    reason: Missing output files: 0-correction/find-errors-jobs/0151.red
    wildcards: nnnn=0151
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:08:02 2023]
Finished job 546.
562 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:08:02 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0088.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0088.red
    log: 0-correction/find-errors-jobs/0088.err
    jobid: 488
    reason: Missing output files: 0-correction/find-errors-jobs/0088.red
    wildcards: nnnn=0088
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:08:31 2023]
Finished job 483.
563 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:08:31 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0263.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0263.red
    log: 0-correction/find-errors-jobs/0263.err
    jobid: 663
    reason: Missing output files: 0-correction/find-errors-jobs/0263.red
    wildcards: nnnn=0263
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:08:40 2023]
Finished job 539.
564 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:08:40 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0095.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0095.red
    log: 0-correction/find-errors-jobs/0095.err
    jobid: 495
    reason: Missing output files: 0-correction/find-errors-jobs/0095.red
    wildcards: nnnn=0095
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:08:43 2023]
Finished job 651.
565 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:08:43 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0144.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0144.red
    log: 0-correction/find-errors-jobs/0144.err
    jobid: 544
    reason: Missing output files: 0-correction/find-errors-jobs/0144.red
    wildcards: nnnn=0144
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:08:52 2023]
Finished job 427.
566 of 695 steps (81%) done
Select jobs to execute...

[Tue Mar 28 12:08:52 2023]
rule computeErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0040.range, 0-correction/configureFindErrors.finished
    output: 0-correction/find-errors-jobs/0040.red
    log: 0-correction/find-errors-jobs/0040.err
    jobid: 440
    reason: Missing output files: 0-correction/find-errors-jobs/0040.red
    wildcards: nnnn=0040
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=32, time_h=4

[Tue Mar 28 12:10:03 2023]
Finished job 636.
567 of 695 steps (82%) done
[Tue Mar 28 12:10:46 2023]
Finished job 468.
568 of 695 steps (82%) done
[Tue Mar 28 12:10:50 2023]
Finished job 461.
569 of 695 steps (82%) done
[Tue Mar 28 12:12:17 2023]
Finished job 410.
570 of 695 steps (82%) done
[Tue Mar 28 12:12:29 2023]
Finished job 692.
571 of 695 steps (82%) done
[Tue Mar 28 12:13:34 2023]
Finished job 488.
572 of 695 steps (82%) done
[Tue Mar 28 12:13:53 2023]
Finished job 607.
573 of 695 steps (82%) done
[Tue Mar 28 12:13:55 2023]
Finished job 551.
574 of 695 steps (83%) done
[Tue Mar 28 12:14:05 2023]
Finished job 495.
575 of 695 steps (83%) done
[Tue Mar 28 12:14:16 2023]
Finished job 440.
576 of 695 steps (83%) done
[Tue Mar 28 12:14:26 2023]
Finished job 663.
577 of 695 steps (83%) done
[Tue Mar 28 12:14:33 2023]
Finished job 544.
578 of 695 steps (83%) done
Select jobs to execute...

[Tue Mar 28 12:14:33 2023]
rule fixErrors:
    input: 0-correction/hifi.seqStore, 0-correction/hifi.ovlStore, 0-correction/find-errors-jobs/0001.red, 0-correction/find-errors-jobs/0002.red, 0-correction/find-errors-jobs/0003.red, 0-correction/find-errors-jobs/0004.red, 0-correction/find-errors-jobs/0005.red, 0-correction/find-errors-jobs/0006.red, 0-correction/find-errors-jobs/0007.red, 0-correction/find-errors-jobs/0008.red, 0-correction/find-errors-jobs/0009.red, 0-correction/find-errors-jobs/0010.red, 0-correction/find-errors-jobs/0011.red, 0-correction/find-errors-jobs/0012.red, 0-correction/find-errors-jobs/0013.red, 0-correction/find-errors-jobs/0014.red, 0-correction/find-errors-jobs/0015.red, 0-correction/find-errors-jobs/0016.red, 0-correction/find-errors-jobs/0017.red, 0-correction/find-errors-jobs/0018.red, 0-correction/find-errors-jobs/0019.red, 0-correction/find-errors-jobs/0020.red, 0-correction/find-errors-jobs/0021.red, 0-correction/find-errors-jobs/0022.red, 0-correction/find-errors-jobs/0023.red, 0-correction/find-errors-jobs/0024.red, 0-correction/find-errors-jobs/0025.red, 0-correction/find-errors-jobs/0026.red, 0-correction/find-errors-jobs/0027.red, 0-correction/find-errors-jobs/0028.red, 0-correction/find-errors-jobs/0029.red, 0-correction/find-errors-jobs/0030.red, 0-correction/find-errors-jobs/0031.red, 0-correction/find-errors-jobs/0032.red, 0-correction/find-errors-jobs/0033.red, 0-correction/find-errors-jobs/0034.red, 0-correction/find-errors-jobs/0035.red, 0-correction/find-errors-jobs/0036.red, 0-correction/find-errors-jobs/0037.red, 0-correction/find-errors-jobs/0038.red, 0-correction/find-errors-jobs/0039.red, 0-correction/find-errors-jobs/0040.red, 0-correction/find-errors-jobs/0041.red, 0-correction/find-errors-jobs/0042.red, 0-correction/find-errors-jobs/0043.red, 0-correction/find-errors-jobs/0044.red, 0-correction/find-errors-jobs/0045.red, 0-correction/find-errors-jobs/0046.red, 0-correction/find-errors-jobs/0047.red, 0-correction/find-errors-jobs/0048.red, 0-correction/find-errors-jobs/0049.red, 0-correction/find-errors-jobs/0050.red, 0-correction/find-errors-jobs/0051.red, 0-correction/find-errors-jobs/0052.red, 0-correction/find-errors-jobs/0053.red, 0-correction/find-errors-jobs/0054.red, 0-correction/find-errors-jobs/0055.red, 0-correction/find-errors-jobs/0056.red, 0-correction/find-errors-jobs/0057.red, 0-correction/find-errors-jobs/0058.red, 0-correction/find-errors-jobs/0059.red, 0-correction/find-errors-jobs/0060.red, 0-correction/find-errors-jobs/0061.red, 0-correction/find-errors-jobs/0062.red, 0-correction/find-errors-jobs/0063.red, 0-correction/find-errors-jobs/0064.red, 0-correction/find-errors-jobs/0065.red, 0-correction/find-errors-jobs/0066.red, 0-correction/find-errors-jobs/0067.red, 0-correction/find-errors-jobs/0068.red, 0-correction/find-errors-jobs/0069.red, 0-correction/find-errors-jobs/0070.red, 0-correction/find-errors-jobs/0071.red, 0-correction/find-errors-jobs/0072.red, 0-correction/find-errors-jobs/0073.red, 0-correction/find-errors-jobs/0074.red, 0-correction/find-errors-jobs/0075.red, 0-correction/find-errors-jobs/0076.red, 0-correction/find-errors-jobs/0077.red, 0-correction/find-errors-jobs/0078.red, 0-correction/find-errors-jobs/0079.red, 0-correction/find-errors-jobs/0080.red, 0-correction/find-errors-jobs/0081.red, 0-correction/find-errors-jobs/0082.red, 0-correction/find-errors-jobs/0083.red, 0-correction/find-errors-jobs/0084.red, 0-correction/find-errors-jobs/0085.red, 0-correction/find-errors-jobs/0086.red, 0-correction/find-errors-jobs/0087.red, 0-correction/find-errors-jobs/0088.red, 0-correction/find-errors-jobs/0089.red, 0-correction/find-errors-jobs/0090.red, 0-correction/find-errors-jobs/0091.red, 0-correction/find-errors-jobs/0092.red, 0-correction/find-errors-jobs/0093.red, 0-correction/find-errors-jobs/0094.red, 0-correction/find-errors-jobs/0095.red, 0-correction/find-errors-jobs/0096.red, 0-correction/find-errors-jobs/0097.red, 0-correction/find-errors-jobs/0098.red, 0-correction/find-errors-jobs/0099.red, 0-correction/find-errors-jobs/0100.red, 0-correction/find-errors-jobs/0101.red, 0-correction/find-errors-jobs/0102.red, 0-correction/find-errors-jobs/0103.red, 0-correction/find-errors-jobs/0104.red, 0-correction/find-errors-jobs/0105.red, 0-correction/find-errors-jobs/0106.red, 0-correction/find-errors-jobs/0107.red, 0-correction/find-errors-jobs/0108.red, 0-correction/find-errors-jobs/0109.red, 0-correction/find-errors-jobs/0110.red, 0-correction/find-errors-jobs/0111.red, 0-correction/find-errors-jobs/0112.red, 0-correction/find-errors-jobs/0113.red, 0-correction/find-errors-jobs/0114.red, 0-correction/find-errors-jobs/0115.red, 0-correction/find-errors-jobs/0116.red, 0-correction/find-errors-jobs/0117.red, 0-correction/find-errors-jobs/0118.red, 0-correction/find-errors-jobs/0119.red, 0-correction/find-errors-jobs/0120.red, 0-correction/find-errors-jobs/0121.red, 0-correction/find-errors-jobs/0122.red, 0-correction/find-errors-jobs/0123.red, 0-correction/find-errors-jobs/0124.red, 0-correction/find-errors-jobs/0125.red, 0-correction/find-errors-jobs/0126.red, 0-correction/find-errors-jobs/0127.red, 0-correction/find-errors-jobs/0128.red, 0-correction/find-errors-jobs/0129.red, 0-correction/find-errors-jobs/0130.red, 0-correction/find-errors-jobs/0131.red, 0-correction/find-errors-jobs/0132.red, 0-correction/find-errors-jobs/0133.red, 0-correction/find-errors-jobs/0134.red, 0-correction/find-errors-jobs/0135.red, 0-correction/find-errors-jobs/0136.red, 0-correction/find-errors-jobs/0137.red, 0-correction/find-errors-jobs/0138.red, 0-correction/find-errors-jobs/0139.red, 0-correction/find-errors-jobs/0140.red, 0-correction/find-errors-jobs/0141.red, 0-correction/find-errors-jobs/0142.red, 0-correction/find-errors-jobs/0143.red, 0-correction/find-errors-jobs/0144.red, 0-correction/find-errors-jobs/0145.red, 0-correction/find-errors-jobs/0146.red, 0-correction/find-errors-jobs/0147.red, 0-correction/find-errors-jobs/0148.red, 0-correction/find-errors-jobs/0149.red, 0-correction/find-errors-jobs/0150.red, 0-correction/find-errors-jobs/0151.red, 0-correction/find-errors-jobs/0152.red, 0-correction/find-errors-jobs/0153.red, 0-correction/find-errors-jobs/0154.red, 0-correction/find-errors-jobs/0155.red, 0-correction/find-errors-jobs/0156.red, 0-correction/find-errors-jobs/0157.red, 0-correction/find-errors-jobs/0158.red, 0-correction/find-errors-jobs/0159.red, 0-correction/find-errors-jobs/0160.red, 0-correction/find-errors-jobs/0161.red, 0-correction/find-errors-jobs/0162.red, 0-correction/find-errors-jobs/0163.red, 0-correction/find-errors-jobs/0164.red, 0-correction/find-errors-jobs/0165.red, 0-correction/find-errors-jobs/0166.red, 0-correction/find-errors-jobs/0167.red, 0-correction/find-errors-jobs/0168.red, 0-correction/find-errors-jobs/0169.red, 0-correction/find-errors-jobs/0170.red, 0-correction/find-errors-jobs/0171.red, 0-correction/find-errors-jobs/0172.red, 0-correction/find-errors-jobs/0173.red, 0-correction/find-errors-jobs/0174.red, 0-correction/find-errors-jobs/0175.red, 0-correction/find-errors-jobs/0176.red, 0-correction/find-errors-jobs/0177.red, 0-correction/find-errors-jobs/0178.red, 0-correction/find-errors-jobs/0179.red, 0-correction/find-errors-jobs/0180.red, 0-correction/find-errors-jobs/0181.red, 0-correction/find-errors-jobs/0182.red, 0-correction/find-errors-jobs/0183.red, 0-correction/find-errors-jobs/0184.red, 0-correction/find-errors-jobs/0185.red, 0-correction/find-errors-jobs/0186.red, 0-correction/find-errors-jobs/0187.red, 0-correction/find-errors-jobs/0188.red, 0-correction/find-errors-jobs/0189.red, 0-correction/find-errors-jobs/0190.red, 0-correction/find-errors-jobs/0191.red, 0-correction/find-errors-jobs/0192.red, 0-correction/find-errors-jobs/0193.red, 0-correction/find-errors-jobs/0194.red, 0-correction/find-errors-jobs/0195.red, 0-correction/find-errors-jobs/0196.red, 0-correction/find-errors-jobs/0197.red, 0-correction/find-errors-jobs/0198.red, 0-correction/find-errors-jobs/0199.red, 0-correction/find-errors-jobs/0200.red, 0-correction/find-errors-jobs/0201.red, 0-correction/find-errors-jobs/0202.red, 0-correction/find-errors-jobs/0203.red, 0-correction/find-errors-jobs/0204.red, 0-correction/find-errors-jobs/0205.red, 0-correction/find-errors-jobs/0206.red, 0-correction/find-errors-jobs/0207.red, 0-correction/find-errors-jobs/0208.red, 0-correction/find-errors-jobs/0209.red, 0-correction/find-errors-jobs/0210.red, 0-correction/find-errors-jobs/0211.red, 0-correction/find-errors-jobs/0212.red, 0-correction/find-errors-jobs/0213.red, 0-correction/find-errors-jobs/0214.red, 0-correction/find-errors-jobs/0215.red, 0-correction/find-errors-jobs/0216.red, 0-correction/find-errors-jobs/0217.red, 0-correction/find-errors-jobs/0218.red, 0-correction/find-errors-jobs/0219.red, 0-correction/find-errors-jobs/0220.red, 0-correction/find-errors-jobs/0221.red, 0-correction/find-errors-jobs/0222.red, 0-correction/find-errors-jobs/0223.red, 0-correction/find-errors-jobs/0224.red, 0-correction/find-errors-jobs/0225.red, 0-correction/find-errors-jobs/0226.red, 0-correction/find-errors-jobs/0227.red, 0-correction/find-errors-jobs/0228.red, 0-correction/find-errors-jobs/0229.red, 0-correction/find-errors-jobs/0230.red, 0-correction/find-errors-jobs/0231.red, 0-correction/find-errors-jobs/0232.red, 0-correction/find-errors-jobs/0233.red, 0-correction/find-errors-jobs/0234.red, 0-correction/find-errors-jobs/0235.red, 0-correction/find-errors-jobs/0236.red, 0-correction/find-errors-jobs/0237.red, 0-correction/find-errors-jobs/0238.red, 0-correction/find-errors-jobs/0239.red, 0-correction/find-errors-jobs/0240.red, 0-correction/find-errors-jobs/0241.red, 0-correction/find-errors-jobs/0242.red, 0-correction/find-errors-jobs/0243.red, 0-correction/find-errors-jobs/0244.red, 0-correction/find-errors-jobs/0245.red, 0-correction/find-errors-jobs/0246.red, 0-correction/find-errors-jobs/0247.red, 0-correction/find-errors-jobs/0248.red, 0-correction/find-errors-jobs/0249.red, 0-correction/find-errors-jobs/0250.red, 0-correction/find-errors-jobs/0251.red, 0-correction/find-errors-jobs/0252.red, 0-correction/find-errors-jobs/0253.red, 0-correction/find-errors-jobs/0254.red, 0-correction/find-errors-jobs/0255.red, 0-correction/find-errors-jobs/0256.red, 0-correction/find-errors-jobs/0257.red, 0-correction/find-errors-jobs/0258.red, 0-correction/find-errors-jobs/0259.red, 0-correction/find-errors-jobs/0260.red, 0-correction/find-errors-jobs/0261.red, 0-correction/find-errors-jobs/0262.red, 0-correction/find-errors-jobs/0263.red, 0-correction/find-errors-jobs/0264.red, 0-correction/find-errors-jobs/0265.red, 0-correction/find-errors-jobs/0266.red, 0-correction/find-errors-jobs/0267.red, 0-correction/find-errors-jobs/0268.red, 0-correction/find-errors-jobs/0269.red, 0-correction/find-errors-jobs/0270.red, 0-correction/find-errors-jobs/0271.red, 0-correction/find-errors-jobs/0272.red, 0-correction/find-errors-jobs/0273.red, 0-correction/find-errors-jobs/0274.red, 0-correction/find-errors-jobs/0275.red, 0-correction/find-errors-jobs/0276.red, 0-correction/find-errors-jobs/0277.red, 0-correction/find-errors-jobs/0278.red, 0-correction/find-errors-jobs/0279.red, 0-correction/find-errors-jobs/0280.red, 0-correction/find-errors-jobs/0281.red, 0-correction/find-errors-jobs/0282.red, 0-correction/find-errors-jobs/0283.red, 0-correction/find-errors-jobs/0284.red, 0-correction/find-errors-jobs/0285.red, 0-correction/find-errors-jobs/0286.red, 0-correction/find-errors-jobs/0287.red, 0-correction/find-errors-jobs/0288.red, 0-correction/find-errors-jobs/0289.red, 0-correction/find-errors-jobs/0290.red, 0-correction/find-errors-jobs/0291.red, 0-correction/find-errors-jobs/0292.red, 0-correction/find-errors-jobs/0293.red, 0-correction/find-errors-jobs/0294.red, 0-correction/find-errors-jobs/0295.red, 0-correction/find-errors-jobs/0296.red, 0-correction/find-errors-jobs/0297.red, 0-correction/find-errors-jobs/0298.red, 0-correction/find-errors-jobs/0299.red, 0-correction/find-errors-jobs/0300.red, 0-correction/configureFindErrors.finished
    output: 0-correction/red.red, 0-correction/hifi-corrected.fasta.gz
    log: 0-correction/fixErrors.err
    jobid: 6
    reason: Missing output files: 0-correction/hifi-corrected.fasta.gz; Input files updated by another job: 0-correction/find-errors-jobs/0091.red, 0-correction/find-errors-jobs/0048.red, 0-correction/find-errors-jobs/0247.red, 0-correction/find-errors-jobs/0220.red, 0-correction/find-errors-jobs/0051.red, 0-correction/find-errors-jobs/0129.red, 0-correction/find-errors-jobs/0266.red, 0-correction/find-errors-jobs/0204.red, 0-correction/find-errors-jobs/0017.red, 0-correction/find-errors-jobs/0137.red, 0-correction/find-errors-jobs/0267.red, 0-correction/find-errors-jobs/0237.red, 0-correction/find-errors-jobs/0296.red, 0-correction/find-errors-jobs/0198.red, 0-correction/find-errors-jobs/0207.red, 0-correction/find-errors-jobs/0279.red, 0-correction/find-errors-jobs/0006.red, 0-correction/find-errors-jobs/0055.red, 0-correction/find-errors-jobs/0035.red, 0-correction/find-errors-jobs/0243.red, 0-correction/find-errors-jobs/0010.red, 0-correction/find-errors-jobs/0295.red, 0-correction/find-errors-jobs/0063.red, 0-correction/find-errors-jobs/0155.red, 0-correction/find-errors-jobs/0250.red, 0-correction/find-errors-jobs/0088.red, 0-correction/find-errors-jobs/0014.red, 0-correction/find-errors-jobs/0218.red, 0-correction/find-errors-jobs/0228.red, 0-correction/find-errors-jobs/0292.red, 0-correction/find-errors-jobs/0179.red, 0-correction/find-errors-jobs/0128.red, 0-correction/find-errors-jobs/0269.red, 0-correction/find-errors-jobs/0185.red, 0-correction/find-errors-jobs/0015.red, 0-correction/find-errors-jobs/0259.red, 0-correction/find-errors-jobs/0020.red, 0-correction/find-errors-jobs/0213.red, 0-correction/find-errors-jobs/0278.red, 0-correction/find-errors-jobs/0244.red, 0-correction/find-errors-jobs/0005.red, 0-correction/find-errors-jobs/0079.red, 0-correction/find-errors-jobs/0158.red, 0-correction/find-errors-jobs/0167.red, 0-correction/find-errors-jobs/0016.red, 0-correction/find-errors-jobs/0177.red, 0-correction/find-errors-jobs/0024.red, 0-correction/find-errors-jobs/0050.red, 0-correction/find-errors-jobs/0093.red, 0-correction/find-errors-jobs/0121.red, 0-correction/find-errors-jobs/0009.red, 0-correction/find-errors-jobs/0285.red, 0-correction/find-errors-jobs/0058.red, 0-correction/find-errors-jobs/0081.red, 0-correction/find-errors-jobs/0299.red, 0-correction/find-errors-jobs/0124.red, 0-correction/find-errors-jobs/0188.red, 0-correction/find-errors-jobs/0046.red, 0-correction/find-errors-jobs/0103.red, 0-correction/find-errors-jobs/0163.red, 0-correction/find-errors-jobs/0076.red, 0-correction/find-errors-jobs/0194.red, 0-correction/find-errors-jobs/0229.red, 0-correction/find-errors-jobs/0068.red, 0-correction/find-errors-jobs/0196.red, 0-correction/find-errors-jobs/0253.red, 0-correction/find-errors-jobs/0192.red, 0-correction/find-errors-jobs/0191.red, 0-correction/find-errors-jobs/0097.red, 0-correction/find-errors-jobs/0197.red, 0-correction/find-errors-jobs/0084.red, 0-correction/find-errors-jobs/0064.red, 0-correction/find-errors-jobs/0092.red, 0-correction/find-errors-jobs/0053.red, 0-correction/find-errors-jobs/0108.red, 0-correction/find-errors-jobs/0123.red, 0-correction/find-errors-jobs/0175.red, 0-correction/find-errors-jobs/0246.red, 0-correction/find-errors-jobs/0251.red, 0-correction/find-errors-jobs/0274.red, 0-correction/find-errors-jobs/0283.red, 0-correction/find-errors-jobs/0287.red, 0-correction/find-errors-jobs/0113.red, 0-correction/find-errors-jobs/0118.red, 0-correction/find-errors-jobs/0193.red, 0-correction/find-errors-jobs/0187.red, 0-correction/find-errors-jobs/0119.red, 0-correction/find-errors-jobs/0203.red, 0-correction/find-errors-jobs/0022.red, 0-correction/find-errors-jobs/0075.red, 0-correction/find-errors-jobs/0162.red, 0-correction/find-errors-jobs/0226.red, 0-correction/find-errors-jobs/0294.red, 0-correction/find-errors-jobs/0225.red, 0-correction/find-errors-jobs/0060.red, 0-correction/find-errors-jobs/0110.red, 0-correction/find-errors-jobs/0235.red, 0-correction/find-errors-jobs/0007.red, 0-correction/find-errors-jobs/0230.red, 0-correction/find-errors-jobs/0206.red, 0-correction/find-errors-jobs/0276.red, 0-correction/find-errors-jobs/0072.red, 0-correction/find-errors-jobs/0169.red, 0-correction/find-errors-jobs/0025.red, 0-correction/find-errors-jobs/0205.red, 0-correction/find-errors-jobs/0150.red, 0-correction/find-errors-jobs/0132.red, 0-correction/find-errors-jobs/0184.red, 0-correction/find-errors-jobs/0282.red, 0-correction/find-errors-jobs/0156.red, 0-correction/find-errors-jobs/0288.red, 0-correction/find-errors-jobs/0027.red, 0-correction/find-errors-jobs/0080.red, 0-correction/find-errors-jobs/0057.red, 0-correction/find-errors-jobs/0102.red, 0-correction/find-errors-jobs/0109.red, 0-correction/find-errors-jobs/0003.red, 0-correction/find-errors-jobs/0214.red, 0-correction/find-errors-jobs/0233.red, 0-correction/find-errors-jobs/0261.red, 0-correction/find-errors-jobs/0262.red, 0-correction/find-errors-jobs/0275.red, 0-correction/find-errors-jobs/0090.red, 0-correction/find-errors-jobs/0120.red, 0-correction/find-errors-jobs/0002.red, 0-correction/find-errors-jobs/0071.red, 0-correction/find-errors-jobs/0212.red, 0-correction/find-errors-jobs/0277.red, 0-correction/find-errors-jobs/0114.red, 0-correction/find-errors-jobs/0059.red, 0-correction/find-errors-jobs/0180.red, 0-correction/find-errors-jobs/0202.red, 0-correction/find-errors-jobs/0249.red, 0-correction/find-errors-jobs/0073.red, 0-correction/find-errors-jobs/0172.red, 0-correction/find-errors-jobs/0174.red, 0-correction/find-errors-jobs/0182.red, 0-correction/find-errors-jobs/0238.red, 0-correction/find-errors-jobs/0086.red, 0-correction/find-errors-jobs/0159.red, 0-correction/find-errors-jobs/0240.red, 0-correction/find-errors-jobs/0139.red, 0-correction/find-errors-jobs/0248.red, 0-correction/find-errors-jobs/0183.red, 0-correction/find-errors-jobs/0070.red, 0-correction/find-errors-jobs/0019.red, 0-correction/find-errors-jobs/0034.red, 0-correction/find-errors-jobs/0054.red, 0-correction/find-errors-jobs/0125.red, 0-correction/find-errors-jobs/0186.red, 0-correction/find-errors-jobs/0031.red, 0-correction/find-errors-jobs/0106.red, 0-correction/find-errors-jobs/0215.red, 0-correction/find-errors-jobs/0231.red, 0-correction/find-errors-jobs/0265.red, 0-correction/find-errors-jobs/0142.red, 0-correction/find-errors-jobs/0144.red, 0-correction/find-errors-jobs/0001.red, 0-correction/find-errors-jobs/0133.red, 0-correction/find-errors-jobs/0173.red, 0-correction/find-errors-jobs/0157.red, 0-correction/find-errors-jobs/0171.red, 0-correction/find-errors-jobs/0042.red, 0-correction/find-errors-jobs/0146.red, 0-correction/find-errors-jobs/0272.red, 0-correction/find-errors-jobs/0195.red, 0-correction/find-errors-jobs/0222.red, 0-correction/find-errors-jobs/0094.red, 0-correction/find-errors-jobs/0260.red, 0-correction/find-errors-jobs/0293.red, 0-correction/find-errors-jobs/0147.red, 0-correction/find-errors-jobs/0052.red, 0-correction/find-errors-jobs/0056.red, 0-correction/find-errors-jobs/0143.red, 0-correction/find-errors-jobs/0189.red, 0-correction/find-errors-jobs/0029.red, 0-correction/find-errors-jobs/0011.red, 0-correction/find-errors-jobs/0210.red, 0-correction/find-errors-jobs/0234.red, 0-correction/find-errors-jobs/0239.red, 0-correction/find-errors-jobs/0047.red, 0-correction/find-errors-jobs/0300.red, 0-correction/find-errors-jobs/0130.red, 0-correction/find-errors-jobs/0168.red, 0-correction/find-errors-jobs/0242.red, 0-correction/find-errors-jobs/0152.red, 0-correction/find-errors-jobs/0141.red, 0-correction/find-errors-jobs/0030.red, 0-correction/find-errors-jobs/0061.red, 0-correction/find-errors-jobs/0127.red, 0-correction/find-errors-jobs/0164.red, 0-correction/find-errors-jobs/0066.red, 0-correction/find-errors-jobs/0211.red, 0-correction/find-errors-jobs/0062.red, 0-correction/find-errors-jobs/0290.red, 0-correction/find-errors-jobs/0041.red, 0-correction/find-errors-jobs/0049.red, 0-correction/find-errors-jobs/0098.red, 0-correction/find-errors-jobs/0105.red, 0-correction/find-errors-jobs/0217.red, 0-correction/find-errors-jobs/0209.red, 0-correction/find-errors-jobs/0101.red, 0-correction/find-errors-jobs/0089.red, 0-correction/find-errors-jobs/0257.red, 0-correction/find-errors-jobs/0131.red, 0-correction/find-errors-jobs/0153.red, 0-correction/find-errors-jobs/0065.red, 0-correction/find-errors-jobs/0099.red, 0-correction/find-errors-jobs/0038.red, 0-correction/find-errors-jobs/0208.red, 0-correction/find-errors-jobs/0190.red, 0-correction/find-errors-jobs/0012.red, 0-correction/find-errors-jobs/0036.red, 0-correction/find-errors-jobs/0291.red, 0-correction/find-errors-jobs/0297.red, 0-correction/find-errors-jobs/0116.red, 0-correction/find-errors-jobs/0126.red, 0-correction/find-errors-jobs/0178.red, 0-correction/find-errors-jobs/0268.red, 0-correction/find-errors-jobs/0224.red, 0-correction/find-errors-jobs/0254.red, 0-correction/find-errors-jobs/0263.red, 0-correction/find-errors-jobs/0154.red, 0-correction/find-errors-jobs/0145.red, 0-correction/find-errors-jobs/0273.red, 0-correction/find-errors-jobs/0112.red, 0-correction/find-errors-jobs/0199.red, 0-correction/find-errors-jobs/0245.red, 0-correction/find-errors-jobs/0166.red, 0-correction/find-errors-jobs/0286.red, 0-correction/find-errors-jobs/0078.red, 0-correction/find-errors-jobs/0082.red, 0-correction/find-errors-jobs/0087.red, 0-correction/find-errors-jobs/0111.red, 0-correction/find-errors-jobs/0135.red, 0-correction/find-errors-jobs/0151.red, 0-correction/find-errors-jobs/0201.red, 0-correction/find-errors-jobs/0255.red, 0-correction/find-errors-jobs/0223.red, 0-correction/find-errors-jobs/0074.red, 0-correction/find-errors-jobs/0181.red, 0-correction/find-errors-jobs/0160.red, 0-correction/find-errors-jobs/0032.red, 0-correction/find-errors-jobs/0122.red, 0-correction/find-errors-jobs/0200.red, 0-correction/find-errors-jobs/0043.red, 0-correction/find-errors-jobs/0104.red, 0-correction/find-errors-jobs/0264.red, 0-correction/find-errors-jobs/0018.red, 0-correction/find-errors-jobs/0028.red, 0-correction/find-errors-jobs/0045.red, 0-correction/find-errors-jobs/0115.red, 0-correction/find-errors-jobs/0270.red, 0-correction/find-errors-jobs/0136.red, 0-correction/find-errors-jobs/0258.red, 0-correction/find-errors-jobs/0281.red, 0-correction/find-errors-jobs/0044.red, 0-correction/find-errors-jobs/0026.red, 0-correction/find-errors-jobs/0117.red, 0-correction/find-errors-jobs/0256.red, 0-correction/find-errors-jobs/0083.red, 0-correction/find-errors-jobs/0221.red, 0-correction/find-errors-jobs/0021.red, 0-correction/find-errors-jobs/0033.red, 0-correction/find-errors-jobs/0138.red, 0-correction/find-errors-jobs/0236.red, 0-correction/find-errors-jobs/0085.red, 0-correction/find-errors-jobs/0165.red, 0-correction/find-errors-jobs/0039.red, 0-correction/find-errors-jobs/0013.red, 0-correction/find-errors-jobs/0107.red, 0-correction/find-errors-jobs/0232.red, 0-correction/find-errors-jobs/0148.red, 0-correction/find-errors-jobs/0067.red, 0-correction/find-errors-jobs/0077.red, 0-correction/find-errors-jobs/0134.red, 0-correction/find-errors-jobs/0284.red, 0-correction/find-errors-jobs/0149.red, 0-correction/find-errors-jobs/0161.red, 0-correction/find-errors-jobs/0023.red, 0-correction/find-errors-jobs/0040.red, 0-correction/find-errors-jobs/0100.red, 0-correction/find-errors-jobs/0216.red, 0-correction/find-errors-jobs/0096.red, 0-correction/find-errors-jobs/0069.red, 0-correction/find-errors-jobs/0227.red, 0-correction/find-errors-jobs/0170.red, 0-correction/find-errors-jobs/0252.red, 0-correction/find-errors-jobs/0298.red, 0-correction/find-errors-jobs/0004.red, 0-correction/find-errors-jobs/0271.red, 0-correction/find-errors-jobs/0241.red, 0-correction/find-errors-jobs/0176.red, 0-correction/find-errors-jobs/0219.red, 0-correction/find-errors-jobs/0095.red, 0-correction/find-errors-jobs/0289.red, 0-correction/find-errors-jobs/0280.red, 0-correction/find-errors-jobs/0140.red, 0-correction/find-errors-jobs/0008.red, 0-correction/find-errors-jobs/0037.red
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=4

[Tue Mar 28 12:50:29 2023]
Finished job 6.
579 of 695 steps (83%) done
Select jobs to execute...

[Tue Mar 28 12:50:29 2023]
localrule correctHiFi:
    input: 0-correction/hifi-corrected.fasta.gz
    output: hifi-corrected.fasta.gz
    jobid: 5
    reason: Missing output files: hifi-corrected.fasta.gz; Input files updated by another job: 0-correction/hifi-corrected.fasta.gz
    resources: tmpdir=/data/tmp, n_cpus=1, mem_gb=1, time_h=1

[Tue Mar 28 12:50:29 2023]
Finished job 5.
580 of 695 steps (83%) done
Select jobs to execute...

[Tue Mar 28 12:50:29 2023]
rule buildGraph:
    input: hifi-corrected.fasta.gz
    output: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/hifi_nodecov.csv, 1-buildGraph/paths.gaf
    log: 1-buildGraph/buildGraph.err
    jobid: 4
    reason: Missing output files: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf, 1-buildGraph/hifi_nodecov.csv; Input files updated by another job: hifi-corrected.fasta.gz
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=36, time_h=72

[Wed Mar 29 10:02:38 2023]
Finished job 4.
581 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 10:02:38 2023]
rule processGraph:
    input: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf
    output: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 2-processGraph/unitig-mapping-1.txt
    log: 2-processGraph/process.err
    jobid: 3
    reason: Missing output files: 2-processGraph/unitig-unrolled-hifi-resolved.gfa; Input files updated by another job: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24

[Wed Mar 29 10:14:17 2023]
Finished job 3.
582 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 10:14:17 2023]
rule indexGraph:
    input: 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/graph.index
    log: 3-align/index.err
    jobid: 301
    reason: Missing output files: 3-align/graph.index; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=85, time_h=24

[Wed Mar 29 11:16:52 2023]
Finished job 301.
583 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 11:16:52 2023]
rule alignONT:
    input: 3-align/split/ont002.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned002.gaf
    log: 3-align/aligned002.err
    jobid: 302
    reason: Missing output files: 3-align/aligned002.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=002
    threads: 24
    resources: tmpdir=/data/tmp, job_id=2, n_cpus=24, mem_gb=23, time_h=24


[Wed Mar 29 11:16:52 2023]
rule alignONT:
    input: 3-align/split/ont055.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned055.gaf
    log: 3-align/aligned055.err
    jobid: 355
    reason: Missing output files: 3-align/aligned055.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=055
    threads: 24
    resources: tmpdir=/data/tmp, job_id=55, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 11:34:41 2023]
Finished job 302.
584 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 11:34:42 2023]
rule alignONT:
    input: 3-align/split/ont072.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned072.gaf
    log: 3-align/aligned072.err
    jobid: 372
    reason: Missing output files: 3-align/aligned072.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=072
    threads: 24
    resources: tmpdir=/data/tmp, job_id=72, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 11:38:19 2023]
Finished job 355.
585 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 11:38:19 2023]
rule alignONT:
    input: 3-align/split/ont016.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned016.gaf
    log: 3-align/aligned016.err
    jobid: 316
    reason: Missing output files: 3-align/aligned016.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=016
    threads: 24
    resources: tmpdir=/data/tmp, job_id=16, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 11:55:51 2023]
Finished job 372.
586 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 11:55:51 2023]
rule alignONT:
    input: 3-align/split/ont045.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned045.gaf
    log: 3-align/aligned045.err
    jobid: 345
    reason: Missing output files: 3-align/aligned045.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=045
    threads: 24
    resources: tmpdir=/data/tmp, job_id=45, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 11:57:53 2023]
Finished job 316.
587 of 695 steps (84%) done
Select jobs to execute...

[Wed Mar 29 11:57:53 2023]
rule alignONT:
    input: 3-align/split/ont073.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned073.gaf
    log: 3-align/aligned073.err
    jobid: 373
    reason: Missing output files: 3-align/aligned073.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=073
    threads: 24
    resources: tmpdir=/data/tmp, job_id=73, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 12:17:45 2023]
Finished job 345.
588 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 12:17:46 2023]
rule alignONT:
    input: 3-align/split/ont044.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned044.gaf
    log: 3-align/aligned044.err
    jobid: 344
    reason: Missing output files: 3-align/aligned044.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=044
    threads: 24
    resources: tmpdir=/data/tmp, job_id=44, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 12:19:18 2023]
Finished job 373.
589 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 12:19:19 2023]
rule alignONT:
    input: 3-align/split/ont017.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned017.gaf
    log: 3-align/aligned017.err
    jobid: 317
    reason: Missing output files: 3-align/aligned017.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=017
    threads: 24
    resources: tmpdir=/data/tmp, job_id=17, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 12:39:46 2023]
Finished job 344.
590 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 12:39:46 2023]
rule alignONT:
    input: 3-align/split/ont046.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned046.gaf
    log: 3-align/aligned046.err
    jobid: 346
    reason: Missing output files: 3-align/aligned046.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=046
    threads: 24
    resources: tmpdir=/data/tmp, job_id=46, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 12:40:21 2023]
Finished job 317.
591 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 12:40:21 2023]
rule alignONT:
    input: 3-align/split/ont018.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned018.gaf
    log: 3-align/aligned018.err
    jobid: 318
    reason: Missing output files: 3-align/aligned018.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=018
    threads: 24
    resources: tmpdir=/data/tmp, job_id=18, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:01:24 2023]
Finished job 318.
592 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 13:01:24 2023]
rule alignONT:
    input: 3-align/split/ont037.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned037.gaf
    log: 3-align/aligned037.err
    jobid: 337
    reason: Missing output files: 3-align/aligned037.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=037
    threads: 24
    resources: tmpdir=/data/tmp, job_id=37, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:01:35 2023]
Finished job 346.
593 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 13:01:35 2023]
rule alignONT:
    input: 3-align/split/ont065.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned065.gaf
    log: 3-align/aligned065.err
    jobid: 365
    reason: Missing output files: 3-align/aligned065.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=065
    threads: 24
    resources: tmpdir=/data/tmp, job_id=65, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:23:33 2023]
Finished job 337.
594 of 695 steps (85%) done
Select jobs to execute...

[Wed Mar 29 13:23:33 2023]
rule alignONT:
    input: 3-align/split/ont013.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned013.gaf
    log: 3-align/aligned013.err
    jobid: 313
    reason: Missing output files: 3-align/aligned013.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=013
    threads: 24
    resources: tmpdir=/data/tmp, job_id=13, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:23:45 2023]
Finished job 365.
595 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 13:23:45 2023]
rule alignONT:
    input: 3-align/split/ont038.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned038.gaf
    log: 3-align/aligned038.err
    jobid: 338
    reason: Missing output files: 3-align/aligned038.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=038
    threads: 24
    resources: tmpdir=/data/tmp, job_id=38, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:42:35 2023]
Finished job 313.
596 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 13:42:35 2023]
rule alignONT:
    input: 3-align/split/ont019.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned019.gaf
    log: 3-align/aligned019.err
    jobid: 319
    reason: Missing output files: 3-align/aligned019.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=019
    threads: 24
    resources: tmpdir=/data/tmp, job_id=19, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 13:45:11 2023]
Finished job 338.
597 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 13:45:11 2023]
rule alignONT:
    input: 3-align/split/ont048.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned048.gaf
    log: 3-align/aligned048.err
    jobid: 348
    reason: Missing output files: 3-align/aligned048.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=048
    threads: 24
    resources: tmpdir=/data/tmp, job_id=48, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:03:30 2023]
Finished job 319.
598 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 14:03:30 2023]
rule alignONT:
    input: 3-align/split/ont020.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned020.gaf
    log: 3-align/aligned020.err
    jobid: 320
    reason: Missing output files: 3-align/aligned020.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=020
    threads: 24
    resources: tmpdir=/data/tmp, job_id=20, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:07:18 2023]
Finished job 348.
599 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 14:07:18 2023]
rule alignONT:
    input: 3-align/split/ont076.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned076.gaf
    log: 3-align/aligned076.err
    jobid: 376
    reason: Missing output files: 3-align/aligned076.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=076
    threads: 24
    resources: tmpdir=/data/tmp, job_id=76, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:24:53 2023]
Finished job 320.
600 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 14:24:53 2023]
rule alignONT:
    input: 3-align/split/ont075.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned075.gaf
    log: 3-align/aligned075.err
    jobid: 375
    reason: Missing output files: 3-align/aligned075.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=075
    threads: 24
    resources: tmpdir=/data/tmp, job_id=75, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:28:45 2023]
Finished job 376.
601 of 695 steps (86%) done
Select jobs to execute...

[Wed Mar 29 14:28:46 2023]
rule alignONT:
    input: 3-align/split/ont049.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned049.gaf
    log: 3-align/aligned049.err
    jobid: 349
    reason: Missing output files: 3-align/aligned049.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=049
    threads: 24
    resources: tmpdir=/data/tmp, job_id=49, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:45:56 2023]
Finished job 375.
602 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 14:45:56 2023]
rule alignONT:
    input: 3-align/split/ont077.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned077.gaf
    log: 3-align/aligned077.err
    jobid: 377
    reason: Missing output files: 3-align/aligned077.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=077
    threads: 24
    resources: tmpdir=/data/tmp, job_id=77, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 14:50:00 2023]
Finished job 349.
603 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 14:50:00 2023]
rule alignONT:
    input: 3-align/split/ont021.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned021.gaf
    log: 3-align/aligned021.err
    jobid: 321
    reason: Missing output files: 3-align/aligned021.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=021
    threads: 24
    resources: tmpdir=/data/tmp, job_id=21, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:07:18 2023]
Finished job 377.
604 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 15:07:18 2023]
rule alignONT:
    input: 3-align/split/ont047.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned047.gaf
    log: 3-align/aligned047.err
    jobid: 347
    reason: Missing output files: 3-align/aligned047.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=047
    threads: 24
    resources: tmpdir=/data/tmp, job_id=47, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:10:55 2023]
Finished job 321.
605 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 15:10:55 2023]
rule alignONT:
    input: 3-align/split/ont032.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned032.gaf
    log: 3-align/aligned032.err
    jobid: 332
    reason: Missing output files: 3-align/aligned032.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=032
    threads: 24
    resources: tmpdir=/data/tmp, job_id=32, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:29:16 2023]
Finished job 347.
606 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 15:29:17 2023]
rule alignONT:
    input: 3-align/split/ont088.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned088.gaf
    log: 3-align/aligned088.err
    jobid: 388
    reason: Missing output files: 3-align/aligned088.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=088
    threads: 24
    resources: tmpdir=/data/tmp, job_id=88, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:32:05 2023]
Finished job 332.
607 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 15:32:05 2023]
rule alignONT:
    input: 3-align/split/ont025.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned025.gaf
    log: 3-align/aligned025.err
    jobid: 325
    reason: Missing output files: 3-align/aligned025.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=025
    threads: 24
    resources: tmpdir=/data/tmp, job_id=25, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:50:04 2023]
Finished job 388.
608 of 695 steps (87%) done
Select jobs to execute...

[Wed Mar 29 15:50:04 2023]
rule alignONT:
    input: 3-align/split/ont095.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned095.gaf
    log: 3-align/aligned095.err
    jobid: 395
    reason: Missing output files: 3-align/aligned095.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=095
    threads: 24
    resources: tmpdir=/data/tmp, job_id=95, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 15:52:50 2023]
Finished job 325.
609 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 15:52:50 2023]
rule alignONT:
    input: 3-align/split/ont081.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned081.gaf
    log: 3-align/aligned081.err
    jobid: 381
    reason: Missing output files: 3-align/aligned081.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=081
    threads: 24
    resources: tmpdir=/data/tmp, job_id=81, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:08:31 2023]
Finished job 395.
610 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:08:32 2023]
rule alignONT:
    input: 3-align/split/ont074.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned074.gaf
    log: 3-align/aligned074.err
    jobid: 374
    reason: Missing output files: 3-align/aligned074.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=074
    threads: 24
    resources: tmpdir=/data/tmp, job_id=74, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:13:38 2023]
Finished job 381.
611 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:13:38 2023]
rule alignONT:
    input: 3-align/split/ont007.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned007.gaf
    log: 3-align/aligned007.err
    jobid: 307
    reason: Missing output files: 3-align/aligned007.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=007
    threads: 24
    resources: tmpdir=/data/tmp, job_id=7, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:28:55 2023]
Finished job 374.
612 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:28:55 2023]
rule alignONT:
    input: 3-align/split/ont039.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned039.gaf
    log: 3-align/aligned039.err
    jobid: 339
    reason: Missing output files: 3-align/aligned039.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=039
    threads: 24
    resources: tmpdir=/data/tmp, job_id=39, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:33:16 2023]
Finished job 307.
613 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:33:16 2023]
rule alignONT:
    input: 3-align/split/ont067.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned067.gaf
    log: 3-align/aligned067.err
    jobid: 367
    reason: Missing output files: 3-align/aligned067.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=067
    threads: 24
    resources: tmpdir=/data/tmp, job_id=67, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:50:16 2023]
Finished job 339.
614 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:50:16 2023]
rule alignONT:
    input: 3-align/split/ont005.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned005.gaf
    log: 3-align/aligned005.err
    jobid: 305
    reason: Missing output files: 3-align/aligned005.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=005
    threads: 24
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 16:54:21 2023]
Finished job 367.
615 of 695 steps (88%) done
Select jobs to execute...

[Wed Mar 29 16:54:22 2023]
rule alignONT:
    input: 3-align/split/ont062.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned062.gaf
    log: 3-align/aligned062.err
    jobid: 362
    reason: Missing output files: 3-align/aligned062.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=062
    threads: 24
    resources: tmpdir=/data/tmp, job_id=62, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:08:35 2023]
Finished job 305.
616 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:08:36 2023]
rule alignONT:
    input: 3-align/split/ont057.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned057.gaf
    log: 3-align/aligned057.err
    jobid: 357
    reason: Missing output files: 3-align/aligned057.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=057
    threads: 24
    resources: tmpdir=/data/tmp, job_id=57, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:15:10 2023]
Finished job 362.
617 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:15:10 2023]
rule alignONT:
    input: 3-align/split/ont003.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned003.gaf
    log: 3-align/aligned003.err
    jobid: 303
    reason: Missing output files: 3-align/aligned003.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=003
    threads: 24
    resources: tmpdir=/data/tmp, job_id=3, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:29:01 2023]
Finished job 357.
618 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:29:02 2023]
rule alignONT:
    input: 3-align/split/ont008.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned008.gaf
    log: 3-align/aligned008.err
    jobid: 308
    reason: Missing output files: 3-align/aligned008.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=008
    threads: 24
    resources: tmpdir=/data/tmp, job_id=8, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:32:42 2023]
Finished job 303.
619 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:32:43 2023]
rule alignONT:
    input: 3-align/split/ont097.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned097.gaf
    log: 3-align/aligned097.err
    jobid: 397
    reason: Missing output files: 3-align/aligned097.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=097
    threads: 24
    resources: tmpdir=/data/tmp, job_id=97, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:47:27 2023]
Finished job 308.
620 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:47:28 2023]
rule alignONT:
    input: 3-align/split/ont068.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned068.gaf
    log: 3-align/aligned068.err
    jobid: 368
    reason: Missing output files: 3-align/aligned068.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=068
    threads: 24
    resources: tmpdir=/data/tmp, job_id=68, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 17:50:53 2023]
Finished job 397.
621 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 17:50:54 2023]
rule alignONT:
    input: 3-align/split/ont041.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned041.gaf
    log: 3-align/aligned041.err
    jobid: 341
    reason: Missing output files: 3-align/aligned041.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=041
    threads: 24
    resources: tmpdir=/data/tmp, job_id=41, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:08:58 2023]
Finished job 368.
622 of 695 steps (89%) done
Select jobs to execute...

[Wed Mar 29 18:08:58 2023]
rule alignONT:
    input: 3-align/split/ont089.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned089.gaf
    log: 3-align/aligned089.err
    jobid: 389
    reason: Missing output files: 3-align/aligned089.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=089
    threads: 24
    resources: tmpdir=/data/tmp, job_id=89, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:12:58 2023]
Finished job 341.
623 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 18:12:58 2023]
rule alignONT:
    input: 3-align/split/ont090.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned090.gaf
    log: 3-align/aligned090.err
    jobid: 390
    reason: Missing output files: 3-align/aligned090.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=090
    threads: 24
    resources: tmpdir=/data/tmp, job_id=90, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:29:54 2023]
Finished job 389.
624 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 18:29:54 2023]
rule alignONT:
    input: 3-align/split/ont082.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned082.gaf
    log: 3-align/aligned082.err
    jobid: 382
    reason: Missing output files: 3-align/aligned082.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=082
    threads: 24
    resources: tmpdir=/data/tmp, job_id=82, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:33:47 2023]
Finished job 390.
625 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 18:33:47 2023]
rule alignONT:
    input: 3-align/split/ont034.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned034.gaf
    log: 3-align/aligned034.err
    jobid: 334
    reason: Missing output files: 3-align/aligned034.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=034
    threads: 24
    resources: tmpdir=/data/tmp, job_id=34, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:51:00 2023]
Finished job 382.
626 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 18:51:00 2023]
rule alignONT:
    input: 3-align/split/ont026.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned026.gaf
    log: 3-align/aligned026.err
    jobid: 326
    reason: Missing output files: 3-align/aligned026.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=026
    threads: 24
    resources: tmpdir=/data/tmp, job_id=26, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 18:54:39 2023]
Finished job 334.
627 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 18:54:39 2023]
rule alignONT:
    input: 3-align/split/ont083.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned083.gaf
    log: 3-align/aligned083.err
    jobid: 383
    reason: Missing output files: 3-align/aligned083.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=083
    threads: 24
    resources: tmpdir=/data/tmp, job_id=83, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:10:55 2023]
Finished job 326.
628 of 695 steps (90%) done
Select jobs to execute...

[Wed Mar 29 19:10:55 2023]
rule alignONT:
    input: 3-align/split/ont033.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned033.gaf
    log: 3-align/aligned033.err
    jobid: 333
    reason: Missing output files: 3-align/aligned033.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=033
    threads: 24
    resources: tmpdir=/data/tmp, job_id=33, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:15:45 2023]
Finished job 383.
629 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 19:15:46 2023]
rule alignONT:
    input: 3-align/split/ont027.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned027.gaf
    log: 3-align/aligned027.err
    jobid: 327
    reason: Missing output files: 3-align/aligned027.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=027
    threads: 24
    resources: tmpdir=/data/tmp, job_id=27, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:31:54 2023]
Finished job 333.
630 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 19:31:54 2023]
rule alignONT:
    input: 3-align/split/ont085.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned085.gaf
    log: 3-align/aligned085.err
    jobid: 385
    reason: Missing output files: 3-align/aligned085.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=085
    threads: 24
    resources: tmpdir=/data/tmp, job_id=85, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:36:06 2023]
Finished job 327.
631 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 19:36:07 2023]
rule alignONT:
    input: 3-align/split/ont043.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned043.gaf
    log: 3-align/aligned043.err
    jobid: 343
    reason: Missing output files: 3-align/aligned043.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=043
    threads: 24
    resources: tmpdir=/data/tmp, job_id=43, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:52:42 2023]
Finished job 385.
632 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 19:52:42 2023]
rule alignONT:
    input: 3-align/split/ont015.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned015.gaf
    log: 3-align/aligned015.err
    jobid: 315
    reason: Missing output files: 3-align/aligned015.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=015
    threads: 24
    resources: tmpdir=/data/tmp, job_id=15, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 19:57:21 2023]
Finished job 343.
633 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 19:57:21 2023]
rule alignONT:
    input: 3-align/split/ont006.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned006.gaf
    log: 3-align/aligned006.err
    jobid: 306
    reason: Missing output files: 3-align/aligned006.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=006
    threads: 24
    resources: tmpdir=/data/tmp, job_id=6, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:11:02 2023]
Finished job 315.
634 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 20:11:02 2023]
rule alignONT:
    input: 3-align/split/ont010.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned010.gaf
    log: 3-align/aligned010.err
    jobid: 310
    reason: Missing output files: 3-align/aligned010.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=010
    threads: 24
    resources: tmpdir=/data/tmp, job_id=10, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:15:36 2023]
Finished job 306.
635 of 695 steps (91%) done
Select jobs to execute...

[Wed Mar 29 20:15:36 2023]
rule alignONT:
    input: 3-align/split/ont036.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned036.gaf
    log: 3-align/aligned036.err
    jobid: 336
    reason: Missing output files: 3-align/aligned036.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=036
    threads: 24
    resources: tmpdir=/data/tmp, job_id=36, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:28:22 2023]
Finished job 310.
636 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 20:28:22 2023]
rule alignONT:
    input: 3-align/split/ont069.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned069.gaf
    log: 3-align/aligned069.err
    jobid: 369
    reason: Missing output files: 3-align/aligned069.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=069
    threads: 24
    resources: tmpdir=/data/tmp, job_id=69, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:35:54 2023]
Finished job 336.
637 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 20:35:54 2023]
rule alignONT:
    input: 3-align/split/ont063.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned063.gaf
    log: 3-align/aligned063.err
    jobid: 363
    reason: Missing output files: 3-align/aligned063.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=063
    threads: 24
    resources: tmpdir=/data/tmp, job_id=63, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:48:21 2023]
Finished job 369.
638 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 20:48:21 2023]
rule alignONT:
    input: 3-align/split/ont040.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned040.gaf
    log: 3-align/aligned040.err
    jobid: 340
    reason: Missing output files: 3-align/aligned040.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=040
    threads: 24
    resources: tmpdir=/data/tmp, job_id=40, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 20:55:49 2023]
Finished job 363.
639 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 20:55:49 2023]
rule alignONT:
    input: 3-align/split/ont001.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned001.gaf
    log: 3-align/aligned001.err
    jobid: 300
    reason: Missing output files: 3-align/aligned001.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=001
    threads: 24
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:08:42 2023]
Finished job 340.
640 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 21:08:42 2023]
rule alignONT:
    input: 3-align/split/ont096.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned096.gaf
    log: 3-align/aligned096.err
    jobid: 396
    reason: Missing output files: 3-align/aligned096.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=096
    threads: 24
    resources: tmpdir=/data/tmp, job_id=96, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:13:06 2023]
Finished job 300.
641 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 21:13:06 2023]
rule alignONT:
    input: 3-align/split/ont056.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned056.gaf
    log: 3-align/aligned056.err
    jobid: 356
    reason: Missing output files: 3-align/aligned056.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=056
    threads: 24
    resources: tmpdir=/data/tmp, job_id=56, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:26:33 2023]
Finished job 396.
642 of 695 steps (92%) done
Select jobs to execute...

[Wed Mar 29 21:26:33 2023]
rule alignONT:
    input: 3-align/split/ont054.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned054.gaf
    log: 3-align/aligned054.err
    jobid: 354
    reason: Missing output files: 3-align/aligned054.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=054
    threads: 24
    resources: tmpdir=/data/tmp, job_id=54, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:33:24 2023]
Finished job 356.
643 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 21:33:24 2023]
rule alignONT:
    input: 3-align/split/ont098.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned098.gaf
    log: 3-align/aligned098.err
    jobid: 398
    reason: Missing output files: 3-align/aligned098.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=098
    threads: 24
    resources: tmpdir=/data/tmp, job_id=98, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:47:02 2023]
Finished job 354.
644 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 21:47:02 2023]
rule alignONT:
    input: 3-align/split/ont061.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned061.gaf
    log: 3-align/aligned061.err
    jobid: 361
    reason: Missing output files: 3-align/aligned061.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=061
    threads: 24
    resources: tmpdir=/data/tmp, job_id=61, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 21:50:52 2023]
Finished job 398.
645 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 21:50:52 2023]
rule alignONT:
    input: 3-align/split/ont042.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned042.gaf
    log: 3-align/aligned042.err
    jobid: 342
    reason: Missing output files: 3-align/aligned042.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=042
    threads: 24
    resources: tmpdir=/data/tmp, job_id=42, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:07:56 2023]
Finished job 361.
646 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 22:07:56 2023]
rule alignONT:
    input: 3-align/split/ont004.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned004.gaf
    log: 3-align/aligned004.err
    jobid: 304
    reason: Missing output files: 3-align/aligned004.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=004
    threads: 24
    resources: tmpdir=/data/tmp, job_id=4, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:12:11 2023]
Finished job 342.
647 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 22:12:11 2023]
rule alignONT:
    input: 3-align/split/ont091.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned091.gaf
    log: 3-align/aligned091.err
    jobid: 391
    reason: Missing output files: 3-align/aligned091.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=091
    threads: 24
    resources: tmpdir=/data/tmp, job_id=91, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:26:02 2023]
Finished job 304.
648 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 22:26:02 2023]
rule alignONT:
    input: 3-align/split/ont022.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned022.gaf
    log: 3-align/aligned022.err
    jobid: 322
    reason: Missing output files: 3-align/aligned022.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=022
    threads: 24
    resources: tmpdir=/data/tmp, job_id=22, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:31:33 2023]
Finished job 391.
649 of 695 steps (93%) done
Select jobs to execute...

[Wed Mar 29 22:31:33 2023]
rule alignONT:
    input: 3-align/split/ont071.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned071.gaf
    log: 3-align/aligned071.err
    jobid: 371
    reason: Missing output files: 3-align/aligned071.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=071
    threads: 24
    resources: tmpdir=/data/tmp, job_id=71, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:46:07 2023]
Finished job 322.
650 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 22:46:07 2023]
rule alignONT:
    input: 3-align/split/ont064.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned064.gaf
    log: 3-align/aligned064.err
    jobid: 364
    reason: Missing output files: 3-align/aligned064.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=064
    threads: 24
    resources: tmpdir=/data/tmp, job_id=64, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 22:51:45 2023]
Finished job 371.
651 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 22:51:45 2023]
rule alignONT:
    input: 3-align/split/ont058.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned058.gaf
    log: 3-align/aligned058.err
    jobid: 358
    reason: Missing output files: 3-align/aligned058.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=058
    threads: 24
    resources: tmpdir=/data/tmp, job_id=58, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:06:32 2023]
Finished job 364.
652 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 23:06:32 2023]
rule alignONT:
    input: 3-align/split/ont051.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned051.gaf
    log: 3-align/aligned051.err
    jobid: 351
    reason: Missing output files: 3-align/aligned051.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=051
    threads: 24
    resources: tmpdir=/data/tmp, job_id=51, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:12:28 2023]
Finished job 358.
653 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 23:12:28 2023]
rule alignONT:
    input: 3-align/split/ont093.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned093.gaf
    log: 3-align/aligned093.err
    jobid: 393
    reason: Missing output files: 3-align/aligned093.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=093
    threads: 24
    resources: tmpdir=/data/tmp, job_id=93, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:27:24 2023]
Finished job 351.
654 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 23:27:24 2023]
rule alignONT:
    input: 3-align/split/ont030.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned030.gaf
    log: 3-align/aligned030.err
    jobid: 330
    reason: Missing output files: 3-align/aligned030.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=030
    threads: 24
    resources: tmpdir=/data/tmp, job_id=30, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:31:18 2023]
Finished job 393.
655 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 23:31:18 2023]
rule alignONT:
    input: 3-align/split/ont086.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned086.gaf
    log: 3-align/aligned086.err
    jobid: 386
    reason: Missing output files: 3-align/aligned086.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=086
    threads: 24
    resources: tmpdir=/data/tmp, job_id=86, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:48:04 2023]
Finished job 330.
656 of 695 steps (94%) done
Select jobs to execute...

[Wed Mar 29 23:48:04 2023]
rule alignONT:
    input: 3-align/split/ont079.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned079.gaf
    log: 3-align/aligned079.err
    jobid: 379
    reason: Missing output files: 3-align/aligned079.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=079
    threads: 24
    resources: tmpdir=/data/tmp, job_id=79, n_cpus=24, mem_gb=23, time_h=24

[Wed Mar 29 23:51:46 2023]
Finished job 386.
657 of 695 steps (95%) done
Select jobs to execute...

[Wed Mar 29 23:51:46 2023]
rule alignONT:
    input: 3-align/split/ont023.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned023.gaf
    log: 3-align/aligned023.err
    jobid: 323
    reason: Missing output files: 3-align/aligned023.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=023
    threads: 24
    resources: tmpdir=/data/tmp, job_id=23, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:08:35 2023]
Finished job 379.
658 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:08:35 2023]
rule alignONT:
    input: 3-align/split/ont059.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned059.gaf
    log: 3-align/aligned059.err
    jobid: 359
    reason: Missing output files: 3-align/aligned059.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=059
    threads: 24
    resources: tmpdir=/data/tmp, job_id=59, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:12:35 2023]
Finished job 323.
659 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:12:35 2023]
rule alignONT:
    input: 3-align/split/ont052.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned052.gaf
    log: 3-align/aligned052.err
    jobid: 352
    reason: Missing output files: 3-align/aligned052.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=052
    threads: 24
    resources: tmpdir=/data/tmp, job_id=52, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:29:48 2023]
Finished job 359.
660 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:29:48 2023]
rule alignONT:
    input: 3-align/split/ont094.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned094.gaf
    log: 3-align/aligned094.err
    jobid: 394
    reason: Missing output files: 3-align/aligned094.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=094
    threads: 24
    resources: tmpdir=/data/tmp, job_id=94, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:33:54 2023]
Finished job 352.
661 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:33:54 2023]
rule alignONT:
    input: 3-align/split/ont031.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned031.gaf
    log: 3-align/aligned031.err
    jobid: 331
    reason: Missing output files: 3-align/aligned031.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=031
    threads: 24
    resources: tmpdir=/data/tmp, job_id=31, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:48:42 2023]
Finished job 394.
662 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:48:42 2023]
rule alignONT:
    input: 3-align/split/ont087.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned087.gaf
    log: 3-align/aligned087.err
    jobid: 387
    reason: Missing output files: 3-align/aligned087.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=087
    threads: 24
    resources: tmpdir=/data/tmp, job_id=87, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 00:53:57 2023]
Finished job 331.
663 of 695 steps (95%) done
Select jobs to execute...

[Thu Mar 30 00:53:57 2023]
rule alignONT:
    input: 3-align/split/ont024.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned024.gaf
    log: 3-align/aligned024.err
    jobid: 324
    reason: Missing output files: 3-align/aligned024.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=024
    threads: 24
    resources: tmpdir=/data/tmp, job_id=24, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:08:39 2023]
Finished job 387.
664 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:08:39 2023]
rule alignONT:
    input: 3-align/split/ont080.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned080.gaf
    log: 3-align/aligned080.err
    jobid: 380
    reason: Missing output files: 3-align/aligned080.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=080
    threads: 24
    resources: tmpdir=/data/tmp, job_id=80, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:14:28 2023]
Finished job 324.
665 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:14:28 2023]
rule alignONT:
    input: 3-align/split/ont014.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned014.gaf
    log: 3-align/aligned014.err
    jobid: 314
    reason: Missing output files: 3-align/aligned014.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=014
    threads: 24
    resources: tmpdir=/data/tmp, job_id=14, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:28:28 2023]
Finished job 380.
666 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:28:28 2023]
rule alignONT:
    input: 3-align/split/ont060.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned060.gaf
    log: 3-align/aligned060.err
    jobid: 360
    reason: Missing output files: 3-align/aligned060.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=060
    threads: 24
    resources: tmpdir=/data/tmp, job_id=60, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:32:53 2023]
Finished job 314.
667 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:32:54 2023]
rule alignONT:
    input: 3-align/split/ont011.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned011.gaf
    log: 3-align/aligned011.err
    jobid: 311
    reason: Missing output files: 3-align/aligned011.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=011
    threads: 24
    resources: tmpdir=/data/tmp, job_id=11, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:49:40 2023]
Finished job 360.
668 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:49:40 2023]
rule alignONT:
    input: 3-align/split/ont050.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned050.gaf
    log: 3-align/aligned050.err
    jobid: 350
    reason: Missing output files: 3-align/aligned050.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=050
    threads: 24
    resources: tmpdir=/data/tmp, job_id=50, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 01:51:10 2023]
Finished job 311.
669 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 01:51:10 2023]
rule alignONT:
    input: 3-align/split/ont099.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned099.gaf
    log: 3-align/aligned099.err
    jobid: 399
    reason: Missing output files: 3-align/aligned099.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=099
    threads: 24
    resources: tmpdir=/data/tmp, job_id=99, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:03:49 2023]
Finished job 399.
670 of 695 steps (96%) done
Select jobs to execute...

[Thu Mar 30 02:03:50 2023]
rule alignONT:
    input: 3-align/split/ont092.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned092.gaf
    log: 3-align/aligned092.err
    jobid: 392
    reason: Missing output files: 3-align/aligned092.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=092
    threads: 24
    resources: tmpdir=/data/tmp, job_id=92, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:10:02 2023]
Finished job 350.
671 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 02:10:02 2023]
rule alignONT:
    input: 3-align/split/ont029.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned029.gaf
    log: 3-align/aligned029.err
    jobid: 329
    reason: Missing output files: 3-align/aligned029.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=029
    threads: 24
    resources: tmpdir=/data/tmp, job_id=29, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:22:12 2023]
Finished job 392.
672 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 02:22:13 2023]
rule alignONT:
    input: 3-align/split/ont070.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned070.gaf
    log: 3-align/aligned070.err
    jobid: 370
    reason: Missing output files: 3-align/aligned070.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=070
    threads: 24
    resources: tmpdir=/data/tmp, job_id=70, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:29:21 2023]
Finished job 329.
673 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 02:29:21 2023]
rule alignONT:
    input: 3-align/split/ont012.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned012.gaf
    log: 3-align/aligned012.err
    jobid: 312
    reason: Missing output files: 3-align/aligned012.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=012
    threads: 24
    resources: tmpdir=/data/tmp, job_id=12, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:42:17 2023]
Finished job 370.
674 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 02:42:17 2023]
rule alignONT:
    input: 3-align/split/ont053.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned053.gaf
    log: 3-align/aligned053.err
    jobid: 353
    reason: Missing output files: 3-align/aligned053.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=053
    threads: 24
    resources: tmpdir=/data/tmp, job_id=53, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 02:47:09 2023]
Finished job 312.
675 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 02:47:09 2023]
rule alignONT:
    input: 3-align/split/ont028.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned028.gaf
    log: 3-align/aligned028.err
    jobid: 328
    reason: Missing output files: 3-align/aligned028.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=028
    threads: 24
    resources: tmpdir=/data/tmp, job_id=28, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:03:13 2023]
Finished job 353.
676 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 03:03:13 2023]
rule alignONT:
    input: 3-align/split/ont084.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned084.gaf
    log: 3-align/aligned084.err
    jobid: 384
    reason: Missing output files: 3-align/aligned084.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=084
    threads: 24
    resources: tmpdir=/data/tmp, job_id=84, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:07:30 2023]
Finished job 328.
677 of 695 steps (97%) done
Select jobs to execute...

[Thu Mar 30 03:07:30 2023]
rule alignONT:
    input: 3-align/split/ont066.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned066.gaf
    log: 3-align/aligned066.err
    jobid: 366
    reason: Missing output files: 3-align/aligned066.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=066
    threads: 24
    resources: tmpdir=/data/tmp, job_id=66, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:23:56 2023]
Finished job 384.
678 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 03:23:57 2023]
rule alignONT:
    input: 3-align/split/ont078.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned078.gaf
    log: 3-align/aligned078.err
    jobid: 378
    reason: Missing output files: 3-align/aligned078.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=078
    threads: 24
    resources: tmpdir=/data/tmp, job_id=78, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:28:08 2023]
Finished job 366.
679 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 03:28:08 2023]
rule alignONT:
    input: 3-align/split/ont009.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned009.gaf
    log: 3-align/aligned009.err
    jobid: 309
    reason: Missing output files: 3-align/aligned009.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=009
    threads: 24
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:44:08 2023]
Finished job 378.
680 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 03:44:08 2023]
rule alignONT:
    input: 3-align/split/ont035.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned035.gaf
    log: 3-align/aligned035.err
    jobid: 335
    reason: Missing output files: 3-align/aligned035.gaf; Input files updated by another job: 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    wildcards: nnnn=035
    threads: 24
    resources: tmpdir=/data/tmp, job_id=35, n_cpus=24, mem_gb=23, time_h=24

[Thu Mar 30 03:46:18 2023]
Finished job 309.
681 of 695 steps (98%) done
[Thu Mar 30 04:03:42 2023]
Finished job 335.
682 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 04:03:43 2023]
rule combineONT:
    input: 3-align/splitONT.finished, 3-align/aligned001.gaf, 3-align/aligned002.gaf, 3-align/aligned003.gaf, 3-align/aligned004.gaf, 3-align/aligned005.gaf, 3-align/aligned006.gaf, 3-align/aligned007.gaf, 3-align/aligned008.gaf, 3-align/aligned009.gaf, 3-align/aligned010.gaf, 3-align/aligned011.gaf, 3-align/aligned012.gaf, 3-align/aligned013.gaf, 3-align/aligned014.gaf, 3-align/aligned015.gaf, 3-align/aligned016.gaf, 3-align/aligned017.gaf, 3-align/aligned018.gaf, 3-align/aligned019.gaf, 3-align/aligned020.gaf, 3-align/aligned021.gaf, 3-align/aligned022.gaf, 3-align/aligned023.gaf, 3-align/aligned024.gaf, 3-align/aligned025.gaf, 3-align/aligned026.gaf, 3-align/aligned027.gaf, 3-align/aligned028.gaf, 3-align/aligned029.gaf, 3-align/aligned030.gaf, 3-align/aligned031.gaf, 3-align/aligned032.gaf, 3-align/aligned033.gaf, 3-align/aligned034.gaf, 3-align/aligned035.gaf, 3-align/aligned036.gaf, 3-align/aligned037.gaf, 3-align/aligned038.gaf, 3-align/aligned039.gaf, 3-align/aligned040.gaf, 3-align/aligned041.gaf, 3-align/aligned042.gaf, 3-align/aligned043.gaf, 3-align/aligned044.gaf, 3-align/aligned045.gaf, 3-align/aligned046.gaf, 3-align/aligned047.gaf, 3-align/aligned048.gaf, 3-align/aligned049.gaf, 3-align/aligned050.gaf, 3-align/aligned051.gaf, 3-align/aligned052.gaf, 3-align/aligned053.gaf, 3-align/aligned054.gaf, 3-align/aligned055.gaf, 3-align/aligned056.gaf, 3-align/aligned057.gaf, 3-align/aligned058.gaf, 3-align/aligned059.gaf, 3-align/aligned060.gaf, 3-align/aligned061.gaf, 3-align/aligned062.gaf, 3-align/aligned063.gaf, 3-align/aligned064.gaf, 3-align/aligned065.gaf, 3-align/aligned066.gaf, 3-align/aligned067.gaf, 3-align/aligned068.gaf, 3-align/aligned069.gaf, 3-align/aligned070.gaf, 3-align/aligned071.gaf, 3-align/aligned072.gaf, 3-align/aligned073.gaf, 3-align/aligned074.gaf, 3-align/aligned075.gaf, 3-align/aligned076.gaf, 3-align/aligned077.gaf, 3-align/aligned078.gaf, 3-align/aligned079.gaf, 3-align/aligned080.gaf, 3-align/aligned081.gaf, 3-align/aligned082.gaf, 3-align/aligned083.gaf, 3-align/aligned084.gaf, 3-align/aligned085.gaf, 3-align/aligned086.gaf, 3-align/aligned087.gaf, 3-align/aligned088.gaf, 3-align/aligned089.gaf, 3-align/aligned090.gaf, 3-align/aligned091.gaf, 3-align/aligned092.gaf, 3-align/aligned093.gaf, 3-align/aligned094.gaf, 3-align/aligned095.gaf, 3-align/aligned096.gaf, 3-align/aligned097.gaf, 3-align/aligned098.gaf, 3-align/aligned099.gaf
    output: 3-align/alns-ont.gaf
    log: 3-align/combineONT.err
    jobid: 12
    reason: Missing output files: 3-align/alns-ont.gaf; Input files updated by another job: 3-align/aligned046.gaf, 3-align/aligned096.gaf, 3-align/aligned005.gaf, 3-align/aligned070.gaf, 3-align/aligned097.gaf, 3-align/aligned030.gaf, 3-align/aligned010.gaf, 3-align/aligned011.gaf, 3-align/aligned078.gaf, 3-align/aligned094.gaf, 3-align/aligned043.gaf, 3-align/aligned053.gaf, 3-align/aligned026.gaf, 3-align/aligned042.gaf, 3-align/aligned052.gaf, 3-align/aligned074.gaf, 3-align/aligned018.gaf, 3-align/aligned091.gaf, 3-align/aligned045.gaf, 3-align/aligned013.gaf, 3-align/aligned075.gaf, 3-align/aligned038.gaf, 3-align/aligned041.gaf, 3-align/aligned064.gaf, 3-align/aligned071.gaf, 3-align/aligned080.gaf, 3-align/aligned093.gaf, 3-align/aligned008.gaf, 3-align/aligned058.gaf, 3-align/aligned001.gaf, 3-align/aligned057.gaf, 3-align/aligned060.gaf, 3-align/aligned004.gaf, 3-align/aligned006.gaf, 3-align/aligned007.gaf, 3-align/aligned077.gaf, 3-align/aligned095.gaf, 3-align/aligned067.gaf, 3-align/aligned084.gaf, 3-align/aligned025.gaf, 3-align/aligned062.gaf, 3-align/aligned009.gaf, 3-align/aligned003.gaf, 3-align/aligned088.gaf, 3-align/aligned066.gaf, 3-align/aligned019.gaf, 3-align/aligned082.gaf, 3-align/aligned059.gaf, 3-align/aligned047.gaf, 3-align/aligned023.gaf, 3-align/aligned092.gaf, 3-align/aligned063.gaf, 3-align/aligned049.gaf, 3-align/aligned033.gaf, 3-align/aligned048.gaf, 3-align/aligned061.gaf, 3-align/aligned087.gaf, 3-align/aligned016.gaf, 3-align/aligned069.gaf, 3-align/aligned021.gaf, 3-align/aligned035.gaf, 3-align/aligned044.gaf, 3-align/aligned056.gaf, 3-align/aligned081.gaf, 3-align/aligned090.gaf, 3-align/aligned022.gaf, 3-align/aligned098.gaf, 3-align/aligned055.gaf, 3-align/aligned083.gaf, 3-align/aligned079.gaf, 3-align/aligned072.gaf, 3-align/aligned039.gaf, 3-align/aligned051.gaf, 3-align/aligned036.gaf, 3-align/aligned020.gaf, 3-align/aligned002.gaf, 3-align/aligned037.gaf, 3-align/aligned065.gaf, 3-align/aligned068.gaf, 3-align/aligned032.gaf, 3-align/aligned028.gaf, 3-align/aligned027.gaf, 3-align/aligned024.gaf, 3-align/aligned073.gaf, 3-align/aligned054.gaf, 3-align/aligned034.gaf, 3-align/aligned017.gaf, 3-align/aligned086.gaf, 3-align/aligned099.gaf, 3-align/aligned040.gaf, 3-align/aligned012.gaf, 3-align/aligned050.gaf, 3-align/aligned076.gaf, 3-align/aligned015.gaf, 3-align/aligned089.gaf, 3-align/aligned085.gaf, 3-align/aligned029.gaf, 3-align/aligned031.gaf, 3-align/aligned014.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=2

[Thu Mar 30 04:03:58 2023]
Finished job 12.
683 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 04:03:58 2023]
rule processONT:
    input: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 1-buildGraph/hifi_nodecov.csv, 3-align/alns-ont.gaf
    output: 4-processONT/unitig-unrolled-ont-resolved.gfa, 4-processONT/gaps-ont.gaf, 4-processONT/nodecovs-ont.csv
    log: 4-processONT/processONT.err
    jobid: 2
    reason: Missing output files: 4-processONT/gaps-ont.gaf, 4-processONT/unitig-unrolled-ont-resolved.gfa, 4-processONT/nodecovs-ont.csv; Input files updated by another job: 3-align/alns-ont.gaf, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 1-buildGraph/hifi_nodecov.csv
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24

[Thu Mar 30 04:57:54 2023]
Finished job 2.
684 of 695 steps (98%) done
Select jobs to execute...

[Thu Mar 30 04:57:54 2023]
rule extractONT:
    input: 4-processONT/gaps-ont.gaf, 3-align/splitONT.finished
    output: 7-consensus/ont_subset.id, 7-consensus/ont_subset.extract, 7-consensus/ont_subset.fasta.gz
    log: 7-consensus/extractONT.err
    jobid: 19
    reason: Missing output files: 7-consensus/ont_subset.fasta.gz; Input files updated by another job: 4-processONT/gaps-ont.gaf
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=16, time_h=24


[Thu Mar 30 04:57:55 2023]
rule untip:
    input: 4-processONT/unitig-unrolled-ont-resolved.gfa, 1-buildGraph/hifi_nodecov.csv
    output: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 5-untip/nodecov_hifi_fix.csv
    log: 5-untip/untip.err
    jobid: 1
    reason: Missing output files: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa; Input files updated by another job: 4-processONT/unitig-unrolled-ont-resolved.gfa, 1-buildGraph/hifi_nodecov.csv
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24

[Thu Mar 30 05:00:50 2023]
Finished job 19.
685 of 695 steps (99%) done
[Thu Mar 30 05:17:44 2023]
Finished job 1.
686 of 695 steps (99%) done
Select jobs to execute...

[Thu Mar 30 05:17:44 2023]
rule prepCoverage:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    output: 5-untip/combined-edges-final.gfa, 5-untip/nodelens-final.txt, 5-untip/combined-nodemap-final.txt
    log: 5-untip/prepCoverage.err
    jobid: 21
    reason: Missing output files: 5-untip/combined-nodemap-final.txt, 5-untip/combined-edges-final.gfa, 5-untip/nodelens-final.txt; Input files updated by another job: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=2


[Thu Mar 30 05:17:44 2023]
rule generateLayoutContigsInputs:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 1-buildGraph/paths.gaf
    output: 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/nodelens.txt
    log: 6-layoutContigs/createLayoutInputs.err
    jobid: 16
    reason: Missing output files: 6-layoutContigs/nodelens.txt, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa; Input files updated by another job: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 1-buildGraph/paths.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=32, time_h=24

[Thu Mar 30 05:30:12 2023]
Finished job 21.
687 of 695 steps (99%) done
Select jobs to execute...

[Thu Mar 30 05:30:12 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv
    log: 5-untip/unitig-popped-unitig-normal-connected-tip.getCoverage.err
    jobid: 20
    reason: Missing output files: 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv; Input files updated by another job: 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt, 1-buildGraph/hifi_nodecov.csv, 5-untip/combined-edges-final.gfa, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 4-processONT/nodecovs-ont.csv
    wildcards: dir=5-untip, id=unitig-popped-unitig-normal-connected-tip
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2


[Thu Mar 30 05:30:12 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 4-processONT/unitig-unrolled-ont-resolved.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv
    log: 4-processONT/unitig-unrolled-ont-resolved.getCoverage.err
    jobid: 23
    reason: Missing output files: 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv; Input files updated by another job: 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt, 1-buildGraph/hifi_nodecov.csv, 4-processONT/unitig-unrolled-ont-resolved.gfa, 5-untip/combined-edges-final.gfa, 4-processONT/nodecovs-ont.csv
    wildcards: dir=4-processONT, id=unitig-unrolled-ont-resolved
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2


[Thu Mar 30 05:30:12 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv
    log: 2-processGraph/unitig-unrolled-hifi-resolved.getCoverage.err
    jobid: 22
    reason: Missing output files: 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv; Input files updated by another job: 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt, 1-buildGraph/hifi_nodecov.csv, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 5-untip/combined-edges-final.gfa, 4-processONT/nodecovs-ont.csv
    wildcards: dir=2-processGraph, id=unitig-unrolled-hifi-resolved
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2

[Thu Mar 30 05:30:31 2023]
Finished job 16.
688 of 695 steps (99%) done
Select jobs to execute...

[Thu Mar 30 05:30:31 2023]
rule layoutContigs:
    input: 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/nodelens.txt
    output: 6-layoutContigs/unitig-popped.layout, 6-layoutContigs/unitig-popped.layout.scfmap, 6-layoutContigs/gaps.txt
    log: 6-layoutContigs/createLayout.err
    jobid: 15
    reason: Missing output files: 6-layoutContigs/unitig-popped.layout.scfmap, 6-layoutContigs/unitig-popped.layout; Input files updated by another job: 6-layoutContigs/nodelens.txt, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=32, time_h=24

[Thu Mar 30 05:33:30 2023]
Finished job 22.
689 of 695 steps (99%) done
[Thu Mar 30 05:33:31 2023]
Finished job 20.
690 of 695 steps (99%) done
[Thu Mar 30 05:33:37 2023]
Finished job 23.
691 of 695 steps (99%) done
[Thu Mar 30 05:38:25 2023]
Finished job 15.
692 of 695 steps (99.6%) done
Select jobs to execute...

[Thu Mar 30 05:38:25 2023]
checkpoint buildPackages:
    input: /public/groups/meyerlab/gvtp/assemblies/verkko/../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz, 6-layoutContigs/unitig-popped.layout, 7-consensus/ont_subset.fasta.gz
    output: 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.finished, 7-consensus/packages.report
    log: 7-consensus/buildPackages.err
    jobid: 18
    reason: Missing output files: 7-consensus/packages.finished, 7-consensus/packages.tigName_to_ID.map; Input files updated by another job: 6-layoutContigs/unitig-popped.layout, 7-consensus/ont_subset.fasta.gz
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=26, time_h=24
DAG of jobs will be updated after completion.

[Thu Mar 30 06:19:01 2023]
Finished job 18.
693 of 695 steps (99.7%) done
Select jobs to execute...

[Thu Mar 30 06:19:23 2023]
rule generateConsensus:
    input: 7-consensus/packages/part056.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part056.fasta
    log: 7-consensus/packages/part056.err
    jobid: 765
    reason: Missing output files: 7-consensus/packages/part056.fasta
    wildcards: nnnn=056
    threads: 8
    resources: tmpdir=/data/tmp, job_id=56, n_cpus=8, mem_gb=7, time_h=24


[Thu Mar 30 06:19:23 2023]
rule generateConsensus:
    input: 7-consensus/packages/part067.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part067.fasta
    log: 7-consensus/packages/part067.err
    jobid: 750
    reason: Missing output files: 7-consensus/packages/part067.fasta
    wildcards: nnnn=067
    threads: 8
    resources: tmpdir=/data/tmp, job_id=67, n_cpus=8, mem_gb=7, time_h=24


[Thu Mar 30 06:19:23 2023]
rule generateConsensus:
    input: 7-consensus/packages/part049.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part049.fasta
    log: 7-consensus/packages/part049.err
    jobid: 733
    reason: Missing output files: 7-consensus/packages/part049.fasta
    wildcards: nnnn=049
    threads: 8
    resources: tmpdir=/data/tmp, job_id=49, n_cpus=8, mem_gb=7, time_h=24


[Thu Mar 30 06:19:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part053.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part053.fasta
    log: 7-consensus/packages/part053.err
    jobid: 776
    reason: Missing output files: 7-consensus/packages/part053.fasta
    wildcards: nnnn=053
    threads: 8
    resources: tmpdir=/data/tmp, job_id=53, n_cpus=8, mem_gb=7, time_h=24


[Thu Mar 30 06:19:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part048.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part048.fasta
    log: 7-consensus/packages/part048.err
    jobid: 749
    reason: Missing output files: 7-consensus/packages/part048.fasta
    wildcards: nnnn=048
    threads: 8
    resources: tmpdir=/data/tmp, job_id=48, n_cpus=8, mem_gb=7, time_h=24


[Thu Mar 30 06:19:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part066.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part066.fasta
    log: 7-consensus/packages/part066.err
    jobid: 719
    reason: Missing output files: 7-consensus/packages/part066.fasta
    wildcards: nnnn=066
    threads: 8
    resources: tmpdir=/data/tmp, job_id=66, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 06:22:38 2023]
Finished job 733.
694 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:22:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part096.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part096.fasta
    log: 7-consensus/packages/part096.err
    jobid: 702
    reason: Missing output files: 7-consensus/packages/part096.fasta
    wildcards: nnnn=096
    threads: 8
    resources: tmpdir=/data/tmp, job_id=96, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:22:49 2023]
Finished job 749.
695 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:22:49 2023]
rule generateConsensus:
    input: 7-consensus/packages/part031.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part031.fasta
    log: 7-consensus/packages/part031.err
    jobid: 775
    reason: Missing output files: 7-consensus/packages/part031.fasta
    wildcards: nnnn=031
    threads: 8
    resources: tmpdir=/data/tmp, job_id=31, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 06:23:25 2023]
Finished job 776.
696 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:23:25 2023]
rule generateConsensus:
    input: 7-consensus/packages/part059.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part059.fasta
    log: 7-consensus/packages/part059.err
    jobid: 738
    reason: Missing output files: 7-consensus/packages/part059.fasta
    wildcards: nnnn=059
    threads: 8
    resources: tmpdir=/data/tmp, job_id=59, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 06:23:38 2023]
Finished job 765.
697 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:23:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part023.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part023.fasta
    log: 7-consensus/packages/part023.err
    jobid: 784
    reason: Missing output files: 7-consensus/packages/part023.fasta
    wildcards: nnnn=023
    threads: 8
    resources: tmpdir=/data/tmp, job_id=23, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:24:54 2023]
Finished job 775.
698 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:24:54 2023]
rule generateConsensus:
    input: 7-consensus/packages/part012.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part012.fasta
    log: 7-consensus/packages/part012.err
    jobid: 781
    reason: Missing output files: 7-consensus/packages/part012.fasta
    wildcards: nnnn=012
    threads: 8
    resources: tmpdir=/data/tmp, job_id=12, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:25:24 2023]
Finished job 719.
699 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:25:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part020.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part020.fasta
    log: 7-consensus/packages/part020.err
    jobid: 756
    reason: Missing output files: 7-consensus/packages/part020.fasta
    wildcards: nnnn=020
    threads: 8
    resources: tmpdir=/data/tmp, job_id=20, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:25:33 2023]
Finished job 784.
700 of 792 steps (88%) done
Select jobs to execute...

[Thu Mar 30 06:25:34 2023]
rule generateConsensus:
    input: 7-consensus/packages/part005.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part005.fasta
    log: 7-consensus/packages/part005.err
    jobid: 791
    reason: Missing output files: 7-consensus/packages/part005.fasta
    wildcards: nnnn=005
    threads: 8
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:25:35 2023]
Finished job 750.
701 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:25:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part091.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part091.fasta
    log: 7-consensus/packages/part091.err
    jobid: 729
    reason: Missing output files: 7-consensus/packages/part091.fasta
    wildcards: nnnn=091
    threads: 8
    resources: tmpdir=/data/tmp, job_id=91, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:26:36 2023]
Finished job 781.
702 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:26:36 2023]
rule generateConsensus:
    input: 7-consensus/packages/part024.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part024.fasta
    log: 7-consensus/packages/part024.err
    jobid: 779
    reason: Missing output files: 7-consensus/packages/part024.fasta
    wildcards: nnnn=024
    threads: 8
    resources: tmpdir=/data/tmp, job_id=24, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:27:11 2023]
Finished job 791.
703 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:27:11 2023]
rule generateConsensus:
    input: 7-consensus/packages/part035.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part035.fasta
    log: 7-consensus/packages/part035.err
    jobid: 777
    reason: Missing output files: 7-consensus/packages/part035.fasta
    wildcards: nnnn=035
    threads: 8
    resources: tmpdir=/data/tmp, job_id=35, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 06:27:15 2023]
Finished job 756.
704 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:27:15 2023]
rule generateConsensus:
    input: 7-consensus/packages/part058.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part058.fasta
    log: 7-consensus/packages/part058.err
    jobid: 730
    reason: Missing output files: 7-consensus/packages/part058.fasta
    wildcards: nnnn=058
    threads: 8
    resources: tmpdir=/data/tmp, job_id=58, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 06:28:11 2023]
Finished job 738.
705 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:28:11 2023]
rule generateConsensus:
    input: 7-consensus/packages/part082.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part082.fasta
    log: 7-consensus/packages/part082.err
    jobid: 734
    reason: Missing output files: 7-consensus/packages/part082.fasta
    wildcards: nnnn=082
    threads: 8
    resources: tmpdir=/data/tmp, job_id=82, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:28:42 2023]
Finished job 779.
706 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:28:42 2023]
rule generateConsensus:
    input: 7-consensus/packages/part076.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part076.fasta
    log: 7-consensus/packages/part076.err
    jobid: 715
    reason: Missing output files: 7-consensus/packages/part076.fasta
    wildcards: nnnn=076
    threads: 8
    resources: tmpdir=/data/tmp, job_id=76, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:29:42 2023]
Finished job 777.
707 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:29:42 2023]
rule generateConsensus:
    input: 7-consensus/packages/part046.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part046.fasta
    log: 7-consensus/packages/part046.err
    jobid: 758
    reason: Missing output files: 7-consensus/packages/part046.fasta
    wildcards: nnnn=046
    threads: 8
    resources: tmpdir=/data/tmp, job_id=46, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 06:31:38 2023]
Finished job 730.
708 of 792 steps (89%) done
Select jobs to execute...

[Thu Mar 30 06:31:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part063.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part063.fasta
    log: 7-consensus/packages/part063.err
    jobid: 707
    reason: Missing output files: 7-consensus/packages/part063.fasta
    wildcards: nnnn=063
    threads: 8
    resources: tmpdir=/data/tmp, job_id=63, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 06:32:56 2023]
Finished job 758.
709 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:32:56 2023]
rule generateConsensus:
    input: 7-consensus/packages/part011.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part011.fasta
    log: 7-consensus/packages/part011.err
    jobid: 792
    reason: Missing output files: 7-consensus/packages/part011.fasta
    wildcards: nnnn=011
    threads: 8
    resources: tmpdir=/data/tmp, job_id=11, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:34:36 2023]
Finished job 792.
710 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:34:36 2023]
rule generateConsensus:
    input: 7-consensus/packages/part088.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part088.fasta
    log: 7-consensus/packages/part088.err
    jobid: 727
    reason: Missing output files: 7-consensus/packages/part088.fasta
    wildcards: nnnn=088
    threads: 8
    resources: tmpdir=/data/tmp, job_id=88, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:36:44 2023]
Finished job 707.
711 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:36:44 2023]
rule generateConsensus:
    input: 7-consensus/packages/part073.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part073.fasta
    log: 7-consensus/packages/part073.err
    jobid: 743
    reason: Missing output files: 7-consensus/packages/part073.fasta
    wildcards: nnnn=073
    threads: 8
    resources: tmpdir=/data/tmp, job_id=73, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:38:59 2023]
Finished job 715.
712 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:38:59 2023]
rule generateConsensus:
    input: 7-consensus/packages/part004.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part004.fasta
    log: 7-consensus/packages/part004.err
    jobid: 722
    reason: Missing output files: 7-consensus/packages/part004.fasta
    wildcards: nnnn=004
    threads: 8
    resources: tmpdir=/data/tmp, job_id=4, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:40:32 2023]
Finished job 722.
713 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:40:32 2023]
rule generateConsensus:
    input: 7-consensus/packages/part003.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part003.fasta
    log: 7-consensus/packages/part003.err
    jobid: 709
    reason: Missing output files: 7-consensus/packages/part003.fasta
    wildcards: nnnn=003
    threads: 8
    resources: tmpdir=/data/tmp, job_id=3, n_cpus=8, mem_gb=11, time_h=24

[Thu Mar 30 06:42:10 2023]
Finished job 709.
714 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:42:10 2023]
rule generateConsensus:
    input: 7-consensus/packages/part001.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part001.fasta
    log: 7-consensus/packages/part001.err
    jobid: 797
    reason: Missing output files: 7-consensus/packages/part001.fasta
    wildcards: nnnn=001
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=11, time_h=24

[Thu Mar 30 06:43:40 2023]
Finished job 734.
715 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:43:40 2023]
rule generateConsensus:
    input: 7-consensus/packages/part028.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part028.fasta
    log: 7-consensus/packages/part028.err
    jobid: 762
    reason: Missing output files: 7-consensus/packages/part028.fasta
    wildcards: nnnn=028
    threads: 8
    resources: tmpdir=/data/tmp, job_id=28, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:43:43 2023]
Finished job 797.
716 of 792 steps (90%) done
Select jobs to execute...

[Thu Mar 30 06:43:44 2023]
rule generateConsensus:
    input: 7-consensus/packages/part002.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part002.fasta
    log: 7-consensus/packages/part002.err
    jobid: 796
    reason: Missing output files: 7-consensus/packages/part002.fasta
    wildcards: nnnn=002
    threads: 8
    resources: tmpdir=/data/tmp, job_id=2, n_cpus=8, mem_gb=11, time_h=24

[Thu Mar 30 06:45:02 2023]
Finished job 796.
717 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:45:02 2023]
rule generateConsensus:
    input: 7-consensus/packages/part044.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part044.fasta
    log: 7-consensus/packages/part044.err
    jobid: 754
    reason: Missing output files: 7-consensus/packages/part044.fasta
    wildcards: nnnn=044
    threads: 8
    resources: tmpdir=/data/tmp, job_id=44, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 06:45:19 2023]
Finished job 743.
718 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:45:19 2023]
rule generateConsensus:
    input: 7-consensus/packages/part018.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part018.fasta
    log: 7-consensus/packages/part018.err
    jobid: 789
    reason: Missing output files: 7-consensus/packages/part018.fasta
    wildcards: nnnn=018
    threads: 8
    resources: tmpdir=/data/tmp, job_id=18, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:45:40 2023]
Finished job 762.
719 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:45:40 2023]
rule generateConsensus:
    input: 7-consensus/packages/part025.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part025.fasta
    log: 7-consensus/packages/part025.err
    jobid: 763
    reason: Missing output files: 7-consensus/packages/part025.fasta
    wildcards: nnnn=025
    threads: 8
    resources: tmpdir=/data/tmp, job_id=25, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:46:58 2023]
Finished job 789.
720 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:46:59 2023]
rule generateConsensus:
    input: 7-consensus/packages/part021.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part021.fasta
    log: 7-consensus/packages/part021.err
    jobid: 767
    reason: Missing output files: 7-consensus/packages/part021.fasta
    wildcards: nnnn=021
    threads: 8
    resources: tmpdir=/data/tmp, job_id=21, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:47:48 2023]
Finished job 763.
721 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:47:48 2023]
rule generateConsensus:
    input: 7-consensus/packages/part007.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part007.fasta
    log: 7-consensus/packages/part007.err
    jobid: 774
    reason: Missing output files: 7-consensus/packages/part007.fasta
    wildcards: nnnn=007
    threads: 8
    resources: tmpdir=/data/tmp, job_id=7, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:48:01 2023]
Finished job 754.
722 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:48:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part026.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part026.fasta
    log: 7-consensus/packages/part026.err
    jobid: 788
    reason: Missing output files: 7-consensus/packages/part026.fasta
    wildcards: nnnn=026
    threads: 8
    resources: tmpdir=/data/tmp, job_id=26, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:48:51 2023]
Finished job 767.
723 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:48:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part009.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part009.fasta
    log: 7-consensus/packages/part009.err
    jobid: 795
    reason: Missing output files: 7-consensus/packages/part009.fasta
    wildcards: nnnn=009
    threads: 8
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:49:25 2023]
Finished job 774.
724 of 792 steps (91%) done
Select jobs to execute...

[Thu Mar 30 06:49:25 2023]
rule generateConsensus:
    input: 7-consensus/packages/part097.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part097.fasta
    log: 7-consensus/packages/part097.err
    jobid: 704
    reason: Missing output files: 7-consensus/packages/part097.fasta
    wildcards: nnnn=097
    threads: 8
    resources: tmpdir=/data/tmp, job_id=97, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:50:12 2023]
Finished job 788.
725 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:50:12 2023]
rule generateConsensus:
    input: 7-consensus/packages/part074.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part074.fasta
    log: 7-consensus/packages/part074.err
    jobid: 712
    reason: Missing output files: 7-consensus/packages/part074.fasta
    wildcards: nnnn=074
    threads: 8
    resources: tmpdir=/data/tmp, job_id=74, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 06:50:24 2023]
Finished job 795.
726 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:50:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part008.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part008.fasta
    log: 7-consensus/packages/part008.err
    jobid: 761
    reason: Missing output files: 7-consensus/packages/part008.fasta
    wildcards: nnnn=008
    threads: 8
    resources: tmpdir=/data/tmp, job_id=8, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:52:04 2023]
Finished job 761.
727 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:52:04 2023]
rule generateConsensus:
    input: 7-consensus/packages/part019.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part019.fasta
    log: 7-consensus/packages/part019.err
    jobid: 753
    reason: Missing output files: 7-consensus/packages/part019.fasta
    wildcards: nnnn=019
    threads: 8
    resources: tmpdir=/data/tmp, job_id=19, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:53:45 2023]
Finished job 753.
728 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:53:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part030.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part030.fasta
    log: 7-consensus/packages/part030.err
    jobid: 760
    reason: Missing output files: 7-consensus/packages/part030.fasta
    wildcards: nnnn=030
    threads: 8
    resources: tmpdir=/data/tmp, job_id=30, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 06:56:10 2023]
Finished job 760.
729 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:56:10 2023]
rule generateConsensus:
    input: 7-consensus/packages/part006.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part006.fasta
    log: 7-consensus/packages/part006.err
    jobid: 769
    reason: Missing output files: 7-consensus/packages/part006.fasta
    wildcards: nnnn=006
    threads: 8
    resources: tmpdir=/data/tmp, job_id=6, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 06:57:51 2023]
Finished job 769.
730 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:57:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part038.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part038.fasta
    log: 7-consensus/packages/part038.err
    jobid: 773
    reason: Missing output files: 7-consensus/packages/part038.fasta
    wildcards: nnnn=038
    threads: 8
    resources: tmpdir=/data/tmp, job_id=38, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 06:59:21 2023]
Finished job 712.
731 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 06:59:21 2023]
rule generateConsensus:
    input: 7-consensus/packages/part010.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part010.fasta
    log: 7-consensus/packages/part010.err
    jobid: 770
    reason: Missing output files: 7-consensus/packages/part010.fasta
    wildcards: nnnn=010
    threads: 8
    resources: tmpdir=/data/tmp, job_id=10, n_cpus=8, mem_gb=10, time_h=24

[Thu Mar 30 07:00:33 2023]
Finished job 773.
732 of 792 steps (92%) done
Select jobs to execute...

[Thu Mar 30 07:00:33 2023]
rule generateConsensus:
    input: 7-consensus/packages/part032.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part032.fasta
    log: 7-consensus/packages/part032.err
    jobid: 786
    reason: Missing output files: 7-consensus/packages/part032.fasta
    wildcards: nnnn=032
    threads: 8
    resources: tmpdir=/data/tmp, job_id=32, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:01:03 2023]
Finished job 770.
733 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:01:04 2023]
rule generateConsensus:
    input: 7-consensus/packages/part042.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part042.fasta
    log: 7-consensus/packages/part042.err
    jobid: 736
    reason: Missing output files: 7-consensus/packages/part042.fasta
    wildcards: nnnn=042
    threads: 8
    resources: tmpdir=/data/tmp, job_id=42, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:01:11 2023]
Finished job 727.
734 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:01:11 2023]
rule generateConsensus:
    input: 7-consensus/packages/part013.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part013.fasta
    log: 7-consensus/packages/part013.err
    jobid: 787
    reason: Missing output files: 7-consensus/packages/part013.fasta
    wildcards: nnnn=013
    threads: 8
    resources: tmpdir=/data/tmp, job_id=13, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:02:45 2023]
Finished job 786.
735 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:02:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part037.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part037.fasta
    log: 7-consensus/packages/part037.err
    jobid: 739
    reason: Missing output files: 7-consensus/packages/part037.fasta
    wildcards: nnnn=037
    threads: 8
    resources: tmpdir=/data/tmp, job_id=37, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:03:08 2023]
Finished job 787.
736 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:03:08 2023]
rule generateConsensus:
    input: 7-consensus/packages/part033.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part033.fasta
    log: 7-consensus/packages/part033.err
    jobid: 785
    reason: Missing output files: 7-consensus/packages/part033.fasta
    wildcards: nnnn=033
    threads: 8
    resources: tmpdir=/data/tmp, job_id=33, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:03:51 2023]
Finished job 736.
737 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:03:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part034.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part034.fasta
    log: 7-consensus/packages/part034.err
    jobid: 742
    reason: Missing output files: 7-consensus/packages/part034.fasta
    wildcards: nnnn=034
    threads: 8
    resources: tmpdir=/data/tmp, job_id=34, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:05:11 2023]
Finished job 729.
738 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:05:12 2023]
rule generateConsensus:
    input: 7-consensus/packages/part043.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part043.fasta
    log: 7-consensus/packages/part043.err
    jobid: 782
    reason: Missing output files: 7-consensus/packages/part043.fasta
    wildcards: nnnn=043
    threads: 8
    resources: tmpdir=/data/tmp, job_id=43, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:05:12 2023]
Finished job 739.
739 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:05:12 2023]
rule generateConsensus:
    input: 7-consensus/packages/part040.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part040.fasta
    log: 7-consensus/packages/part040.err
    jobid: 764
    reason: Missing output files: 7-consensus/packages/part040.fasta
    wildcards: nnnn=040
    threads: 8
    resources: tmpdir=/data/tmp, job_id=40, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:05:20 2023]
Finished job 785.
740 of 792 steps (93%) done
Select jobs to execute...

[Thu Mar 30 07:05:20 2023]
rule generateConsensus:
    input: 7-consensus/packages/part029.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part029.fasta
    log: 7-consensus/packages/part029.err
    jobid: 744
    reason: Missing output files: 7-consensus/packages/part029.fasta
    wildcards: nnnn=029
    threads: 8
    resources: tmpdir=/data/tmp, job_id=29, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:06:08 2023]
Finished job 742.
741 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:06:08 2023]
rule generateConsensus:
    input: 7-consensus/packages/part039.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part039.fasta
    log: 7-consensus/packages/part039.err
    jobid: 771
    reason: Missing output files: 7-consensus/packages/part039.fasta
    wildcards: nnnn=039
    threads: 8
    resources: tmpdir=/data/tmp, job_id=39, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:07:25 2023]
Finished job 744.
742 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:07:25 2023]
rule generateConsensus:
    input: 7-consensus/packages/part022.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part022.fasta
    log: 7-consensus/packages/part022.err
    jobid: 793
    reason: Missing output files: 7-consensus/packages/part022.fasta
    wildcards: nnnn=022
    threads: 8
    resources: tmpdir=/data/tmp, job_id=22, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:08:00 2023]
Finished job 782.
743 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:08:00 2023]
rule generateConsensus:
    input: 7-consensus/packages/part014.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part014.fasta
    log: 7-consensus/packages/part014.err
    jobid: 759
    reason: Missing output files: 7-consensus/packages/part014.fasta
    wildcards: nnnn=014
    threads: 8
    resources: tmpdir=/data/tmp, job_id=14, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:08:03 2023]
Finished job 764.
744 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:08:03 2023]
rule generateConsensus:
    input: 7-consensus/packages/part016.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part016.fasta
    log: 7-consensus/packages/part016.err
    jobid: 794
    reason: Missing output files: 7-consensus/packages/part016.fasta
    wildcards: nnnn=016
    threads: 8
    resources: tmpdir=/data/tmp, job_id=16, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:09:13 2023]
Finished job 771.
745 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:09:13 2023]
rule generateConsensus:
    input: 7-consensus/packages/part015.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part015.fasta
    log: 7-consensus/packages/part015.err
    jobid: 798
    reason: Missing output files: 7-consensus/packages/part015.fasta
    wildcards: nnnn=015
    threads: 8
    resources: tmpdir=/data/tmp, job_id=15, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:09:24 2023]
Finished job 793.
746 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:09:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part017.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part017.fasta
    log: 7-consensus/packages/part017.err
    jobid: 790
    reason: Missing output files: 7-consensus/packages/part017.fasta
    wildcards: nnnn=017
    threads: 8
    resources: tmpdir=/data/tmp, job_id=17, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:09:51 2023]
Finished job 794.
747 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:09:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part027.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part027.fasta
    log: 7-consensus/packages/part027.err
    jobid: 748
    reason: Missing output files: 7-consensus/packages/part027.fasta
    wildcards: nnnn=027
    threads: 8
    resources: tmpdir=/data/tmp, job_id=27, n_cpus=8, mem_gb=9, time_h=24

[Thu Mar 30 07:09:57 2023]
Finished job 759.
748 of 792 steps (94%) done
Select jobs to execute...

[Thu Mar 30 07:09:57 2023]
rule generateConsensus:
    input: 7-consensus/packages/part062.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part062.fasta
    log: 7-consensus/packages/part062.err
    jobid: 746
    reason: Missing output files: 7-consensus/packages/part062.fasta
    wildcards: nnnn=062
    threads: 8
    resources: tmpdir=/data/tmp, job_id=62, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:10:51 2023]
Finished job 798.
749 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:10:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part041.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part041.fasta
    log: 7-consensus/packages/part041.err
    jobid: 772
    reason: Missing output files: 7-consensus/packages/part041.fasta
    wildcards: nnnn=041
    threads: 8
    resources: tmpdir=/data/tmp, job_id=41, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:11:14 2023]
Finished job 790.
750 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:11:14 2023]
rule generateConsensus:
    input: 7-consensus/packages/part036.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part036.fasta
    log: 7-consensus/packages/part036.err
    jobid: 778
    reason: Missing output files: 7-consensus/packages/part036.fasta
    wildcards: nnnn=036
    threads: 8
    resources: tmpdir=/data/tmp, job_id=36, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:11:53 2023]
Finished job 748.
751 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:11:53 2023]
rule generateConsensus:
    input: 7-consensus/packages/part047.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part047.fasta
    log: 7-consensus/packages/part047.err
    jobid: 747
    reason: Missing output files: 7-consensus/packages/part047.fasta
    wildcards: nnnn=047
    threads: 8
    resources: tmpdir=/data/tmp, job_id=47, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:13:39 2023]
Finished job 778.
752 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:13:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part045.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part045.fasta
    log: 7-consensus/packages/part045.err
    jobid: 752
    reason: Missing output files: 7-consensus/packages/part045.fasta
    wildcards: nnnn=045
    threads: 8
    resources: tmpdir=/data/tmp, job_id=45, n_cpus=8, mem_gb=8, time_h=24

[Thu Mar 30 07:13:42 2023]
Finished job 772.
753 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:13:42 2023]
rule generateConsensus:
    input: 7-consensus/packages/part050.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part050.fasta
    log: 7-consensus/packages/part050.err
    jobid: 768
    reason: Missing output files: 7-consensus/packages/part050.fasta
    wildcards: nnnn=050
    threads: 8
    resources: tmpdir=/data/tmp, job_id=50, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:15:08 2023]
Finished job 747.
754 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:15:08 2023]
rule generateConsensus:
    input: 7-consensus/packages/part051.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part051.fasta
    log: 7-consensus/packages/part051.err
    jobid: 755
    reason: Missing output files: 7-consensus/packages/part051.fasta
    wildcards: nnnn=051
    threads: 8
    resources: tmpdir=/data/tmp, job_id=51, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:15:19 2023]
Finished job 746.
755 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:15:19 2023]
rule generateConsensus:
    input: 7-consensus/packages/part054.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part054.fasta
    log: 7-consensus/packages/part054.err
    jobid: 741
    reason: Missing output files: 7-consensus/packages/part054.fasta
    wildcards: nnnn=054
    threads: 8
    resources: tmpdir=/data/tmp, job_id=54, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:16:39 2023]
Finished job 752.
756 of 792 steps (95%) done
Select jobs to execute...

[Thu Mar 30 07:16:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part057.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part057.fasta
    log: 7-consensus/packages/part057.err
    jobid: 711
    reason: Missing output files: 7-consensus/packages/part057.fasta
    wildcards: nnnn=057
    threads: 8
    resources: tmpdir=/data/tmp, job_id=57, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:17:15 2023]
Finished job 768.
757 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:17:16 2023]
rule generateConsensus:
    input: 7-consensus/packages/part061.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part061.fasta
    log: 7-consensus/packages/part061.err
    jobid: 780
    reason: Missing output files: 7-consensus/packages/part061.fasta
    wildcards: nnnn=061
    threads: 8
    resources: tmpdir=/data/tmp, job_id=61, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:18:50 2023]
Finished job 755.
758 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:18:50 2023]
rule generateConsensus:
    input: 7-consensus/packages/part065.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part065.fasta
    log: 7-consensus/packages/part065.err
    jobid: 751
    reason: Missing output files: 7-consensus/packages/part065.fasta
    wildcards: nnnn=065
    threads: 8
    resources: tmpdir=/data/tmp, job_id=65, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:19:38 2023]
Finished job 741.
759 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:19:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part052.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part052.fasta
    log: 7-consensus/packages/part052.err
    jobid: 766
    reason: Missing output files: 7-consensus/packages/part052.fasta
    wildcards: nnnn=052
    threads: 8
    resources: tmpdir=/data/tmp, job_id=52, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:21:04 2023]
Finished job 711.
760 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:21:04 2023]
rule generateConsensus:
    input: 7-consensus/packages/part064.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part064.fasta
    log: 7-consensus/packages/part064.err
    jobid: 735
    reason: Missing output files: 7-consensus/packages/part064.fasta
    wildcards: nnnn=064
    threads: 8
    resources: tmpdir=/data/tmp, job_id=64, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:22:18 2023]
Finished job 780.
761 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:22:18 2023]
rule generateConsensus:
    input: 7-consensus/packages/part055.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part055.fasta
    log: 7-consensus/packages/part055.err
    jobid: 783
    reason: Missing output files: 7-consensus/packages/part055.fasta
    wildcards: nnnn=055
    threads: 8
    resources: tmpdir=/data/tmp, job_id=55, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:23:38 2023]
Finished job 766.
762 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:23:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part060.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part060.fasta
    log: 7-consensus/packages/part060.err
    jobid: 710
    reason: Missing output files: 7-consensus/packages/part060.fasta
    wildcards: nnnn=060
    threads: 8
    resources: tmpdir=/data/tmp, job_id=60, n_cpus=8, mem_gb=7, time_h=24

[Thu Mar 30 07:24:35 2023]
Finished job 751.
763 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:24:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part080.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part080.fasta
    log: 7-consensus/packages/part080.err
    jobid: 713
    reason: Missing output files: 7-consensus/packages/part080.fasta
    wildcards: nnnn=080
    threads: 8
    resources: tmpdir=/data/tmp, job_id=80, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:26:41 2023]
Finished job 783.
764 of 792 steps (96%) done
Select jobs to execute...

[Thu Mar 30 07:26:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part069.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part069.fasta
    log: 7-consensus/packages/part069.err
    jobid: 757
    reason: Missing output files: 7-consensus/packages/part069.fasta
    wildcards: nnnn=069
    threads: 8
    resources: tmpdir=/data/tmp, job_id=69, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:26:45 2023]
Finished job 735.
765 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:26:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part086.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part086.fasta
    log: 7-consensus/packages/part086.err
    jobid: 703
    reason: Missing output files: 7-consensus/packages/part086.fasta
    wildcards: nnnn=086
    threads: 8
    resources: tmpdir=/data/tmp, job_id=86, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:28:30 2023]
Finished job 710.
766 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:28:31 2023]
rule generateConsensus:
    input: 7-consensus/packages/part095.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part095.fasta
    log: 7-consensus/packages/part095.err
    jobid: 706
    reason: Missing output files: 7-consensus/packages/part095.fasta
    wildcards: nnnn=095
    threads: 8
    resources: tmpdir=/data/tmp, job_id=95, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:33:41 2023]
Finished job 757.
767 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:33:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part089.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part089.fasta
    log: 7-consensus/packages/part089.err
    jobid: 721
    reason: Missing output files: 7-consensus/packages/part089.fasta
    wildcards: nnnn=089
    threads: 8
    resources: tmpdir=/data/tmp, job_id=89, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:37:41 2023]
Finished job 713.
768 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:37:42 2023]
rule generateConsensus:
    input: 7-consensus/packages/part087.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part087.fasta
    log: 7-consensus/packages/part087.err
    jobid: 723
    reason: Missing output files: 7-consensus/packages/part087.fasta
    wildcards: nnnn=087
    threads: 8
    resources: tmpdir=/data/tmp, job_id=87, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:49:01 2023]
Finished job 703.
769 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:49:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part075.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part075.fasta
    log: 7-consensus/packages/part075.err
    jobid: 705
    reason: Missing output files: 7-consensus/packages/part075.fasta
    wildcards: nnnn=075
    threads: 8
    resources: tmpdir=/data/tmp, job_id=75, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 07:58:52 2023]
Finished job 705.
770 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 07:58:52 2023]
rule generateConsensus:
    input: 7-consensus/packages/part084.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part084.fasta
    log: 7-consensus/packages/part084.err
    jobid: 731
    reason: Missing output files: 7-consensus/packages/part084.fasta
    wildcards: nnnn=084
    threads: 8
    resources: tmpdir=/data/tmp, job_id=84, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:02:14 2023]
Finished job 723.
771 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 08:02:14 2023]
rule generateConsensus:
    input: 7-consensus/packages/part072.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part072.fasta
    log: 7-consensus/packages/part072.err
    jobid: 740
    reason: Missing output files: 7-consensus/packages/part072.fasta
    wildcards: nnnn=072
    threads: 8
    resources: tmpdir=/data/tmp, job_id=72, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:03:46 2023]
Finished job 721.
772 of 792 steps (97%) done
Select jobs to execute...

[Thu Mar 30 08:03:46 2023]
rule generateConsensus:
    input: 7-consensus/packages/part090.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part090.fasta
    log: 7-consensus/packages/part090.err
    jobid: 724
    reason: Missing output files: 7-consensus/packages/part090.fasta
    wildcards: nnnn=090
    threads: 8
    resources: tmpdir=/data/tmp, job_id=90, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:03:52 2023]
Finished job 702.
773 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:03:52 2023]
rule generateConsensus:
    input: 7-consensus/packages/part083.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part083.fasta
    log: 7-consensus/packages/part083.err
    jobid: 717
    reason: Missing output files: 7-consensus/packages/part083.fasta
    wildcards: nnnn=083
    threads: 8
    resources: tmpdir=/data/tmp, job_id=83, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:10:34 2023]
Finished job 740.
774 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:10:34 2023]
rule generateConsensus:
    input: 7-consensus/packages/part094.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part094.fasta
    log: 7-consensus/packages/part094.err
    jobid: 714
    reason: Missing output files: 7-consensus/packages/part094.fasta
    wildcards: nnnn=094
    threads: 8
    resources: tmpdir=/data/tmp, job_id=94, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:17:16 2023]
Finished job 731.
775 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:17:17 2023]
rule generateConsensus:
    input: 7-consensus/packages/part081.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part081.fasta
    log: 7-consensus/packages/part081.err
    jobid: 728
    reason: Missing output files: 7-consensus/packages/part081.fasta
    wildcards: nnnn=081
    threads: 8
    resources: tmpdir=/data/tmp, job_id=81, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:20:43 2023]
Finished job 717.
776 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:20:43 2023]
rule generateConsensus:
    input: 7-consensus/packages/part078.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part078.fasta
    log: 7-consensus/packages/part078.err
    jobid: 726
    reason: Missing output files: 7-consensus/packages/part078.fasta
    wildcards: nnnn=078
    threads: 8
    resources: tmpdir=/data/tmp, job_id=78, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:31:24 2023]
Finished job 728.
777 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:31:24 2023]
rule generateConsensus:
    input: 7-consensus/packages/part070.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part070.fasta
    log: 7-consensus/packages/part070.err
    jobid: 745
    reason: Missing output files: 7-consensus/packages/part070.fasta
    wildcards: nnnn=070
    threads: 8
    resources: tmpdir=/data/tmp, job_id=70, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:32:32 2023]
Finished job 726.
778 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:32:33 2023]
rule generateConsensus:
    input: 7-consensus/packages/part092.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part092.fasta
    log: 7-consensus/packages/part092.err
    jobid: 720
    reason: Missing output files: 7-consensus/packages/part092.fasta
    wildcards: nnnn=092
    threads: 8
    resources: tmpdir=/data/tmp, job_id=92, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:38:01 2023]
Finished job 724.
779 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:38:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part071.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part071.fasta
    log: 7-consensus/packages/part071.err
    jobid: 708
    reason: Missing output files: 7-consensus/packages/part071.fasta
    wildcards: nnnn=071
    threads: 8
    resources: tmpdir=/data/tmp, job_id=71, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:39:01 2023]
Finished job 745.
780 of 792 steps (98%) done
Select jobs to execute...

[Thu Mar 30 08:39:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part079.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part079.fasta
    log: 7-consensus/packages/part079.err
    jobid: 718
    reason: Missing output files: 7-consensus/packages/part079.fasta
    wildcards: nnnn=079
    threads: 8
    resources: tmpdir=/data/tmp, job_id=79, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:45:38 2023]
Finished job 708.
781 of 792 steps (99%) done
Select jobs to execute...

[Thu Mar 30 08:45:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part093.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part093.fasta
    log: 7-consensus/packages/part093.err
    jobid: 716
    reason: Missing output files: 7-consensus/packages/part093.fasta
    wildcards: nnnn=093
    threads: 8
    resources: tmpdir=/data/tmp, job_id=93, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:50:27 2023]
Finished job 704.
782 of 792 steps (99%) done
Select jobs to execute...

[Thu Mar 30 08:50:27 2023]
rule generateConsensus:
    input: 7-consensus/packages/part077.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part077.fasta
    log: 7-consensus/packages/part077.err
    jobid: 732
    reason: Missing output files: 7-consensus/packages/part077.fasta
    wildcards: nnnn=077
    threads: 8
    resources: tmpdir=/data/tmp, job_id=77, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:51:23 2023]
Finished job 718.
783 of 792 steps (99%) done
Select jobs to execute...

[Thu Mar 30 08:51:23 2023]
rule generateConsensus:
    input: 7-consensus/packages/part085.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part085.fasta
    log: 7-consensus/packages/part085.err
    jobid: 725
    reason: Missing output files: 7-consensus/packages/part085.fasta
    wildcards: nnnn=085
    threads: 8
    resources: tmpdir=/data/tmp, job_id=85, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 08:54:54 2023]
Finished job 706.
784 of 792 steps (99%) done
Select jobs to execute...

[Thu Mar 30 08:54:54 2023]
rule generateConsensus:
    input: 7-consensus/packages/part068.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part068.fasta
    log: 7-consensus/packages/part068.err
    jobid: 737
    reason: Missing output files: 7-consensus/packages/part068.fasta
    wildcards: nnnn=068
    threads: 8
    resources: tmpdir=/data/tmp, job_id=68, n_cpus=8, mem_gb=6, time_h=24

[Thu Mar 30 09:01:20 2023]
Finished job 732.
785 of 792 steps (99%) done
[Thu Mar 30 09:01:46 2023]
Finished job 737.
786 of 792 steps (99%) done
[Thu Mar 30 09:11:07 2023]
Finished job 725.
787 of 792 steps (99%) done
[Thu Mar 30 09:16:01 2023]
Finished job 714.
788 of 792 steps (99%) done
[Thu Mar 30 09:17:46 2023]
Finished job 720.
789 of 792 steps (99.6%) done
[Thu Mar 30 09:38:46 2023]
Finished job 716.
790 of 792 steps (99.7%) done
Select jobs to execute...

[Thu Mar 30 09:38:46 2023]
rule combineConsensus:
    input: 7-consensus/packages/part096.fasta, 7-consensus/packages/part086.fasta, 7-consensus/packages/part097.fasta, 7-consensus/packages/part075.fasta, 7-consensus/packages/part095.fasta, 7-consensus/packages/part063.fasta, 7-consensus/packages/part071.fasta, 7-consensus/packages/part003.fasta, 7-consensus/packages/part060.fasta, 7-consensus/packages/part057.fasta, 7-consensus/packages/part074.fasta, 7-consensus/packages/part080.fasta, 7-consensus/packages/part094.fasta, 7-consensus/packages/part076.fasta, 7-consensus/packages/part093.fasta, 7-consensus/packages/part083.fasta, 7-consensus/packages/part079.fasta, 7-consensus/packages/part066.fasta, 7-consensus/packages/part092.fasta, 7-consensus/packages/part089.fasta, 7-consensus/packages/part004.fasta, 7-consensus/packages/part087.fasta, 7-consensus/packages/part090.fasta, 7-consensus/packages/part085.fasta, 7-consensus/packages/part078.fasta, 7-consensus/packages/part088.fasta, 7-consensus/packages/part081.fasta, 7-consensus/packages/part091.fasta, 7-consensus/packages/part058.fasta, 7-consensus/packages/part084.fasta, 7-consensus/packages/part077.fasta, 7-consensus/packages/part049.fasta, 7-consensus/packages/part082.fasta, 7-consensus/packages/part064.fasta, 7-consensus/packages/part042.fasta, 7-consensus/packages/part068.fasta, 7-consensus/packages/part059.fasta, 7-consensus/packages/part037.fasta, 7-consensus/packages/part072.fasta, 7-consensus/packages/part054.fasta, 7-consensus/packages/part034.fasta, 7-consensus/packages/part073.fasta, 7-consensus/packages/part029.fasta, 7-consensus/packages/part070.fasta, 7-consensus/packages/part062.fasta, 7-consensus/packages/part047.fasta, 7-consensus/packages/part027.fasta, 7-consensus/packages/part048.fasta, 7-consensus/packages/part067.fasta, 7-consensus/packages/part065.fasta, 7-consensus/packages/part045.fasta, 7-consensus/packages/part019.fasta, 7-consensus/packages/part044.fasta, 7-consensus/packages/part051.fasta, 7-consensus/packages/part020.fasta, 7-consensus/packages/part069.fasta, 7-consensus/packages/part046.fasta, 7-consensus/packages/part014.fasta, 7-consensus/packages/part030.fasta, 7-consensus/packages/part008.fasta, 7-consensus/packages/part028.fasta, 7-consensus/packages/part025.fasta, 7-consensus/packages/part040.fasta, 7-consensus/packages/part056.fasta, 7-consensus/packages/part052.fasta, 7-consensus/packages/part021.fasta, 7-consensus/packages/part050.fasta, 7-consensus/packages/part006.fasta, 7-consensus/packages/part010.fasta, 7-consensus/packages/part039.fasta, 7-consensus/packages/part041.fasta, 7-consensus/packages/part038.fasta, 7-consensus/packages/part007.fasta, 7-consensus/packages/part031.fasta, 7-consensus/packages/part053.fasta, 7-consensus/packages/part035.fasta, 7-consensus/packages/part036.fasta, 7-consensus/packages/part024.fasta, 7-consensus/packages/part061.fasta, 7-consensus/packages/part012.fasta, 7-consensus/packages/part043.fasta, 7-consensus/packages/part055.fasta, 7-consensus/packages/part023.fasta, 7-consensus/packages/part033.fasta, 7-consensus/packages/part032.fasta, 7-consensus/packages/part013.fasta, 7-consensus/packages/part026.fasta, 7-consensus/packages/part018.fasta, 7-consensus/packages/part017.fasta, 7-consensus/packages/part005.fasta, 7-consensus/packages/part011.fasta, 7-consensus/packages/part022.fasta, 7-consensus/packages/part016.fasta, 7-consensus/packages/part009.fasta, 7-consensus/packages/part002.fasta, 7-consensus/packages/part001.fasta, 7-consensus/packages/part015.fasta, 7-consensus/packages.tigName_to_ID.map, 6-layoutContigs/unitig-popped.layout.scfmap, 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 7-consensus/packages.finished, emptyfile, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    output: 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype1.fasta, 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta
    log: 7-consensus/combineConsensus.out, 7-consensus/combineConsensus.err
    jobid: 17
    reason: Missing output files: 7-consensus/unitig-popped.unassigned.fasta, 7-consensus/unitig-popped.haplotype1.fasta, 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype2.fasta; Input files updated by another job: 7-consensus/packages/part010.fasta, 7-consensus/packages/part083.fasta, 7-consensus/packages/part005.fasta, 7-consensus/packages/part097.fasta, 7-consensus/packages/part092.fasta, 7-consensus/packages/part023.fasta, 7-consensus/packages/part020.fasta, 7-consensus/packages/part079.fasta, 7-consensus/packages/part067.fasta, 7-consensus/packages/part043.fasta, 7-consensus/packages/part022.fasta, 7-consensus/packages/part077.fasta, 7-consensus/packages/part026.fasta, 7-consensus/packages/part061.fasta, 7-consensus/packages/part057.fasta, 7-consensus/packages/part065.fasta, 7-consensus/packages/part024.fasta, 7-consensus/packages/part078.fasta, 7-consensus/packages/part081.fasta, 7-consensus/packages/part091.fasta, 7-consensus/packages/part001.fasta, 7-consensus/packages/part012.fasta, 7-consensus/packages/part095.fasta, 7-consensus/packages/part060.fasta, 7-consensus/packages/part048.fasta, 7-consensus/packages/part054.fasta, 7-consensus/packages/part004.fasta, 7-consensus/packages/part063.fasta, 7-consensus/packages/part074.fasta, 7-consensus/packages/part059.fasta, 7-consensus/packages/part062.fasta, 7-consensus/packages/part016.fasta, 7-consensus/packages/part045.fasta, 7-consensus/packages/part085.fasta, 7-consensus/packages/part035.fasta, 7-consensus/packages/part009.fasta, 7-consensus/packages/part038.fasta, 7-consensus/packages/part096.fasta, 7-consensus/packages/part011.fasta, 7-consensus/packages/part069.fasta, 7-consensus/packages/part027.fasta, 7-consensus/packages/part039.fasta, 7-consensus/packages/part029.fasta, 7-consensus/packages/part019.fasta, 7-consensus/packages/part008.fasta, 7-consensus/packages/part033.fasta, 7-consensus/packages/part032.fasta, 7-consensus/packages/part049.fasta, 7-consensus/packages/part094.fasta, 7-consensus/packages/part087.fasta, 7-consensus/packages/part040.fasta, 7-consensus/packages/part013.fasta, 7-consensus/packages/part028.fasta, 7-consensus/packages/part086.fasta, 7-consensus/packages/part090.fasta, 7-consensus/packages/part007.fasta, 7-consensus/packages/part056.fasta, 7-consensus/packages/part021.fasta, 7-consensus/packages/part068.fasta, 7-consensus/packages/part041.fasta, 7-consensus/packages/part066.fasta, 7-consensus/packages/part025.fasta, 7-consensus/packages/part047.fasta, 7-consensus/packages/part093.fasta, 7-consensus/packages/part052.fasta, 7-consensus/packages/part050.fasta, 7-consensus/packages/part044.fasta, 7-consensus/packages/part075.fasta, 7-consensus/packages/part072.fasta, 7-consensus/packages/part080.fasta, 7-consensus/packages/part070.fasta, 7-consensus/packages/part088.fasta, 7-consensus/packages/part058.fasta, 7-consensus/packages/part037.fasta, 7-consensus/packages/part071.fasta, 7-consensus/packages/part076.fasta, 7-consensus/packages/part030.fasta, 7-consensus/packages/part089.fasta, 7-consensus/packages/part073.fasta, 7-consensus/packages/part006.fasta, 7-consensus/packages/part031.fasta, 7-consensus/packages/part046.fasta, 7-consensus/packages/part014.fasta, 7-consensus/packages/part053.fasta, 7-consensus/packages/part003.fasta, 7-consensus/packages/part015.fasta, 7-consensus/packages/part036.fasta, 7-consensus/packages/part055.fasta, 7-consensus/packages/part082.fasta, 7-consensus/packages/part051.fasta, 7-consensus/packages/part064.fasta, 7-consensus/packages/part042.fasta, 7-consensus/packages/part034.fasta, 7-consensus/packages/part017.fasta, 7-consensus/packages/part018.fasta, 7-consensus/packages/part002.fasta, 7-consensus/packages/part084.fasta
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=10, time_h=4

[Thu Mar 30 09:44:40 2023]
Finished job 17.
791 of 792 steps (99.9%) done
Select jobs to execute...

[Thu Mar 30 09:44:40 2023]
localrule verkko:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, emptyfile, 6-layoutContigs/unitig-popped.layout, 6-layoutContigs/unitig-popped.layout.scfmap, 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype1.fasta, 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta, emptyfile, 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv
    output: assembly.homopolymer-compressed.gfa, assembly.homopolymer-compressed.noseq.gfa, assembly.homopolymer-compressed.layout, assembly.hifi-coverage.csv, assembly.ont-coverage.csv, assembly.fasta, assembly.scfmap
    jobid: 0
    reason: Missing output files: assembly.hifi-coverage.csv, assembly.homopolymer-compressed.layout, assembly.scfmap, assembly.ont-coverage.csv, assembly.homopolymer-compressed.noseq.gfa, assembly.homopolymer-compressed.gfa, assembly.fasta; Input files updated by another job: 7-consensus/unitig-popped.fasta, 6-layoutContigs/unitig-popped.layout.scfmap, 7-consensus/unitig-popped.unassigned.fasta, emptyfile, 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 7-consensus/unitig-popped.haplotype1.fasta, 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv, 6-layoutContigs/unitig-popped.layout, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv, 7-consensus/unitig-popped.haplotype2.fasta, 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv
    resources: tmpdir=/data/tmp

Reading graph from stdin
[Thu Mar 30 09:46:16 2023]
Finished job 0.
792 of 792 steps (100%) done
Complete log: .snakemake/log/2023-03-27T113415.374172.snakemake.log
