# Kmer analysis

* KMC v3.1.1 with HiFi reads were used to create the histograms of kmer frequencies.  I tested kmers 21, 27, 31, with max coverage 500000.  There are two gits for KMC, and I used the following as recommended, to get the smudge_pairs command: https://github.com/tbenavi1/KMC 

* The visualization was plotted in Genomescope 2.0. (left column, below).  The plot is a bit unusual as the top of the first peak is cutoff.  The coverage of reads with errors (red line) is also higher than most.  Usually this line drops off quickly.

* Smudgeplot v0.2.2 was used to estimate ploidy which was diploid for all 3 kmers tested (middle and right columns, below).  When running Smudgeplot, lower and upper boundaries of the kmer frequency peaks must be selected.  I let the script autodetect the upper boundary as this is not a critical value.  The lower boundary proposed by the autodetect script did not capture all of the initial peaks as observed in the GenomeScope plots, so I used Genomescope's kcov value as L in each case. This was based on guidance from the Smudgeplot git wiki and issue queue.
  * The publication notes that in testing they found that in highly repetitive or heterozygous genomes, the signal of polyploidism can be obscured.  This could be a factor for GT where repeats are at 70%.

A list of links to all the Genomscope results is in the [google sheet](https://docs.google.com/spreadsheets/d/1UE9K6D2R1yrIELLfxwF7lrPZlcxHniXjwkWnjI0mfms/edit#gid=1418181417)
### K21
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk21.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k21_L20_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k21_L20_500000_log10.png" height="325">
http://genomescope.org/genomescope2.0/analysis.php?code=XxnotJ7JzVpqCqSe6mHX

### K27
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk27.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k27_L20_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k27_L20_500000_log10.png" height="325">
http://qb.cshl.edu/genomescope/genomescope2.0/analysis.php?code=3nc0Q4jiob3Nzyh0f7l7

### K31
<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescope/genomescopeGVTPk31.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k31_L19_500000.png" height="325"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/smudgeplot/smudgeplot_smudgeplot_k31_L19_500000_log10.png" height="325">
http://genomescope.org/genomescope2.0/analysis.php?code=imsOiQ3pSZw7J4Ocpri8

---

I initially looked at kmer counting with the Omni-C reads, but this approach has not been vetted, as per a Tweet by Mike Schatz (his lab created Genomescope). Genomescope depends on even, unbiased coverage across the whole genome, which isn't guaranteed in omni-c like it is with shotgun sequencing.  I tested it out and couldn't get the model to converge.
