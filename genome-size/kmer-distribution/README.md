# Kmer counting

* KMC with HiFi reads were used to create the histogram of kmer frequencies
* The visualization was plotted in Genomescope 2.0.


Guidance on generating kmers from Omni-C documentation. Covers trimming of bridge sequence and generating the kmer database
https://omni-c.readthedocs.io/en/latest/assembly.html#assembly-enhancement

The example uses cutadapt for trimming.  I used fastp since that was already installed.  I trimmed both the bridge sequence and indexing adapters.
