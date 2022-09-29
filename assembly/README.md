### Final draft assembly

TBD

### Assemblers tested

#### HiFiASM v0.16.1-r375
Input: HiFi reads filtered with HiFiAdapterFilt and Centrifuge. 
I attempted this on both bigser and GI servers. This assembler stalled after the kmer profile stage.  This is a known issue that HiFiASM, described in the FAQ: https://hifiasm.readthedocs.io/en/latest/faq.html#why-does-hifiasm-stuck-or-crash "In most cases, it is caused by the low quality HiFi reads. A good HiFi dataset should have a k-mer plot like issue10 or issue49. In contrast, low quality HiFi data often lead to weird k-mer plot like issue93. Such weird k-mer plots usually indicate insufficient coverage or presence of contaminants. See Hifiasm log interpretation for more details. If the HiFi data look fine, please raise an issue at the issue page." Issue93 has more detail (https://github.com/chhylp123/hifiasm/issues/93). The resulting histogram in the output log does resemble the weird k-mer plot in issue93.  A similar histogram can be seen in the Genomescope results, where a large error profile overlap obscures the first peak.  Mike Schatz offers potential causes that include contamination, high error rates, or a mixture of haplotypes (https://github.com/schatzlab/genomescope/issues/77).  Since these are HiFi reads, they should not have a high error rate.  

This issue is particular to HiFiASM which has an approach dependent on the kmer histogram.  Other assemblers with different approaches should work better.  I am also attempting to diagnose any issues with the HiFi reads which could be causing the weird plot.  
From Oanh Ngyuen from the UC Davic Genome Center: "I quickly showed the graphs to our neighbors, the Bioinformatics Core, for their advice as I'm not a bioinformatician or analyst.  The information and graphs you provided didn't alarm them at all.  It's expected to have a small percentage of unwanted reads, so filtering them out is also recommended.  She agreed with me that you can proceed to blasting the sequence data to find out what (if any) species are found in the sequence data and go from there.  Beyond this, I cannot consult on your sequence data as I'm not qualified to do so.  

We have a stringent QC process from DNA extraction to sequence data.  We can investigate further by checking other projects that were processed in parallel with yours if the blasting of sequence data shows other species other than fungi and bacteria.  I suggest reaching out to the Bioinformatic Core for their expert advice."

I am running Blobtools with the NCBI nt database on contigs assembled by Flye to get check their taxonomy and hopefully id any additional contamination.

If I can get HiFiASM working, I can run it with the Hi-C reads to get fully phased haplotypes.

#### Flye v2.8.1-b1676
Input: HiFi reads filtered with HiFiAdapterFilt and Centrifuge.
The first three stages of Flye were run on bigser. I moved to GI's servers to do the final stage (polishing).  

Results of run with default settings had good BUSCO completeness but were very fragmented. Based on the total size and almost complete duplication of BUSCO genes, rather than collapsing the haplotypes into a consensus, it appears that both haplotypes were assembled into one genome.  I've seen this happen a couple of times before and can probably be separated out with purge haplotigs or similar.

 # contigs: 97998
 N50: 86788
 largest contig: 1211537 
 total length: 4837452289
 BUSCO: C:99.1%[S:4.2%,D:94.9%],F:0.3%,M:0.6%,n:1614

Running Blobtools to id contigs that are likely contaminants.  
Running Purge Haplotigs to see how this splits the genome into primary and alternate haplotypes.  

#### Verkko v.bioconda 1.1 

Running...  

### Assembly evaluation

#### Quast v5.2.0 --large
All statistics are based on contigs of size >= 3000 bp, unless otherwise noted (e.g., "# contigs (>= 0 bp)" and "Total length (>= 0 bp)" include all contigs).  

