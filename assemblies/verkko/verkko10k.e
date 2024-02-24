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
combineConsensus                   1              1              1
combineONT                         1              1              1
emptyfile                          1              1              1
extractONT                         1              8              8
generateLayoutContigsInputs        1              1              1
getCoverage                        3              1              1
layoutContigs                      1              1              1
prepCoverage                       1              1              1
processGraph                       1              1              1
processONT                         1              1              1
splitONT                           1              1              1
untip                              1              1              1
verkko                             1              1              1
total                             17              1              8

Select jobs to execute...

[Thu Apr  6 07:48:39 2023]
localrule emptyfile:
    output: emptyfile
    jobid: 14
    reason: Missing output files: emptyfile
    resources: tmpdir=/data/tmp


[Thu Apr  6 07:48:39 2023]
rule buildGraph:
    input: hifi-corrected.fasta.gz
    output: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/hifi_nodecov.csv, 1-buildGraph/paths.gaf
    log: 1-buildGraph/buildGraph.err
    jobid: 4
    reason: Missing output files: 1-buildGraph/hifi_nodecov.csv, 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf
    threads: 4
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=4, mem_gb=36, time_h=72


[Thu Apr  6 07:48:39 2023]
checkpoint splitONT:
    input: /public/groups/meyerlab/gvtp/assemblies/verkko10k/../../ont/10kb/ont_all_10kfilt.fastq
    output: 3-align/splitONT.finished
    log: 3-align/splitONT.err
    jobid: 13
    reason: Missing output files: 3-align/splitONT.finished
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=8, time_h=96
DAG of jobs will be updated after completion.

[Thu Apr  6 07:48:39 2023]
Finished job 14.
1 of 17 steps (6%) done
[Thu Apr  6 08:18:09 2023]
Finished job 13.
2 of 17 steps (12%) done
[Fri Apr  7 05:24:51 2023]
Finished job 4.
3 of 39 steps (8%) done
Select jobs to execute...

[Fri Apr  7 05:24:51 2023]
rule processGraph:
    input: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf
    output: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 2-processGraph/unitig-mapping-1.txt
    log: 2-processGraph/process.err
    jobid: 3
    reason: Missing output files: 2-processGraph/unitig-unrolled-hifi-resolved.gfa; Input files updated by another job: 1-buildGraph/hifi-resolved.gfa, 1-buildGraph/paths.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24

[Fri Apr  7 05:37:13 2023]
Finished job 3.
4 of 39 steps (10%) done
Select jobs to execute...

[Fri Apr  7 05:37:13 2023]
rule indexGraph:
    input: 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/graph.index
    log: 3-align/index.err
    jobid: 30
    reason: Missing output files: 3-align/graph.index; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=85, time_h=24

[Fri Apr  7 06:36:27 2023]
Finished job 30.
5 of 39 steps (13%) done
Select jobs to execute...

[Fri Apr  7 06:36:27 2023]
rule alignONT:
    input: 3-align/split/ont001.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned001.gaf
    log: 3-align/aligned001.err
    jobid: 29
    reason: Missing output files: 3-align/aligned001.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=001
    threads: 24
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=24, mem_gb=23, time_h=24


[Fri Apr  7 06:36:27 2023]
rule alignONT:
    input: 3-align/split/ont002.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned002.gaf
    log: 3-align/aligned002.err
    jobid: 31
    reason: Missing output files: 3-align/aligned002.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=002
    threads: 24
    resources: tmpdir=/data/tmp, job_id=2, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 07:23:39 2023]
Finished job 29.
6 of 39 steps (15%) done
Select jobs to execute...

[Fri Apr  7 07:23:39 2023]
rule alignONT:
    input: 3-align/split/ont017.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned017.gaf
    log: 3-align/aligned017.err
    jobid: 46
    reason: Missing output files: 3-align/aligned017.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=017
    threads: 24
    resources: tmpdir=/data/tmp, job_id=17, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 07:23:50 2023]
Finished job 31.
7 of 39 steps (18%) done
Select jobs to execute...

[Fri Apr  7 07:23:50 2023]
rule alignONT:
    input: 3-align/split/ont016.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned016.gaf
    log: 3-align/aligned016.err
    jobid: 45
    reason: Missing output files: 3-align/aligned016.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=016
    threads: 24
    resources: tmpdir=/data/tmp, job_id=16, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 08:09:25 2023]
Finished job 45.
8 of 39 steps (21%) done
Select jobs to execute...

[Fri Apr  7 08:09:25 2023]
rule alignONT:
    input: 3-align/split/ont015.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned015.gaf
    log: 3-align/aligned015.err
    jobid: 44
    reason: Missing output files: 3-align/aligned015.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=015
    threads: 24
    resources: tmpdir=/data/tmp, job_id=15, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 08:09:52 2023]
Finished job 46.
9 of 39 steps (23%) done
Select jobs to execute...

[Fri Apr  7 08:09:52 2023]
rule alignONT:
    input: 3-align/split/ont010.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned010.gaf
    log: 3-align/aligned010.err
    jobid: 39
    reason: Missing output files: 3-align/aligned010.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=010
    threads: 24
    resources: tmpdir=/data/tmp, job_id=10, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 08:55:07 2023]
Finished job 44.
10 of 39 steps (26%) done
Select jobs to execute...

[Fri Apr  7 08:55:07 2023]
rule alignONT:
    input: 3-align/split/ont008.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned008.gaf
    log: 3-align/aligned008.err
    jobid: 37
    reason: Missing output files: 3-align/aligned008.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=008
    threads: 24
    resources: tmpdir=/data/tmp, job_id=8, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 08:55:54 2023]
Finished job 39.
11 of 39 steps (28%) done
Select jobs to execute...

[Fri Apr  7 08:55:54 2023]
rule alignONT:
    input: 3-align/split/ont011.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned011.gaf
    log: 3-align/aligned011.err
    jobid: 40
    reason: Missing output files: 3-align/aligned011.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=011
    threads: 24
    resources: tmpdir=/data/tmp, job_id=11, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 09:40:44 2023]
Finished job 37.
12 of 39 steps (31%) done
Select jobs to execute...

[Fri Apr  7 09:40:44 2023]
rule alignONT:
    input: 3-align/split/ont007.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned007.gaf
    log: 3-align/aligned007.err
    jobid: 36
    reason: Missing output files: 3-align/aligned007.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=007
    threads: 24
    resources: tmpdir=/data/tmp, job_id=7, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 09:42:03 2023]
Finished job 40.
13 of 39 steps (33%) done
Select jobs to execute...

[Fri Apr  7 09:42:03 2023]
rule alignONT:
    input: 3-align/split/ont009.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned009.gaf
    log: 3-align/aligned009.err
    jobid: 38
    reason: Missing output files: 3-align/aligned009.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=009
    threads: 24
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 10:26:58 2023]
Finished job 36.
14 of 39 steps (36%) done
Select jobs to execute...

[Fri Apr  7 10:26:58 2023]
rule alignONT:
    input: 3-align/split/ont005.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned005.gaf
    log: 3-align/aligned005.err
    jobid: 34
    reason: Missing output files: 3-align/aligned005.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=005
    threads: 24
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 10:27:38 2023]
Finished job 38.
15 of 39 steps (38%) done
Select jobs to execute...

[Fri Apr  7 10:27:38 2023]
rule alignONT:
    input: 3-align/split/ont006.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned006.gaf
    log: 3-align/aligned006.err
    jobid: 35
    reason: Missing output files: 3-align/aligned006.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=006
    threads: 24
    resources: tmpdir=/data/tmp, job_id=6, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 11:12:53 2023]
Finished job 34.
16 of 39 steps (41%) done
Select jobs to execute...

[Fri Apr  7 11:12:53 2023]
rule alignONT:
    input: 3-align/split/ont014.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned014.gaf
    log: 3-align/aligned014.err
    jobid: 43
    reason: Missing output files: 3-align/aligned014.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=014
    threads: 24
    resources: tmpdir=/data/tmp, job_id=14, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 11:13:07 2023]
Finished job 35.
17 of 39 steps (44%) done
Select jobs to execute...

[Fri Apr  7 11:13:07 2023]
rule alignONT:
    input: 3-align/split/ont004.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned004.gaf
    log: 3-align/aligned004.err
    jobid: 33
    reason: Missing output files: 3-align/aligned004.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=004
    threads: 24
    resources: tmpdir=/data/tmp, job_id=4, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 11:58:59 2023]
Finished job 33.
18 of 39 steps (46%) done
Select jobs to execute...

[Fri Apr  7 11:58:59 2023]
rule alignONT:
    input: 3-align/split/ont012.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned012.gaf
    log: 3-align/aligned012.err
    jobid: 41
    reason: Missing output files: 3-align/aligned012.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=012
    threads: 24
    resources: tmpdir=/data/tmp, job_id=12, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 11:59:07 2023]
Finished job 43.
19 of 39 steps (49%) done
Select jobs to execute...

[Fri Apr  7 11:59:07 2023]
rule alignONT:
    input: 3-align/split/ont013.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned013.gaf
    log: 3-align/aligned013.err
    jobid: 42
    reason: Missing output files: 3-align/aligned013.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=013
    threads: 24
    resources: tmpdir=/data/tmp, job_id=13, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 12:44:42 2023]
Finished job 41.
20 of 39 steps (51%) done
Select jobs to execute...

[Fri Apr  7 12:44:42 2023]
rule alignONT:
    input: 3-align/split/ont003.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned003.gaf
    log: 3-align/aligned003.err
    jobid: 32
    reason: Missing output files: 3-align/aligned003.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=003
    threads: 24
    resources: tmpdir=/data/tmp, job_id=3, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 12:45:07 2023]
Finished job 42.
21 of 39 steps (54%) done
Select jobs to execute...

[Fri Apr  7 12:45:07 2023]
rule alignONT:
    input: 3-align/split/ont020.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned020.gaf
    log: 3-align/aligned020.err
    jobid: 49
    reason: Missing output files: 3-align/aligned020.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=020
    threads: 24
    resources: tmpdir=/data/tmp, job_id=20, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 13:32:03 2023]
Finished job 49.
22 of 39 steps (56%) done
Select jobs to execute...

[Fri Apr  7 13:32:03 2023]
rule alignONT:
    input: 3-align/split/ont019.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned019.gaf
    log: 3-align/aligned019.err
    jobid: 48
    reason: Missing output files: 3-align/aligned019.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=019
    threads: 24
    resources: tmpdir=/data/tmp, job_id=19, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 13:32:27 2023]
Finished job 32.
23 of 39 steps (59%) done
Select jobs to execute...

[Fri Apr  7 13:32:27 2023]
rule alignONT:
    input: 3-align/split/ont018.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned018.gaf
    log: 3-align/aligned018.err
    jobid: 47
    reason: Missing output files: 3-align/aligned018.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=018
    threads: 24
    resources: tmpdir=/data/tmp, job_id=18, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 14:18:38 2023]
Finished job 47.
24 of 39 steps (62%) done
Select jobs to execute...

[Fri Apr  7 14:18:38 2023]
rule alignONT:
    input: 3-align/split/ont021.fasta.gz, 3-align/graph.index, 2-processGraph/unitig-unrolled-hifi-resolved.gfa
    output: 3-align/aligned021.gaf
    log: 3-align/aligned021.err
    jobid: 50
    reason: Missing output files: 3-align/aligned021.gaf; Input files updated by another job: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/graph.index
    wildcards: nnnn=021
    threads: 24
    resources: tmpdir=/data/tmp, job_id=21, n_cpus=24, mem_gb=23, time_h=24

[Fri Apr  7 14:18:53 2023]
Finished job 48.
25 of 39 steps (64%) done
[Fri Apr  7 14:40:45 2023]
Finished job 50.
26 of 39 steps (67%) done
Select jobs to execute...

[Fri Apr  7 14:40:45 2023]
rule combineONT:
    input: 3-align/splitONT.finished, 3-align/aligned001.gaf, 3-align/aligned002.gaf, 3-align/aligned003.gaf, 3-align/aligned004.gaf, 3-align/aligned005.gaf, 3-align/aligned006.gaf, 3-align/aligned007.gaf, 3-align/aligned008.gaf, 3-align/aligned009.gaf, 3-align/aligned010.gaf, 3-align/aligned011.gaf, 3-align/aligned012.gaf, 3-align/aligned013.gaf, 3-align/aligned014.gaf, 3-align/aligned015.gaf, 3-align/aligned016.gaf, 3-align/aligned017.gaf, 3-align/aligned018.gaf, 3-align/aligned019.gaf, 3-align/aligned020.gaf, 3-align/aligned021.gaf
    output: 3-align/alns-ont.gaf
    log: 3-align/combineONT.err
    jobid: 12
    reason: Missing output files: 3-align/alns-ont.gaf; Input files updated by another job: 3-align/aligned006.gaf, 3-align/aligned001.gaf, 3-align/aligned002.gaf, 3-align/aligned004.gaf, 3-align/aligned020.gaf, 3-align/aligned021.gaf, 3-align/aligned012.gaf, 3-align/aligned003.gaf, 3-align/aligned011.gaf, 3-align/aligned015.gaf, 3-align/aligned018.gaf, 3-align/aligned005.gaf, 3-align/aligned007.gaf, 3-align/aligned019.gaf, 3-align/aligned013.gaf, 3-align/aligned009.gaf, 3-align/aligned017.gaf, 3-align/aligned014.gaf, 3-align/aligned010.gaf, 3-align/aligned016.gaf, 3-align/aligned008.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=2

[Fri Apr  7 14:40:52 2023]
Finished job 12.
27 of 39 steps (69%) done
Select jobs to execute...

[Fri Apr  7 14:40:52 2023]
rule processONT:
    input: 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 1-buildGraph/hifi_nodecov.csv, 3-align/alns-ont.gaf
    output: 4-processONT/unitig-unrolled-ont-resolved.gfa, 4-processONT/gaps-ont.gaf, 4-processONT/nodecovs-ont.csv
    log: 4-processONT/processONT.err
    jobid: 2
    reason: Missing output files: 4-processONT/unitig-unrolled-ont-resolved.gfa, 4-processONT/nodecovs-ont.csv, 4-processONT/gaps-ont.gaf; Input files updated by another job: 1-buildGraph/hifi_nodecov.csv, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 3-align/alns-ont.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24

[Fri Apr  7 16:25:49 2023]
Finished job 2.
28 of 39 steps (72%) done
Select jobs to execute...

[Fri Apr  7 16:25:50 2023]
rule untip:
    input: 4-processONT/unitig-unrolled-ont-resolved.gfa, 1-buildGraph/hifi_nodecov.csv
    output: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 5-untip/nodecov_hifi_fix.csv
    log: 5-untip/untip.err
    jobid: 1
    reason: Missing output files: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa; Input files updated by another job: 4-processONT/unitig-unrolled-ont-resolved.gfa, 1-buildGraph/hifi_nodecov.csv
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=64, time_h=24


[Fri Apr  7 16:25:50 2023]
rule extractONT:
    input: 4-processONT/gaps-ont.gaf, 3-align/splitONT.finished
    output: 7-consensus/ont_subset.id, 7-consensus/ont_subset.extract, 7-consensus/ont_subset.fasta.gz
    log: 7-consensus/extractONT.err
    jobid: 19
    reason: Missing output files: 7-consensus/ont_subset.fasta.gz; Input files updated by another job: 4-processONT/gaps-ont.gaf
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=16, time_h=24

[Fri Apr  7 16:28:11 2023]
Finished job 19.
29 of 39 steps (74%) done
[Fri Apr  7 16:51:36 2023]
Finished job 1.
30 of 39 steps (77%) done
Select jobs to execute...

[Fri Apr  7 16:51:37 2023]
rule prepCoverage:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    output: 5-untip/combined-edges-final.gfa, 5-untip/nodelens-final.txt, 5-untip/combined-nodemap-final.txt
    log: 5-untip/prepCoverage.err
    jobid: 21
    reason: Missing output files: 5-untip/combined-edges-final.gfa, 5-untip/nodelens-final.txt, 5-untip/combined-nodemap-final.txt; Input files updated by another job: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=4, time_h=2


[Fri Apr  7 16:51:37 2023]
rule generateLayoutContigsInputs:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 1-buildGraph/paths.gaf
    output: 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/nodelens.txt
    log: 6-layoutContigs/createLayoutInputs.err
    jobid: 16
    reason: Missing output files: 6-layoutContigs/nodelens.txt, 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/combined-edges.gfa; Input files updated by another job: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 1-buildGraph/paths.gaf
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=32, time_h=24

[Fri Apr  7 17:04:30 2023]
Finished job 21.
31 of 39 steps (79%) done
Select jobs to execute...

[Fri Apr  7 17:04:30 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 4-processONT/unitig-unrolled-ont-resolved.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv
    log: 4-processONT/unitig-unrolled-ont-resolved.getCoverage.err
    jobid: 23
    reason: Missing output files: 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv; Input files updated by another job: 5-untip/combined-edges-final.gfa, 1-buildGraph/hifi_nodecov.csv, 4-processONT/unitig-unrolled-ont-resolved.gfa, 5-untip/combined-nodemap-final.txt, 4-processONT/nodecovs-ont.csv, 5-untip/nodelens-final.txt
    wildcards: dir=4-processONT, id=unitig-unrolled-ont-resolved
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2


[Fri Apr  7 17:04:30 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv
    log: 5-untip/unitig-popped-unitig-normal-connected-tip.getCoverage.err
    jobid: 20
    reason: Missing output files: 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv; Input files updated by another job: 5-untip/combined-edges-final.gfa, 1-buildGraph/hifi_nodecov.csv, 5-untip/combined-nodemap-final.txt, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 4-processONT/nodecovs-ont.csv, 5-untip/nodelens-final.txt
    wildcards: dir=5-untip, id=unitig-popped-unitig-normal-connected-tip
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2


[Fri Apr  7 17:04:31 2023]
rule getCoverage:
    input: 1-buildGraph/hifi_nodecov.csv, 4-processONT/nodecovs-ont.csv, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 5-untip/combined-edges-final.gfa, 5-untip/combined-nodemap-final.txt, 5-untip/nodelens-final.txt
    output: 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv
    log: 2-processGraph/unitig-unrolled-hifi-resolved.getCoverage.err
    jobid: 22
    reason: Missing output files: 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv; Input files updated by another job: 5-untip/combined-edges-final.gfa, 1-buildGraph/hifi_nodecov.csv, 2-processGraph/unitig-unrolled-hifi-resolved.gfa, 5-untip/combined-nodemap-final.txt, 4-processONT/nodecovs-ont.csv, 5-untip/nodelens-final.txt
    wildcards: dir=2-processGraph, id=unitig-unrolled-hifi-resolved
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=16, time_h=2

[Fri Apr  7 17:04:40 2023]
Finished job 16.
32 of 39 steps (82%) done
Select jobs to execute...

[Fri Apr  7 17:04:40 2023]
rule layoutContigs:
    input: 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-edges.gfa, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/nodelens.txt
    output: 6-layoutContigs/unitig-popped.layout, 6-layoutContigs/unitig-popped.layout.scfmap, 6-layoutContigs/gaps.txt
    log: 6-layoutContigs/createLayout.err
    jobid: 15
    reason: Missing output files: 6-layoutContigs/unitig-popped.layout, 6-layoutContigs/unitig-popped.layout.scfmap; Input files updated by another job: 6-layoutContigs/nodelens.txt, 6-layoutContigs/combined-nodemap.txt, 6-layoutContigs/combined-alignments.gaf, 6-layoutContigs/consensus_paths.txt, 6-layoutContigs/combined-edges.gfa
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=32, time_h=24

[Fri Apr  7 17:08:21 2023]
Finished job 20.
33 of 39 steps (85%) done
[Fri Apr  7 17:08:21 2023]
Finished job 22.
34 of 39 steps (87%) done
[Fri Apr  7 17:08:35 2023]
Finished job 23.
35 of 39 steps (90%) done
[Fri Apr  7 17:14:09 2023]
Finished job 15.
36 of 39 steps (92%) done
Select jobs to execute...

[Fri Apr  7 17:14:09 2023]
checkpoint buildPackages:
    input: /public/groups/meyerlab/gvtp/assemblies/verkko10k/../../filteredhifi/gvtp_hifi_adapterfilt_all.fastq.gz, 6-layoutContigs/unitig-popped.layout, 7-consensus/ont_subset.fasta.gz
    output: 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.finished, 7-consensus/packages.report
    log: 7-consensus/buildPackages.err
    jobid: 18
    reason: Missing output files: 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.finished; Input files updated by another job: 6-layoutContigs/unitig-popped.layout, 7-consensus/ont_subset.fasta.gz
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=26, time_h=24
DAG of jobs will be updated after completion.

[Fri Apr  7 17:56:23 2023]
Finished job 18.
37 of 39 steps (95%) done
Select jobs to execute...

[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part095.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part095.fasta
    log: 7-consensus/packages/part095.err
    jobid: 54
    reason: Missing output files: 7-consensus/packages/part095.fasta
    wildcards: nnnn=095
    threads: 8
    resources: tmpdir=/data/tmp, job_id=95, n_cpus=8, mem_gb=6, time_h=24


[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part094.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part094.fasta
    log: 7-consensus/packages/part094.err
    jobid: 59
    reason: Missing output files: 7-consensus/packages/part094.fasta
    wildcards: nnnn=094
    threads: 8
    resources: tmpdir=/data/tmp, job_id=94, n_cpus=8, mem_gb=6, time_h=24


[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part096.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part096.fasta
    log: 7-consensus/packages/part096.err
    jobid: 52
    reason: Missing output files: 7-consensus/packages/part096.fasta
    wildcards: nnnn=096
    threads: 8
    resources: tmpdir=/data/tmp, job_id=96, n_cpus=8, mem_gb=6, time_h=24


[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part097.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part097.fasta
    log: 7-consensus/packages/part097.err
    jobid: 53
    reason: Missing output files: 7-consensus/packages/part097.fasta
    wildcards: nnnn=097
    threads: 8
    resources: tmpdir=/data/tmp, job_id=97, n_cpus=8, mem_gb=6, time_h=24


[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part092.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part092.fasta
    log: 7-consensus/packages/part092.err
    jobid: 74
    reason: Missing output files: 7-consensus/packages/part092.fasta
    wildcards: nnnn=092
    threads: 8
    resources: tmpdir=/data/tmp, job_id=92, n_cpus=8, mem_gb=6, time_h=24


[Fri Apr  7 17:56:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part093.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part093.fasta
    log: 7-consensus/packages/part093.err
    jobid: 60
    reason: Missing output files: 7-consensus/packages/part093.fasta
    wildcards: nnnn=093
    threads: 8
    resources: tmpdir=/data/tmp, job_id=93, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 18:43:51 2023]
Finished job 74.
38 of 136 steps (28%) done
Select jobs to execute...

[Fri Apr  7 18:43:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part091.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part091.fasta
    log: 7-consensus/packages/part091.err
    jobid: 64
    reason: Missing output files: 7-consensus/packages/part091.fasta
    wildcards: nnnn=091
    threads: 8
    resources: tmpdir=/data/tmp, job_id=91, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 18:52:29 2023]
Finished job 60.
39 of 136 steps (29%) done
Select jobs to execute...

[Fri Apr  7 18:52:29 2023]
rule generateConsensus:
    input: 7-consensus/packages/part090.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part090.fasta
    log: 7-consensus/packages/part090.err
    jobid: 57
    reason: Missing output files: 7-consensus/packages/part090.fasta
    wildcards: nnnn=090
    threads: 8
    resources: tmpdir=/data/tmp, job_id=90, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:05:38 2023]
Finished job 59.
40 of 136 steps (29%) done
Select jobs to execute...

[Fri Apr  7 19:05:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part089.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part089.fasta
    log: 7-consensus/packages/part089.err
    jobid: 61
    reason: Missing output files: 7-consensus/packages/part089.fasta
    wildcards: nnnn=089
    threads: 8
    resources: tmpdir=/data/tmp, job_id=89, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:23:32 2023]
Finished job 64.
41 of 136 steps (30%) done
Select jobs to execute...

[Fri Apr  7 19:23:32 2023]
rule generateConsensus:
    input: 7-consensus/packages/part088.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part088.fasta
    log: 7-consensus/packages/part088.err
    jobid: 62
    reason: Missing output files: 7-consensus/packages/part088.fasta
    wildcards: nnnn=088
    threads: 8
    resources: tmpdir=/data/tmp, job_id=88, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:26:51 2023]
Finished job 54.
42 of 136 steps (31%) done
Select jobs to execute...

[Fri Apr  7 19:26:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part087.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part087.fasta
    log: 7-consensus/packages/part087.err
    jobid: 83
    reason: Missing output files: 7-consensus/packages/part087.fasta
    wildcards: nnnn=087
    threads: 8
    resources: tmpdir=/data/tmp, job_id=87, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:28:34 2023]
Finished job 57.
43 of 136 steps (32%) done
Select jobs to execute...

[Fri Apr  7 19:28:34 2023]
rule generateConsensus:
    input: 7-consensus/packages/part086.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part086.fasta
    log: 7-consensus/packages/part086.err
    jobid: 85
    reason: Missing output files: 7-consensus/packages/part086.fasta
    wildcards: nnnn=086
    threads: 8
    resources: tmpdir=/data/tmp, job_id=86, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:36:12 2023]
Finished job 61.
44 of 136 steps (32%) done
Select jobs to execute...

[Fri Apr  7 19:36:12 2023]
rule generateConsensus:
    input: 7-consensus/packages/part085.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part085.fasta
    log: 7-consensus/packages/part085.err
    jobid: 70
    reason: Missing output files: 7-consensus/packages/part085.fasta
    wildcards: nnnn=085
    threads: 8
    resources: tmpdir=/data/tmp, job_id=85, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:39:45 2023]
Finished job 52.
45 of 136 steps (33%) done
Select jobs to execute...

[Fri Apr  7 19:39:45 2023]
rule generateConsensus:
    input: 7-consensus/packages/part084.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part084.fasta
    log: 7-consensus/packages/part084.err
    jobid: 84
    reason: Missing output files: 7-consensus/packages/part084.fasta
    wildcards: nnnn=084
    threads: 8
    resources: tmpdir=/data/tmp, job_id=84, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:50:35 2023]
Finished job 62.
46 of 136 steps (34%) done
Select jobs to execute...

[Fri Apr  7 19:50:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part083.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part083.fasta
    log: 7-consensus/packages/part083.err
    jobid: 58
    reason: Missing output files: 7-consensus/packages/part083.fasta
    wildcards: nnnn=083
    threads: 8
    resources: tmpdir=/data/tmp, job_id=83, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:51:12 2023]
Finished job 85.
47 of 136 steps (35%) done
Select jobs to execute...

[Fri Apr  7 19:51:12 2023]
rule generateConsensus:
    input: 7-consensus/packages/part082.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part082.fasta
    log: 7-consensus/packages/part082.err
    jobid: 65
    reason: Missing output files: 7-consensus/packages/part082.fasta
    wildcards: nnnn=082
    threads: 8
    resources: tmpdir=/data/tmp, job_id=82, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:51:41 2023]
Finished job 83.
48 of 136 steps (35%) done
Select jobs to execute...

[Fri Apr  7 19:51:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part081.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part081.fasta
    log: 7-consensus/packages/part081.err
    jobid: 56
    reason: Missing output files: 7-consensus/packages/part081.fasta
    wildcards: nnnn=081
    threads: 8
    resources: tmpdir=/data/tmp, job_id=81, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:55:57 2023]
Finished job 70.
49 of 136 steps (36%) done
Select jobs to execute...

[Fri Apr  7 19:55:57 2023]
rule generateConsensus:
    input: 7-consensus/packages/part080.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part080.fasta
    log: 7-consensus/packages/part080.err
    jobid: 75
    reason: Missing output files: 7-consensus/packages/part080.fasta
    wildcards: nnnn=080
    threads: 8
    resources: tmpdir=/data/tmp, job_id=80, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:56:05 2023]
Finished job 53.
50 of 136 steps (37%) done
Select jobs to execute...

[Fri Apr  7 19:56:05 2023]
rule generateConsensus:
    input: 7-consensus/packages/part079.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part079.fasta
    log: 7-consensus/packages/part079.err
    jobid: 71
    reason: Missing output files: 7-consensus/packages/part079.fasta
    wildcards: nnnn=079
    threads: 8
    resources: tmpdir=/data/tmp, job_id=79, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 19:58:14 2023]
Finished job 84.
51 of 136 steps (38%) done
Select jobs to execute...

[Fri Apr  7 19:58:14 2023]
rule generateConsensus:
    input: 7-consensus/packages/part078.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part078.fasta
    log: 7-consensus/packages/part078.err
    jobid: 81
    reason: Missing output files: 7-consensus/packages/part078.fasta
    wildcards: nnnn=078
    threads: 8
    resources: tmpdir=/data/tmp, job_id=78, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:05:52 2023]
Finished job 56.
52 of 136 steps (38%) done
Select jobs to execute...

[Fri Apr  7 20:05:52 2023]
rule generateConsensus:
    input: 7-consensus/packages/part077.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part077.fasta
    log: 7-consensus/packages/part077.err
    jobid: 78
    reason: Missing output files: 7-consensus/packages/part077.fasta
    wildcards: nnnn=077
    threads: 8
    resources: tmpdir=/data/tmp, job_id=77, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:06:42 2023]
Finished job 65.
53 of 136 steps (39%) done
Select jobs to execute...

[Fri Apr  7 20:06:42 2023]
rule generateConsensus:
    input: 7-consensus/packages/part076.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part076.fasta
    log: 7-consensus/packages/part076.err
    jobid: 67
    reason: Missing output files: 7-consensus/packages/part076.fasta
    wildcards: nnnn=076
    threads: 8
    resources: tmpdir=/data/tmp, job_id=76, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:07:32 2023]
Finished job 58.
54 of 136 steps (40%) done
Select jobs to execute...

[Fri Apr  7 20:07:32 2023]
rule generateConsensus:
    input: 7-consensus/packages/part075.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part075.fasta
    log: 7-consensus/packages/part075.err
    jobid: 63
    reason: Missing output files: 7-consensus/packages/part075.fasta
    wildcards: nnnn=075
    threads: 8
    resources: tmpdir=/data/tmp, job_id=75, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:08:29 2023]
Finished job 71.
55 of 136 steps (40%) done
Select jobs to execute...

[Fri Apr  7 20:08:29 2023]
rule generateConsensus:
    input: 7-consensus/packages/part074.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part074.fasta
    log: 7-consensus/packages/part074.err
    jobid: 80
    reason: Missing output files: 7-consensus/packages/part074.fasta
    wildcards: nnnn=074
    threads: 8
    resources: tmpdir=/data/tmp, job_id=74, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:09:08 2023]
Finished job 75.
56 of 136 steps (41%) done
Select jobs to execute...

[Fri Apr  7 20:09:08 2023]
rule generateConsensus:
    input: 7-consensus/packages/part073.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part073.fasta
    log: 7-consensus/packages/part073.err
    jobid: 66
    reason: Missing output files: 7-consensus/packages/part073.fasta
    wildcards: nnnn=073
    threads: 8
    resources: tmpdir=/data/tmp, job_id=73, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:10:00 2023]
Finished job 81.
57 of 136 steps (42%) done
Select jobs to execute...

[Fri Apr  7 20:10:00 2023]
rule generateConsensus:
    input: 7-consensus/packages/part072.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part072.fasta
    log: 7-consensus/packages/part072.err
    jobid: 94
    reason: Missing output files: 7-consensus/packages/part072.fasta
    wildcards: nnnn=072
    threads: 8
    resources: tmpdir=/data/tmp, job_id=72, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:16:39 2023]
Finished job 78.
58 of 136 steps (43%) done
Select jobs to execute...

[Fri Apr  7 20:16:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part071.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part071.fasta
    log: 7-consensus/packages/part071.err
    jobid: 100
    reason: Missing output files: 7-consensus/packages/part071.fasta
    wildcards: nnnn=071
    threads: 8
    resources: tmpdir=/data/tmp, job_id=71, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:16:44 2023]
Finished job 67.
59 of 136 steps (43%) done
Select jobs to execute...

[Fri Apr  7 20:16:44 2023]
rule generateConsensus:
    input: 7-consensus/packages/part070.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part070.fasta
    log: 7-consensus/packages/part070.err
    jobid: 82
    reason: Missing output files: 7-consensus/packages/part070.fasta
    wildcards: nnnn=070
    threads: 8
    resources: tmpdir=/data/tmp, job_id=70, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:17:25 2023]
Finished job 63.
60 of 136 steps (44%) done
Select jobs to execute...

[Fri Apr  7 20:17:25 2023]
rule generateConsensus:
    input: 7-consensus/packages/part067.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part067.fasta
    log: 7-consensus/packages/part067.err
    jobid: 72
    reason: Missing output files: 7-consensus/packages/part067.fasta
    wildcards: nnnn=067
    threads: 8
    resources: tmpdir=/data/tmp, job_id=67, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:17:35 2023]
Finished job 80.
61 of 136 steps (45%) done
Select jobs to execute...

[Fri Apr  7 20:17:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part069.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part069.fasta
    log: 7-consensus/packages/part069.err
    jobid: 98
    reason: Missing output files: 7-consensus/packages/part069.fasta
    wildcards: nnnn=069
    threads: 8
    resources: tmpdir=/data/tmp, job_id=69, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:17:39 2023]
Finished job 94.
62 of 136 steps (46%) done
Select jobs to execute...

[Fri Apr  7 20:17:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part068.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part068.fasta
    log: 7-consensus/packages/part068.err
    jobid: 55
    reason: Missing output files: 7-consensus/packages/part068.fasta
    wildcards: nnnn=068
    threads: 8
    resources: tmpdir=/data/tmp, job_id=68, n_cpus=8, mem_gb=6, time_h=24

[Fri Apr  7 20:18:06 2023]
Finished job 66.
63 of 136 steps (46%) done
Select jobs to execute...

[Fri Apr  7 20:18:06 2023]
rule generateConsensus:
    input: 7-consensus/packages/part066.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part066.fasta
    log: 7-consensus/packages/part066.err
    jobid: 91
    reason: Missing output files: 7-consensus/packages/part066.fasta
    wildcards: nnnn=066
    threads: 8
    resources: tmpdir=/data/tmp, job_id=66, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:23:54 2023]
Finished job 72.
64 of 136 steps (47%) done
Select jobs to execute...

[Fri Apr  7 20:23:54 2023]
rule generateConsensus:
    input: 7-consensus/packages/part065.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part065.fasta
    log: 7-consensus/packages/part065.err
    jobid: 110
    reason: Missing output files: 7-consensus/packages/part065.fasta
    wildcards: nnnn=065
    threads: 8
    resources: tmpdir=/data/tmp, job_id=65, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:24:11 2023]
Finished job 100.
65 of 136 steps (48%) done
Select jobs to execute...

[Fri Apr  7 20:24:11 2023]
rule generateConsensus:
    input: 7-consensus/packages/part064.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part064.fasta
    log: 7-consensus/packages/part064.err
    jobid: 95
    reason: Missing output files: 7-consensus/packages/part064.fasta
    wildcards: nnnn=064
    threads: 8
    resources: tmpdir=/data/tmp, job_id=64, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:24:15 2023]
Finished job 82.
66 of 136 steps (49%) done
Select jobs to execute...

[Fri Apr  7 20:24:15 2023]
rule generateConsensus:
    input: 7-consensus/packages/part063.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part063.fasta
    log: 7-consensus/packages/part063.err
    jobid: 90
    reason: Missing output files: 7-consensus/packages/part063.fasta
    wildcards: nnnn=063
    threads: 8
    resources: tmpdir=/data/tmp, job_id=63, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:24:28 2023]
Finished job 55.
67 of 136 steps (49%) done
Select jobs to execute...

[Fri Apr  7 20:24:28 2023]
rule generateConsensus:
    input: 7-consensus/packages/part062.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part062.fasta
    log: 7-consensus/packages/part062.err
    jobid: 73
    reason: Missing output files: 7-consensus/packages/part062.fasta
    wildcards: nnnn=062
    threads: 8
    resources: tmpdir=/data/tmp, job_id=62, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:24:28 2023]
Finished job 91.
68 of 136 steps (50%) done
Select jobs to execute...

[Fri Apr  7 20:24:28 2023]
rule generateConsensus:
    input: 7-consensus/packages/part061.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part061.fasta
    log: 7-consensus/packages/part061.err
    jobid: 76
    reason: Missing output files: 7-consensus/packages/part061.fasta
    wildcards: nnnn=061
    threads: 8
    resources: tmpdir=/data/tmp, job_id=61, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:24:51 2023]
Finished job 98.
69 of 136 steps (51%) done
Select jobs to execute...

[Fri Apr  7 20:24:51 2023]
rule generateConsensus:
    input: 7-consensus/packages/part060.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part060.fasta
    log: 7-consensus/packages/part060.err
    jobid: 104
    reason: Missing output files: 7-consensus/packages/part060.fasta
    wildcards: nnnn=060
    threads: 8
    resources: tmpdir=/data/tmp, job_id=60, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:29:35 2023]
Finished job 90.
70 of 136 steps (51%) done
Select jobs to execute...

[Fri Apr  7 20:29:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part059.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part059.fasta
    log: 7-consensus/packages/part059.err
    jobid: 77
    reason: Missing output files: 7-consensus/packages/part059.fasta
    wildcards: nnnn=059
    threads: 8
    resources: tmpdir=/data/tmp, job_id=59, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:29:35 2023]
Finished job 110.
71 of 136 steps (52%) done
Select jobs to execute...

[Fri Apr  7 20:29:35 2023]
rule generateConsensus:
    input: 7-consensus/packages/part058.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part058.fasta
    log: 7-consensus/packages/part058.err
    jobid: 89
    reason: Missing output files: 7-consensus/packages/part058.fasta
    wildcards: nnnn=058
    threads: 8
    resources: tmpdir=/data/tmp, job_id=58, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:29:46 2023]
Finished job 73.
72 of 136 steps (53%) done
Select jobs to execute...

[Fri Apr  7 20:29:46 2023]
rule generateConsensus:
    input: 7-consensus/packages/part057.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part057.fasta
    log: 7-consensus/packages/part057.err
    jobid: 79
    reason: Missing output files: 7-consensus/packages/part057.fasta
    wildcards: nnnn=057
    threads: 8
    resources: tmpdir=/data/tmp, job_id=57, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:29:47 2023]
Finished job 104.
73 of 136 steps (54%) done
Select jobs to execute...

[Fri Apr  7 20:29:47 2023]
rule generateConsensus:
    input: 7-consensus/packages/part056.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part056.fasta
    log: 7-consensus/packages/part056.err
    jobid: 124
    reason: Missing output files: 7-consensus/packages/part056.fasta
    wildcards: nnnn=056
    threads: 8
    resources: tmpdir=/data/tmp, job_id=56, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:29:56 2023]
Finished job 76.
74 of 136 steps (54%) done
Select jobs to execute...

[Fri Apr  7 20:29:56 2023]
rule generateConsensus:
    input: 7-consensus/packages/part055.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part055.fasta
    log: 7-consensus/packages/part055.err
    jobid: 134
    reason: Missing output files: 7-consensus/packages/part055.fasta
    wildcards: nnnn=055
    threads: 8
    resources: tmpdir=/data/tmp, job_id=55, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:30:01 2023]
Finished job 95.
75 of 136 steps (55%) done
Select jobs to execute...

[Fri Apr  7 20:30:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part054.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part054.fasta
    log: 7-consensus/packages/part054.err
    jobid: 69
    reason: Missing output files: 7-consensus/packages/part054.fasta
    wildcards: nnnn=054
    threads: 8
    resources: tmpdir=/data/tmp, job_id=54, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:33:58 2023]
Finished job 124.
76 of 136 steps (56%) done
Select jobs to execute...

[Fri Apr  7 20:33:58 2023]
rule generateConsensus:
    input: 7-consensus/packages/part053.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part053.fasta
    log: 7-consensus/packages/part053.err
    jobid: 88
    reason: Missing output files: 7-consensus/packages/part053.fasta
    wildcards: nnnn=053
    threads: 8
    resources: tmpdir=/data/tmp, job_id=53, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:34:06 2023]
Finished job 134.
77 of 136 steps (57%) done
Select jobs to execute...

[Fri Apr  7 20:34:06 2023]
rule generateConsensus:
    input: 7-consensus/packages/part052.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part052.fasta
    log: 7-consensus/packages/part052.err
    jobid: 86
    reason: Missing output files: 7-consensus/packages/part052.fasta
    wildcards: nnnn=052
    threads: 8
    resources: tmpdir=/data/tmp, job_id=52, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:34:08 2023]
Finished job 69.
78 of 136 steps (57%) done
Select jobs to execute...

[Fri Apr  7 20:34:08 2023]
rule generateConsensus:
    input: 7-consensus/packages/part051.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part051.fasta
    log: 7-consensus/packages/part051.err
    jobid: 121
    reason: Missing output files: 7-consensus/packages/part051.fasta
    wildcards: nnnn=051
    threads: 8
    resources: tmpdir=/data/tmp, job_id=51, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:34:10 2023]
Finished job 77.
79 of 136 steps (58%) done
Select jobs to execute...

[Fri Apr  7 20:34:10 2023]
rule generateConsensus:
    input: 7-consensus/packages/part050.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part050.fasta
    log: 7-consensus/packages/part050.err
    jobid: 112
    reason: Missing output files: 7-consensus/packages/part050.fasta
    wildcards: nnnn=050
    threads: 8
    resources: tmpdir=/data/tmp, job_id=50, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:34:11 2023]
Finished job 79.
80 of 136 steps (59%) done
Select jobs to execute...

[Fri Apr  7 20:34:11 2023]
rule generateConsensus:
    input: 7-consensus/packages/part049.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part049.fasta
    log: 7-consensus/packages/part049.err
    jobid: 107
    reason: Missing output files: 7-consensus/packages/part049.fasta
    wildcards: nnnn=049
    threads: 8
    resources: tmpdir=/data/tmp, job_id=49, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:34:16 2023]
Finished job 89.
81 of 136 steps (60%) done
Select jobs to execute...

[Fri Apr  7 20:34:16 2023]
rule generateConsensus:
    input: 7-consensus/packages/part048.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part048.fasta
    log: 7-consensus/packages/part048.err
    jobid: 92
    reason: Missing output files: 7-consensus/packages/part048.fasta
    wildcards: nnnn=048
    threads: 8
    resources: tmpdir=/data/tmp, job_id=48, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:37:38 2023]
Finished job 112.
82 of 136 steps (60%) done
Select jobs to execute...

[Fri Apr  7 20:37:38 2023]
rule generateConsensus:
    input: 7-consensus/packages/part047.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part047.fasta
    log: 7-consensus/packages/part047.err
    jobid: 105
    reason: Missing output files: 7-consensus/packages/part047.fasta
    wildcards: nnnn=047
    threads: 8
    resources: tmpdir=/data/tmp, job_id=47, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:37:41 2023]
Finished job 92.
83 of 136 steps (61%) done
Select jobs to execute...

[Fri Apr  7 20:37:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part046.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part046.fasta
    log: 7-consensus/packages/part046.err
    jobid: 113
    reason: Missing output files: 7-consensus/packages/part046.fasta
    wildcards: nnnn=046
    threads: 8
    resources: tmpdir=/data/tmp, job_id=46, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:37:43 2023]
Finished job 121.
84 of 136 steps (62%) done
Select jobs to execute...

[Fri Apr  7 20:37:43 2023]
rule generateConsensus:
    input: 7-consensus/packages/part045.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part045.fasta
    log: 7-consensus/packages/part045.err
    jobid: 114
    reason: Missing output files: 7-consensus/packages/part045.fasta
    wildcards: nnnn=045
    threads: 8
    resources: tmpdir=/data/tmp, job_id=45, n_cpus=8, mem_gb=7, time_h=24

[Fri Apr  7 20:37:48 2023]
Finished job 86.
85 of 136 steps (62%) done
Select jobs to execute...

[Fri Apr  7 20:37:48 2023]
rule generateConsensus:
    input: 7-consensus/packages/part044.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part044.fasta
    log: 7-consensus/packages/part044.err
    jobid: 115
    reason: Missing output files: 7-consensus/packages/part044.fasta
    wildcards: nnnn=044
    threads: 8
    resources: tmpdir=/data/tmp, job_id=44, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:37:49 2023]
Finished job 107.
86 of 136 steps (63%) done
Select jobs to execute...

[Fri Apr  7 20:37:49 2023]
rule generateConsensus:
    input: 7-consensus/packages/part042.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part042.fasta
    log: 7-consensus/packages/part042.err
    jobid: 126
    reason: Missing output files: 7-consensus/packages/part042.fasta
    wildcards: nnnn=042
    threads: 8
    resources: tmpdir=/data/tmp, job_id=42, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:38:03 2023]
Finished job 88.
87 of 136 steps (64%) done
Select jobs to execute...

[Fri Apr  7 20:38:03 2023]
rule generateConsensus:
    input: 7-consensus/packages/part043.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part043.fasta
    log: 7-consensus/packages/part043.err
    jobid: 123
    reason: Missing output files: 7-consensus/packages/part043.fasta
    wildcards: nnnn=043
    threads: 8
    resources: tmpdir=/data/tmp, job_id=43, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:40:29 2023]
Finished job 114.
88 of 136 steps (65%) done
Select jobs to execute...

[Fri Apr  7 20:40:29 2023]
rule generateConsensus:
    input: 7-consensus/packages/part040.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part040.fasta
    log: 7-consensus/packages/part040.err
    jobid: 119
    reason: Missing output files: 7-consensus/packages/part040.fasta
    wildcards: nnnn=040
    threads: 8
    resources: tmpdir=/data/tmp, job_id=40, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:40:33 2023]
Finished job 126.
89 of 136 steps (65%) done
Select jobs to execute...

[Fri Apr  7 20:40:33 2023]
rule generateConsensus:
    input: 7-consensus/packages/part041.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part041.fasta
    log: 7-consensus/packages/part041.err
    jobid: 109
    reason: Missing output files: 7-consensus/packages/part041.fasta
    wildcards: nnnn=041
    threads: 8
    resources: tmpdir=/data/tmp, job_id=41, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:40:46 2023]
Finished job 115.
90 of 136 steps (66%) done
Select jobs to execute...

[Fri Apr  7 20:40:46 2023]
rule generateConsensus:
    input: 7-consensus/packages/part039.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part039.fasta
    log: 7-consensus/packages/part039.err
    jobid: 103
    reason: Missing output files: 7-consensus/packages/part039.fasta
    wildcards: nnnn=039
    threads: 8
    resources: tmpdir=/data/tmp, job_id=39, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:40:50 2023]
Finished job 113.
91 of 136 steps (67%) done
Select jobs to execute...

[Fri Apr  7 20:40:50 2023]
rule generateConsensus:
    input: 7-consensus/packages/part038.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part038.fasta
    log: 7-consensus/packages/part038.err
    jobid: 97
    reason: Missing output files: 7-consensus/packages/part038.fasta
    wildcards: nnnn=038
    threads: 8
    resources: tmpdir=/data/tmp, job_id=38, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:40:54 2023]
Finished job 123.
92 of 136 steps (68%) done
Select jobs to execute...

[Fri Apr  7 20:40:54 2023]
rule generateConsensus:
    input: 7-consensus/packages/part037.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part037.fasta
    log: 7-consensus/packages/part037.err
    jobid: 128
    reason: Missing output files: 7-consensus/packages/part037.fasta
    wildcards: nnnn=037
    threads: 8
    resources: tmpdir=/data/tmp, job_id=37, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:41:01 2023]
Finished job 105.
93 of 136 steps (68%) done
Select jobs to execute...

[Fri Apr  7 20:41:01 2023]
rule generateConsensus:
    input: 7-consensus/packages/part036.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part036.fasta
    log: 7-consensus/packages/part036.err
    jobid: 87
    reason: Missing output files: 7-consensus/packages/part036.fasta
    wildcards: nnnn=036
    threads: 8
    resources: tmpdir=/data/tmp, job_id=36, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:16 2023]
Finished job 119.
94 of 136 steps (69%) done
Select jobs to execute...

[Fri Apr  7 20:43:16 2023]
rule generateConsensus:
    input: 7-consensus/packages/part034.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part034.fasta
    log: 7-consensus/packages/part034.err
    jobid: 106
    reason: Missing output files: 7-consensus/packages/part034.fasta
    wildcards: nnnn=034
    threads: 8
    resources: tmpdir=/data/tmp, job_id=34, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:16 2023]
Finished job 97.
95 of 136 steps (70%) done
Select jobs to execute...

[Fri Apr  7 20:43:16 2023]
rule generateConsensus:
    input: 7-consensus/packages/part033.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part033.fasta
    log: 7-consensus/packages/part033.err
    jobid: 141
    reason: Missing output files: 7-consensus/packages/part033.fasta
    wildcards: nnnn=033
    threads: 8
    resources: tmpdir=/data/tmp, job_id=33, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:22 2023]
Finished job 128.
96 of 136 steps (71%) done
Select jobs to execute...

[Fri Apr  7 20:43:22 2023]
rule generateConsensus:
    input: 7-consensus/packages/part035.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part035.fasta
    log: 7-consensus/packages/part035.err
    jobid: 99
    reason: Missing output files: 7-consensus/packages/part035.fasta
    wildcards: nnnn=035
    threads: 8
    resources: tmpdir=/data/tmp, job_id=35, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:26 2023]
Finished job 103.
97 of 136 steps (71%) done
Select jobs to execute...

[Fri Apr  7 20:43:26 2023]
rule generateConsensus:
    input: 7-consensus/packages/part030.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part030.fasta
    log: 7-consensus/packages/part030.err
    jobid: 120
    reason: Missing output files: 7-consensus/packages/part030.fasta
    wildcards: nnnn=030
    threads: 8
    resources: tmpdir=/data/tmp, job_id=30, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:27 2023]
Finished job 87.
98 of 136 steps (72%) done
Select jobs to execute...

[Fri Apr  7 20:43:27 2023]
rule generateConsensus:
    input: 7-consensus/packages/part032.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part032.fasta
    log: 7-consensus/packages/part032.err
    jobid: 133
    reason: Missing output files: 7-consensus/packages/part032.fasta
    wildcards: nnnn=032
    threads: 8
    resources: tmpdir=/data/tmp, job_id=32, n_cpus=8, mem_gb=8, time_h=24

[Fri Apr  7 20:43:29 2023]
Finished job 109.
99 of 136 steps (73%) done
Select jobs to execute...

[Fri Apr  7 20:43:29 2023]
rule generateConsensus:
    input: 7-consensus/packages/part031.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part031.fasta
    log: 7-consensus/packages/part031.err
    jobid: 127
    reason: Missing output files: 7-consensus/packages/part031.fasta
    wildcards: nnnn=031
    threads: 8
    resources: tmpdir=/data/tmp, job_id=31, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:26 2023]
Finished job 141.
100 of 136 steps (74%) done
Select jobs to execute...

[Fri Apr  7 20:45:26 2023]
rule generateConsensus:
    input: 7-consensus/packages/part029.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part029.fasta
    log: 7-consensus/packages/part029.err
    jobid: 101
    reason: Missing output files: 7-consensus/packages/part029.fasta
    wildcards: nnnn=029
    threads: 8
    resources: tmpdir=/data/tmp, job_id=29, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:28 2023]
Finished job 120.
101 of 136 steps (74%) done
Select jobs to execute...

[Fri Apr  7 20:45:28 2023]
rule generateConsensus:
    input: 7-consensus/packages/part028.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part028.fasta
    log: 7-consensus/packages/part028.err
    jobid: 96
    reason: Missing output files: 7-consensus/packages/part028.fasta
    wildcards: nnnn=028
    threads: 8
    resources: tmpdir=/data/tmp, job_id=28, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:34 2023]
Finished job 99.
102 of 136 steps (75%) done
Select jobs to execute...

[Fri Apr  7 20:45:34 2023]
rule generateConsensus:
    input: 7-consensus/packages/part027.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part027.fasta
    log: 7-consensus/packages/part027.err
    jobid: 138
    reason: Missing output files: 7-consensus/packages/part027.fasta
    wildcards: nnnn=027
    threads: 8
    resources: tmpdir=/data/tmp, job_id=27, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:36 2023]
Finished job 106.
103 of 136 steps (76%) done
Select jobs to execute...

[Fri Apr  7 20:45:36 2023]
rule generateConsensus:
    input: 7-consensus/packages/part025.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part025.fasta
    log: 7-consensus/packages/part025.err
    jobid: 102
    reason: Missing output files: 7-consensus/packages/part025.fasta
    wildcards: nnnn=025
    threads: 8
    resources: tmpdir=/data/tmp, job_id=25, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:41 2023]
Finished job 133.
104 of 136 steps (76%) done
Select jobs to execute...

[Fri Apr  7 20:45:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part026.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part026.fasta
    log: 7-consensus/packages/part026.err
    jobid: 140
    reason: Missing output files: 7-consensus/packages/part026.fasta
    wildcards: nnnn=026
    threads: 8
    resources: tmpdir=/data/tmp, job_id=26, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:45:54 2023]
Finished job 127.
105 of 136 steps (77%) done
Select jobs to execute...

[Fri Apr  7 20:45:54 2023]
rule generateConsensus:
    input: 7-consensus/packages/part024.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part024.fasta
    log: 7-consensus/packages/part024.err
    jobid: 132
    reason: Missing output files: 7-consensus/packages/part024.fasta
    wildcards: nnnn=024
    threads: 8
    resources: tmpdir=/data/tmp, job_id=24, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:30 2023]
Finished job 101.
106 of 136 steps (78%) done
Select jobs to execute...

[Fri Apr  7 20:47:30 2023]
rule generateConsensus:
    input: 7-consensus/packages/part023.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part023.fasta
    log: 7-consensus/packages/part023.err
    jobid: 68
    reason: Missing output files: 7-consensus/packages/part023.fasta
    wildcards: nnnn=023
    threads: 8
    resources: tmpdir=/data/tmp, job_id=23, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:32 2023]
Finished job 96.
107 of 136 steps (79%) done
Select jobs to execute...

[Fri Apr  7 20:47:32 2023]
rule generateConsensus:
    input: 7-consensus/packages/part020.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part020.fasta
    log: 7-consensus/packages/part020.err
    jobid: 108
    reason: Missing output files: 7-consensus/packages/part020.fasta
    wildcards: nnnn=020
    threads: 8
    resources: tmpdir=/data/tmp, job_id=20, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:37 2023]
Finished job 102.
108 of 136 steps (79%) done
Select jobs to execute...

[Fri Apr  7 20:47:37 2023]
rule generateConsensus:
    input: 7-consensus/packages/part022.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part022.fasta
    log: 7-consensus/packages/part022.err
    jobid: 122
    reason: Missing output files: 7-consensus/packages/part022.fasta
    wildcards: nnnn=022
    threads: 8
    resources: tmpdir=/data/tmp, job_id=22, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:37 2023]
Finished job 140.
109 of 136 steps (80%) done
Select jobs to execute...

[Fri Apr  7 20:47:37 2023]
rule generateConsensus:
    input: 7-consensus/packages/part021.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part021.fasta
    log: 7-consensus/packages/part021.err
    jobid: 143
    reason: Missing output files: 7-consensus/packages/part021.fasta
    wildcards: nnnn=021
    threads: 8
    resources: tmpdir=/data/tmp, job_id=21, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:49 2023]
Finished job 138.
110 of 136 steps (81%) done
Select jobs to execute...

[Fri Apr  7 20:47:49 2023]
rule generateConsensus:
    input: 7-consensus/packages/part017.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part017.fasta
    log: 7-consensus/packages/part017.err
    jobid: 130
    reason: Missing output files: 7-consensus/packages/part017.fasta
    wildcards: nnnn=017
    threads: 8
    resources: tmpdir=/data/tmp, job_id=17, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:47:57 2023]
Finished job 132.
111 of 136 steps (82%) done
Select jobs to execute...

[Fri Apr  7 20:47:57 2023]
rule generateConsensus:
    input: 7-consensus/packages/part012.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part012.fasta
    log: 7-consensus/packages/part012.err
    jobid: 129
    reason: Missing output files: 7-consensus/packages/part012.fasta
    wildcards: nnnn=012
    threads: 8
    resources: tmpdir=/data/tmp, job_id=12, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:49:31 2023]
Finished job 122.
112 of 136 steps (82%) done
Select jobs to execute...

[Fri Apr  7 20:49:31 2023]
rule generateConsensus:
    input: 7-consensus/packages/part014.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part014.fasta
    log: 7-consensus/packages/part014.err
    jobid: 93
    reason: Missing output files: 7-consensus/packages/part014.fasta
    wildcards: nnnn=014
    threads: 8
    resources: tmpdir=/data/tmp, job_id=14, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:49:33 2023]
Finished job 129.
113 of 136 steps (83%) done
Select jobs to execute...

[Fri Apr  7 20:49:33 2023]
rule generateConsensus:
    input: 7-consensus/packages/part019.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part019.fasta
    log: 7-consensus/packages/part019.err
    jobid: 111
    reason: Missing output files: 7-consensus/packages/part019.fasta
    wildcards: nnnn=019
    threads: 8
    resources: tmpdir=/data/tmp, job_id=19, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:49:37 2023]
Finished job 130.
114 of 136 steps (84%) done
Select jobs to execute...

[Fri Apr  7 20:49:37 2023]
rule generateConsensus:
    input: 7-consensus/packages/part018.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part018.fasta
    log: 7-consensus/packages/part018.err
    jobid: 136
    reason: Missing output files: 7-consensus/packages/part018.fasta
    wildcards: nnnn=018
    threads: 8
    resources: tmpdir=/data/tmp, job_id=18, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:49:39 2023]
Finished job 143.
115 of 136 steps (85%) done
Select jobs to execute...

[Fri Apr  7 20:49:39 2023]
rule generateConsensus:
    input: 7-consensus/packages/part010.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part010.fasta
    log: 7-consensus/packages/part010.err
    jobid: 118
    reason: Missing output files: 7-consensus/packages/part010.fasta
    wildcards: nnnn=010
    threads: 8
    resources: tmpdir=/data/tmp, job_id=10, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:49:40 2023]
Finished job 68.
116 of 136 steps (85%) done
Select jobs to execute...

[Fri Apr  7 20:49:40 2023]
rule generateConsensus:
    input: 7-consensus/packages/part015.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part015.fasta
    log: 7-consensus/packages/part015.err
    jobid: 148
    reason: Missing output files: 7-consensus/packages/part015.fasta
    wildcards: nnnn=015
    threads: 8
    resources: tmpdir=/data/tmp, job_id=15, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:49:41 2023]
Finished job 108.
117 of 136 steps (86%) done
Select jobs to execute...

[Fri Apr  7 20:49:41 2023]
rule generateConsensus:
    input: 7-consensus/packages/part016.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part016.fasta
    log: 7-consensus/packages/part016.err
    jobid: 146
    reason: Missing output files: 7-consensus/packages/part016.fasta
    wildcards: nnnn=016
    threads: 8
    resources: tmpdir=/data/tmp, job_id=16, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:51:17 2023]
Finished job 111.
118 of 136 steps (87%) done
Select jobs to execute...

[Fri Apr  7 20:51:17 2023]
rule generateConsensus:
    input: 7-consensus/packages/part013.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part013.fasta
    log: 7-consensus/packages/part013.err
    jobid: 137
    reason: Missing output files: 7-consensus/packages/part013.fasta
    wildcards: nnnn=013
    threads: 8
    resources: tmpdir=/data/tmp, job_id=13, n_cpus=8, mem_gb=9, time_h=24

[Fri Apr  7 20:51:19 2023]
Finished job 136.
119 of 136 steps (88%) done
Select jobs to execute...

[Fri Apr  7 20:51:19 2023]
rule generateConsensus:
    input: 7-consensus/packages/part007.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part007.fasta
    log: 7-consensus/packages/part007.err
    jobid: 125
    reason: Missing output files: 7-consensus/packages/part007.fasta
    wildcards: nnnn=007
    threads: 8
    resources: tmpdir=/data/tmp, job_id=7, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:51:19 2023]
Finished job 148.
120 of 136 steps (88%) done
Select jobs to execute...

[Fri Apr  7 20:51:19 2023]
rule generateConsensus:
    input: 7-consensus/packages/part011.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part011.fasta
    log: 7-consensus/packages/part011.err
    jobid: 142
    reason: Missing output files: 7-consensus/packages/part011.fasta
    wildcards: nnnn=011
    threads: 8
    resources: tmpdir=/data/tmp, job_id=11, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:51:19 2023]
Finished job 118.
121 of 136 steps (89%) done
Select jobs to execute...

[Fri Apr  7 20:51:19 2023]
rule generateConsensus:
    input: 7-consensus/packages/part009.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part009.fasta
    log: 7-consensus/packages/part009.err
    jobid: 144
    reason: Missing output files: 7-consensus/packages/part009.fasta
    wildcards: nnnn=009
    threads: 8
    resources: tmpdir=/data/tmp, job_id=9, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:51:21 2023]
Finished job 146.
122 of 136 steps (90%) done
Select jobs to execute...

[Fri Apr  7 20:51:21 2023]
rule generateConsensus:
    input: 7-consensus/packages/part006.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part006.fasta
    log: 7-consensus/packages/part006.err
    jobid: 116
    reason: Missing output files: 7-consensus/packages/part006.fasta
    wildcards: nnnn=006
    threads: 8
    resources: tmpdir=/data/tmp, job_id=6, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:51:32 2023]
Finished job 93.
123 of 136 steps (90%) done
Select jobs to execute...

[Fri Apr  7 20:51:33 2023]
rule generateConsensus:
    input: 7-consensus/packages/part008.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part008.fasta
    log: 7-consensus/packages/part008.err
    jobid: 117
    reason: Missing output files: 7-consensus/packages/part008.fasta
    wildcards: nnnn=008
    threads: 8
    resources: tmpdir=/data/tmp, job_id=8, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:52:56 2023]
Finished job 144.
124 of 136 steps (91%) done
Select jobs to execute...

[Fri Apr  7 20:52:56 2023]
rule generateConsensus:
    input: 7-consensus/packages/part005.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part005.fasta
    log: 7-consensus/packages/part005.err
    jobid: 139
    reason: Missing output files: 7-consensus/packages/part005.fasta
    wildcards: nnnn=005
    threads: 8
    resources: tmpdir=/data/tmp, job_id=5, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:52:59 2023]
Finished job 116.
125 of 136 steps (92%) done
Select jobs to execute...

[Fri Apr  7 20:52:59 2023]
rule generateConsensus:
    input: 7-consensus/packages/part004.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part004.fasta
    log: 7-consensus/packages/part004.err
    jobid: 131
    reason: Missing output files: 7-consensus/packages/part004.fasta
    wildcards: nnnn=004
    threads: 8
    resources: tmpdir=/data/tmp, job_id=4, n_cpus=8, mem_gb=10, time_h=24

[Fri Apr  7 20:53:06 2023]
Finished job 125.
126 of 136 steps (93%) done
Select jobs to execute...

[Fri Apr  7 20:53:06 2023]
rule generateConsensus:
    input: 7-consensus/packages/part003.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part003.fasta
    log: 7-consensus/packages/part003.err
    jobid: 135
    reason: Missing output files: 7-consensus/packages/part003.fasta
    wildcards: nnnn=003
    threads: 8
    resources: tmpdir=/data/tmp, job_id=3, n_cpus=8, mem_gb=11, time_h=24

[Fri Apr  7 20:53:07 2023]
Finished job 117.
127 of 136 steps (93%) done
Select jobs to execute...

[Fri Apr  7 20:53:07 2023]
rule generateConsensus:
    input: 7-consensus/packages/part001.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part001.fasta
    log: 7-consensus/packages/part001.err
    jobid: 145
    reason: Missing output files: 7-consensus/packages/part001.fasta
    wildcards: nnnn=001
    threads: 8
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=8, mem_gb=11, time_h=24

[Fri Apr  7 20:53:09 2023]
Finished job 142.
128 of 136 steps (94%) done
Select jobs to execute...

[Fri Apr  7 20:53:09 2023]
rule generateConsensus:
    input: 7-consensus/packages/part002.cnspack, 7-consensus/packages.tigName_to_ID.map, 7-consensus/packages.report
    output: 7-consensus/packages/part002.fasta
    log: 7-consensus/packages/part002.err
    jobid: 147
    reason: Missing output files: 7-consensus/packages/part002.fasta
    wildcards: nnnn=002
    threads: 8
    resources: tmpdir=/data/tmp, job_id=2, n_cpus=8, mem_gb=11, time_h=24

[Fri Apr  7 20:53:15 2023]
Finished job 137.
129 of 136 steps (95%) done
[Fri Apr  7 20:54:25 2023]
Finished job 145.
130 of 136 steps (96%) done
[Fri Apr  7 20:54:26 2023]
Finished job 147.
131 of 136 steps (96%) done
[Fri Apr  7 20:54:27 2023]
Finished job 131.
132 of 136 steps (97%) done
[Fri Apr  7 20:54:33 2023]
Finished job 139.
133 of 136 steps (98%) done
[Fri Apr  7 20:54:42 2023]
Finished job 135.
134 of 136 steps (99%) done
Select jobs to execute...

[Fri Apr  7 20:54:42 2023]
rule combineConsensus:
    input: 7-consensus/packages/part096.fasta, 7-consensus/packages/part097.fasta, 7-consensus/packages/part095.fasta, 7-consensus/packages/part068.fasta, 7-consensus/packages/part081.fasta, 7-consensus/packages/part090.fasta, 7-consensus/packages/part083.fasta, 7-consensus/packages/part094.fasta, 7-consensus/packages/part093.fasta, 7-consensus/packages/part089.fasta, 7-consensus/packages/part088.fasta, 7-consensus/packages/part075.fasta, 7-consensus/packages/part091.fasta, 7-consensus/packages/part082.fasta, 7-consensus/packages/part073.fasta, 7-consensus/packages/part076.fasta, 7-consensus/packages/part023.fasta, 7-consensus/packages/part054.fasta, 7-consensus/packages/part085.fasta, 7-consensus/packages/part079.fasta, 7-consensus/packages/part067.fasta, 7-consensus/packages/part062.fasta, 7-consensus/packages/part092.fasta, 7-consensus/packages/part080.fasta, 7-consensus/packages/part061.fasta, 7-consensus/packages/part059.fasta, 7-consensus/packages/part077.fasta, 7-consensus/packages/part057.fasta, 7-consensus/packages/part074.fasta, 7-consensus/packages/part078.fasta, 7-consensus/packages/part070.fasta, 7-consensus/packages/part087.fasta, 7-consensus/packages/part084.fasta, 7-consensus/packages/part086.fasta, 7-consensus/packages/part052.fasta, 7-consensus/packages/part036.fasta, 7-consensus/packages/part053.fasta, 7-consensus/packages/part058.fasta, 7-consensus/packages/part063.fasta, 7-consensus/packages/part066.fasta, 7-consensus/packages/part048.fasta, 7-consensus/packages/part014.fasta, 7-consensus/packages/part072.fasta, 7-consensus/packages/part064.fasta, 7-consensus/packages/part028.fasta, 7-consensus/packages/part038.fasta, 7-consensus/packages/part069.fasta, 7-consensus/packages/part035.fasta, 7-consensus/packages/part071.fasta, 7-consensus/packages/part029.fasta, 7-consensus/packages/part025.fasta, 7-consensus/packages/part039.fasta, 7-consensus/packages/part060.fasta, 7-consensus/packages/part047.fasta, 7-consensus/packages/part034.fasta, 7-consensus/packages/part049.fasta, 7-consensus/packages/part020.fasta, 7-consensus/packages/part041.fasta, 7-consensus/packages/part065.fasta, 7-consensus/packages/part019.fasta, 7-consensus/packages/part050.fasta, 7-consensus/packages/part046.fasta, 7-consensus/packages/part045.fasta, 7-consensus/packages/part044.fasta, 7-consensus/packages/part006.fasta, 7-consensus/packages/part008.fasta, 7-consensus/packages/part010.fasta, 7-consensus/packages/part040.fasta, 7-consensus/packages/part030.fasta, 7-consensus/packages/part051.fasta, 7-consensus/packages/part022.fasta, 7-consensus/packages/part043.fasta, 7-consensus/packages/part056.fasta, 7-consensus/packages/part007.fasta, 7-consensus/packages/part042.fasta, 7-consensus/packages/part031.fasta, 7-consensus/packages/part037.fasta, 7-consensus/packages/part012.fasta, 7-consensus/packages/part017.fasta, 7-consensus/packages/part004.fasta, 7-consensus/packages/part024.fasta, 7-consensus/packages/part032.fasta, 7-consensus/packages/part055.fasta, 7-consensus/packages/part003.fasta, 7-consensus/packages/part018.fasta, 7-consensus/packages/part013.fasta, 7-consensus/packages/part027.fasta, 7-consensus/packages/part005.fasta, 7-consensus/packages/part026.fasta, 7-consensus/packages/part033.fasta, 7-consensus/packages/part011.fasta, 7-consensus/packages/part021.fasta, 7-consensus/packages/part009.fasta, 7-consensus/packages/part001.fasta, 7-consensus/packages/part016.fasta, 7-consensus/packages/part002.fasta, 7-consensus/packages/part015.fasta, 7-consensus/packages.tigName_to_ID.map, 6-layoutContigs/unitig-popped.layout.scfmap, 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 7-consensus/packages.finished, emptyfile, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa
    output: 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype1.fasta, 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta
    log: 7-consensus/combineConsensus.out, 7-consensus/combineConsensus.err
    jobid: 17
    reason: Missing output files: 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta, 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype1.fasta; Input files updated by another job: 7-consensus/packages/part064.fasta, 7-consensus/packages/part046.fasta, 7-consensus/packages/part021.fasta, 7-consensus/packages/part032.fasta, 7-consensus/packages/part083.fasta, 7-consensus/packages/part094.fasta, 7-consensus/packages/part082.fasta, 7-consensus/packages/part079.fasta, 7-consensus/packages/part015.fasta, 7-consensus/packages/part086.fasta, 7-consensus/packages/part051.fasta, 7-consensus/packages/part045.fasta, 7-consensus/packages/part072.fasta, 7-consensus/packages/part035.fasta, 7-consensus/packages/part090.fasta, 7-consensus/packages/part007.fasta, 7-consensus/packages/part053.fasta, 7-consensus/packages/part008.fasta, 7-consensus/packages/part055.fasta, 7-consensus/packages/part001.fasta, 7-consensus/packages/part030.fasta, 7-consensus/packages/part050.fasta, 7-consensus/packages/part084.fasta, 7-consensus/packages/part071.fasta, 7-consensus/packages/part091.fasta, 7-consensus/packages/part058.fasta, 7-consensus/packages/part022.fasta, 7-consensus/packages/part038.fasta, 7-consensus/packages/part080.fasta, 7-consensus/packages/part096.fasta, 7-consensus/packages/part012.fasta, 7-consensus/packages/part057.fasta, 7-consensus/packages/part025.fasta, 7-consensus/packages/part087.fasta, 7-consensus/packages/part073.fasta, 7-consensus/packages/part076.fasta, 7-consensus/packages/part034.fasta, 7-consensus/packages/part010.fasta, 7-consensus/packages/part019.fasta, 7-consensus/packages/part052.fasta, 7-consensus/packages/part041.fasta, 7-consensus/packages/part048.fasta, 7-consensus/packages/part009.fasta, 7-consensus/packages/part066.fasta, 7-consensus/packages/part093.fasta, 7-consensus/packages/part092.fasta, 7-consensus/packages/part081.fasta, 7-consensus/packages/part095.fasta, 7-consensus/packages/part023.fasta, 7-consensus/packages/part042.fasta, 7-consensus/packages/part074.fasta, 7-consensus/packages/part061.fasta, 7-consensus/packages/part067.fasta, 7-consensus/packages/part088.fasta, 7-consensus/packages/part047.fasta, 7-consensus/packages/part044.fasta, 7-consensus/packages/part062.fasta, 7-consensus/packages/part039.fasta, 7-consensus/packages/part028.fasta, 7-consensus/packages/part077.fasta, 7-consensus/packages/part097.fasta, 7-consensus/packages/part036.fasta, 7-consensus/packages/part068.fasta, 7-consensus/packages/part054.fasta, 7-consensus/packages/part006.fasta, 7-consensus/packages/part049.fasta, 7-consensus/packages/part031.fasta, 7-consensus/packages/part085.fasta, 7-consensus/packages/part003.fasta, 7-consensus/packages/part018.fasta, 7-consensus/packages/part004.fasta, 7-consensus/packages/part089.fasta, 7-consensus/packages/part056.fasta, 7-consensus/packages/part033.fasta, 7-consensus/packages/part069.fasta, 7-consensus/packages/part060.fasta, 7-consensus/packages/part027.fasta, 7-consensus/packages/part059.fasta, 7-consensus/packages/part078.fasta, 7-consensus/packages/part075.fasta, 7-consensus/packages/part024.fasta, 7-consensus/packages/part017.fasta, 7-consensus/packages/part063.fasta, 7-consensus/packages/part070.fasta, 7-consensus/packages/part011.fasta, 7-consensus/packages/part014.fasta, 7-consensus/packages/part040.fasta, 7-consensus/packages/part037.fasta, 7-consensus/packages/part016.fasta, 7-consensus/packages/part005.fasta, 7-consensus/packages/part020.fasta, 7-consensus/packages/part013.fasta, 7-consensus/packages/part029.fasta, 7-consensus/packages/part026.fasta, 7-consensus/packages/part043.fasta, 7-consensus/packages/part065.fasta, 7-consensus/packages/part002.fasta
    resources: tmpdir=/data/tmp, job_id=1, n_cpus=1, mem_gb=10, time_h=4

[Fri Apr  7 21:00:50 2023]
Finished job 17.
135 of 136 steps (99%) done
Select jobs to execute...

[Fri Apr  7 21:00:51 2023]
localrule verkko:
    input: 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, emptyfile, 6-layoutContigs/unitig-popped.layout, 6-layoutContigs/unitig-popped.layout.scfmap, 7-consensus/unitig-popped.fasta, 7-consensus/unitig-popped.haplotype1.fasta, 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta, emptyfile, 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv
    output: assembly.homopolymer-compressed.gfa, assembly.homopolymer-compressed.noseq.gfa, assembly.homopolymer-compressed.layout, assembly.hifi-coverage.csv, assembly.ont-coverage.csv, assembly.fasta, assembly.scfmap
    jobid: 0
    reason: Missing output files: assembly.homopolymer-compressed.noseq.gfa, assembly.scfmap, assembly.hifi-coverage.csv, assembly.fasta, assembly.ont-coverage.csv, assembly.homopolymer-compressed.gfa, assembly.homopolymer-compressed.layout; Input files updated by another job: 5-untip/unitig-popped-unitig-normal-connected-tip.hifi-coverage.csv, 7-consensus/unitig-popped.fasta, emptyfile, 2-processGraph/unitig-unrolled-hifi-resolved.ont-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.ont-coverage.csv, 6-layoutContigs/unitig-popped.layout.scfmap, 5-untip/unitig-popped-unitig-normal-connected-tip.gfa, 6-layoutContigs/unitig-popped.layout, 7-consensus/unitig-popped.haplotype2.fasta, 7-consensus/unitig-popped.unassigned.fasta, 5-untip/unitig-popped-unitig-normal-connected-tip.ont-coverage.csv, 7-consensus/unitig-popped.haplotype1.fasta, 2-processGraph/unitig-unrolled-hifi-resolved.hifi-coverage.csv, 4-processONT/unitig-unrolled-ont-resolved.hifi-coverage.csv
    resources: tmpdir=/data/tmp

Reading graph from stdin
[Fri Apr  7 21:02:31 2023]
Finished job 0.
136 of 136 steps (100%) done
Complete log: .snakemake/log/2023-04-06T074837.594544.snakemake.log
