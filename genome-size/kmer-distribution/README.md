# Kmer counting

* KMC v3.1.1 with HiFi reads were used to create the histogram of kmer frequencies.  I tested kmers 21, 27, 31, with max coverage 500000.  There are two gits for KMC.  I used the following as recommended, to get the smudge_pairs command. https://github.com/tbenavi1/KMC 

* The visualization was plotted in Genomescope 2.0.

<img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescopeGVTPk21.png" height="300"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescopeGVTPk27.png" height="300"> <img src="https://github.com/slmcevoy/gaviota-tarplant/blob/main/genome-size/kmer-distribution/genomescopeGVTPk31.png" height="300">



---

Guidance on generating kmers from Omni-C documentation. Covers trimming of bridge sequence and generating the kmer database
https://omni-c.readthedocs.io/en/latest/assembly.html#assembly-enhancement

The example uses cutadapt for trimming.  I used fastp since that was already installed.  I trimmed both the bridge sequence and indexing adapters.
