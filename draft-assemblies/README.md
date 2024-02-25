## Final draft assembly

Scripts for the final draft assembly and other software tested are in directories above.  

### Flye v2.8.1-b1676 with ONT reads  
Flye with ONT reads was one of the two best draft assemblies.  For the most part, it collapsed things into a consensus rather than assembling both haplotypes as was seen in Canu (below).  

Filtered out reads with length < 3000  

Purge Haplotigs  
-l 0  -m 55  -h 190  
-l 0  -m 40  -h 190 (same result)  
Other tries:  
-l 0  -m 55  -h 190 -a 60  
Purge duplicates was also tried  

See Scaffolding next steps with this draft assembly.  

## Other assemblers tested  

### Canu with parameters recommended for highly repetitive genomes and ONT reads  

The parameters in this script are recommended in Canu documentation (two separate issues, repeat content and ONT, not in combination).  Purge Haplotigs tests ran with different parameters using repeatmodeler output.  

### Canu default parameters  

Purge Haplotigs tests using repeatmodeler output.  

### Verkko  
branch master commit c8f0621fca85f00fe1c9cfb9b752ee27ef291d08 2023-03-24 15:26:22 -0400  
Test 1 used all ONT and HiFi reads  
Test 2 used all HiFi and ONT with readlength >= 10k  

This paragraph documents notes on an issue I ran into with older commits -  I reported the issue and it was fixed in the commit used above after a couple of months:
I initially tried installing verkko with conda.  This resulted in an error in the dependency MBG.  Searching the issue queue, I did not find other reports of the exact same error, but there were similar errors and the usual advice was to use the latest HEAD of MBG instead of a conda install (https://github.com/marbl/verkko/issues/83).  The git HEAD version requires compilation with a newer g++ than was available on Genomics Institute servers (unrecognized command line option '-std=c++17 from the Makefile).  To get around this I used a conda environment with packages as suggested at the end of this thread: https://github.com/maickrau/MBG/issues/12 (conda install make gxx_linux-64 zlib pkg-config).  I restarted relying on Snakemake to resume from the last successfully completed step.  While it was able to make it past the initial error in MBG, there was a second error in the UnitigResolver.cpp.  While this specific error was not reported, there was another in the same file from two weeks ago that didn't have a response yet (https://github.com/maickrau/MBG/issues/16).  I'm unsure if my error could be from an issue in a previously completed step or bugs in the MBG HEAD so I'm re-running Verkko from the start.  I also decided to use the Verkko head instead of a conda installation to catch recent fixes.  To do this I also head to install GraphAligner (HEAD) as instructed, but also conga which wasn't mentioned, but resulted in an error when running make until I added it.  I also had to use the same conda environment I created for the MBG install.   


### HiFiASM v0.16.1-r375  
#### Test 1  
Input: HiFi reads filtered with HiFiAdapterFilt and Centrifuge. 
I attempted this on both bigser and GI servers. This assembler stalled after the kmer profile stage.  This is a known issue that HiFiASM, described in the FAQ: https://hifiasm.readthedocs.io/en/latest/faq.html#why-does-hifiasm-stuck-or-crash "In most cases, it is caused by the low quality HiFi reads. A good HiFi dataset should have a k-mer plot like issue10 or issue49. In contrast, low quality HiFi data often lead to weird k-mer plot like issue93. Such weird k-mer plots usually indicate insufficient coverage or presence of contaminants. See Hifiasm log interpretation for more details. If the HiFi data look fine, please raise an issue at the issue page." Issue93 has more detail (https://github.com/chhylp123/hifiasm/issues/93). The resulting histogram in the output log does resemble the weird k-mer plot in issue93.  A similar histogram can be seen in the Genomescope results, where a large error profile overlap obscures the first peak.  Mike Schatz offers potential causes that include contamination, high error rates, or a mixture of haplotypes (https://github.com/schatzlab/genomescope/issues/77).  Since these are HiFi reads, they should not have a high error rate.   

This issue is particular to HiFiASM which has an approach dependent on the kmer histogram.  Other assemblers with different approaches should work better.  I am also attempting to diagnose any issues with the HiFi reads which could be causing the weird plot.  
From Oanh Ngyuen from the UC Davic Genome Center: "I quickly showed the graphs to our neighbors, the Bioinformatics Core, for their advice as I'm not a bioinformatician or analyst.  The information and graphs you provided didn't alarm them at all.  It's expected to have a small percentage of unwanted reads, so filtering them out is also recommended.  She agreed with me that you can proceed to blasting the sequence data to find out what (if any) species are found in the sequence data and go from there.  Beyond this, I cannot consult on your sequence data as I'm not qualified to do so.  

#### Test 2  
Input: HiFi reads filtered with HiFiAdapterFilt  
Similar issue as above  

#### Test 3  
Input: HiFi reads and ONT reads filtered for ultralong > 100k readlength  
Similar issue because the software still starts with the HiFi reads and stalls at the k-mer profile. It never gets to the step incorporating ONT.  

### Flye v2.8.1-b1676  with HiFi reads  
Input: HiFi reads filtered with HiFiAdapterFilt and Centrifuge.  
The first three stages of Flye were run on bigser. I moved to GI's servers to do the final stage (polishing).  

Results of run with default settings had good BUSCO completeness but were very fragmented. Based on the total size and almost complete duplication of BUSCO genes, rather than collapsing the haplotypes into a consensus, it appears that both haplotypes were assembled.  Will need to be separated out with purge haplotigs or similar.

 &#35; contigs: 97998
 N50: 86788
 largest contig: 1211537 
 total length: 4837452289
 BUSCO: C:99.1%[S:4.2%,D:94.9%],F:0.3%,M:0.6%,n:1614

Running Blobtools to id contigs that are likely contaminants.  
Running Purge Haplotigs to see how this splits the genome into primary and alternate haplotypes.  


## Assembly evaluation

### Quast v5.2.0 --large
All statistics are based on contigs of size >= 3000 bp, unless otherwise noted (e.g., "# contigs (>= 0 bp)" and "Total length (>= 0 bp)" include all contigs).  

### BUSCO v5.4.3 with embryophyta database odb10

