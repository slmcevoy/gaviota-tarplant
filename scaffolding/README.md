## Assembly scaffolding   

Scaffolding steps followed recommendations in the Genome Assembly Cookbook from the Aiden Lab.  Script files mentioned are linked above. 
This workflow was tested on both the Flye ONT and Canu ONT "repetitive" assemblies, but it actually fragmented the Canu assembly even further. QC and Juicebox visualization showed that there was a poor coverage rate of Omni-C over this assembly.  

### Omni-C read preperation  

 1. setup input files (pre.sh) index the draft assembly, create tab-delimited file of contigs with read lengths, align raw Omni-C reads to draft assembly and index.  Symlink raw Omni-c in fastq directory.

 2. run Juicer to create merged_nodups.txt file which is essentially cleaned and formatted read pairs (juicer.sh)  Unlike other Hi-C read types, Omni-C does not use restriction enzymes, so -s none was used.  

### Scaffolding  
Use merged_nodups.txt and draft assembly in 3D-DNA (3ddna.sh) Several parameter changes were tested to try and improve results which were evaluated in Juicebox (step 4).   
		--editor-repeat-coverage 5  (selected as best for additional processing as described below)  
		--editor-repeat-coverage 10  
		-m (merge)
		-r 3 (3 rounds of misjoin correction instead of default of 2)  
		-i 8000 (decrease min length requirement of input reads)
		output:  
			*.FINAL.fasta  
			*.FINAL.assembly  
			*.final.hic (only a lowercase file for .hic on final set)  

4. visualize in Juicbox  
 * Juicebox has a GUI so must be installed locally (on your laptop/desktop)  
 * download .hic and .assembly files from the previous step  
 * 3D-DNA creates these files for all intermediate steps, so these (especially Round 0 and Round 1) were used to evaluate coverage for parameter adjustment.  
 * open the .hic and then import the .assembly  
 * no manual modifications were done on the suggested scaffolds


## Assembly evaluation

### Quast v5.2.0 --large
All statistics are based on contigs of size >= 3000 bp, unless otherwise noted (e.g., "# contigs (>= 0 bp)" and "Total length (>= 0 bp)" include all contigs).  

### BUSCO v5.4.3 with embryophyta database odb10

## Scaffold post-processing   

### Chloroplast screening  

Scaffolds were blasted to the Achyrachaena mollis chloroplast genome and other partial chloroplast contigs I attempted to assemble from this reference sequence.  Matches that consist of the majority of a chloroplast were removed.  Matches to a region within a contig were left as is.

### Contaminant screening  

#### Blobtools2  
Blobtools matches to arthropod, ascomycota, and basidiomycota were identified.  Contigs with the majority of their sequencing matching one of these were removed.  Partial matches were left as is.

#### FCS-GX  
NCBI Contaminant screening tool (ncbi.sh)  
first command in script runs screening and second filters results from genome  
SOURCE_DB_MANIFEST="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/FCS/database/latest/all.manifest"
--tax-id 425869  

### Gap filling  
TGS-GapCloser v1.2.1 using Canu error-corrected reads (--ne means skip error correction)

## Header renaming
Scaffold naming following the convention DEINVI_000001 (rename.sh)  


## Final assembly evaluation

### Quast v5.2.0 --large
All statistics are based on contigs of size >= 3000 bp, unless otherwise noted (e.g., "# contigs (>= 0 bp)" and "Total length (>= 0 bp)" include all contigs).  

### BUSCO v5.4.3 with embryophyta database odb10

### Merqury
Even though we assembled a consensus haploid genome, because of the heterozygosity, I tried running Merqury on the draft assembly after purge haplotigs with both the primary and alternate haplotypes to see if there was a better match between the assembly and read score.  

