# Kmer analysis

* KMC v3.1.1 with HiFi reads were used to create the histogram of kmer frequencies.  I tested kmers 21, 27, 31, with max coverage 500000.  There are two gits for KMC.  I used the following as recommended, to get the smudge_pairs command. https://github.com/tbenavi1/KMC 

* The visualization was plotted in Genomescope 2.0. (left column, below)

* Smudgeplot v0.2.2 was used to estimate ploidy (middle and right columns, below).  Lower and upper boundaries of the kmer frequency peaks must be selected.  I let the script autodetect the upper boundary as this is not a critical value.  The lower boundary proposed by the script did not capture all of the initial peaks as seen in GenomeScope, so I used Genomescope's kcov value as L in each case. This was based on guidance from the Smudgeplot git wiki and issue queue.
  * The publication found that in highly repetitive genomes, signal from the repeats or highly heterozygous genomes can hide signal of polyploidism.  Our repeats are over 70%, which is high enough to fall into this case.

### K21
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk21.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k21_L20_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k21_L20_500000_log10.png" height="325">

### K27
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk27.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k27_L20_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k27_L20_500000_log10.png" height="325">

### K31
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk31.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k31_L19_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k31_L19_500000_log10.png" height="325">

---

I initially looked at kmer counting with the Omni-C reads, but this approach has not been vetted, as per a Tweet by Mike Schatz (his lab created Genomescope). Genomescope depends on even, unbiased coverage across the whole genome, which isn't guaranteed in omni-c like it is with shotgun sequencing.  I tested it out and couldn't get the model to converge.
