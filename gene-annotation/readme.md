<H1>Gene Annotation</H1>  

<details>  
<summary>RNA-Seq preparation</summary>  
	
<h4>Raw read QC</h4>  

Raw reads are saved at /redser5/raw/Meyer_GVTP_rnaseq/RM_8RNA_S-23-0084_GAP507-380985426.tar.gz   
They were QC'd with FastQC  
Script above: fastqc.sh  
Reports: fastqc_raw  

<h4>Filtering</h4>  

Filtering with fastp defaults was performed.  
Script: fastp.sh  
Reports: fastp_reports  

<h4>Initial alignment</h4>  

Initial alignment with Hisat resulted in poor mapping rate.  Easel prefers >=85% mapping per library.  Mapping and unmapped reads were put into separate files for further evaluation.  This was done by using the -F 4 and -f 4 flags to filter the .bam files.  Cut -f1 was used to get a list of read ids which was provided to seqtk to create the subset fastq files.  

Script: hisat/hisat.sh  
Mapping rates: hisat/flagstat_all.txt  


<h4>Contaminant filtering</h4>  

Unmapped reads were checked for contaminants.  Contaminant identification was done on the UCONN HPC using Kraken and the MiniKrakenv2 database saved there that contains bacteria, archaea, and virus.  There were a substantial number of hits to certain bacteria.  Results can be viewed in reports found above.  As output, Kraken provides separate fastq files for classified and unclassified reads, with classified being the fastq matching the contaminant database.  Unclassified reads were combined with the original mapped reads for a contaminant-filtered set of RNA-Seq.  

Script: kraken.sh   
Reports: kraken_reports      

<h4>Final alignment</h4>  

Mapping was redone with the contaminant filtered RNA-Seq.  

Script: hisat.sh (bottom for loop only)    

</details>

<details>
<summary>Gene annotation</summary>  

<br>   
EASEL - transcript assembly, gene prediction, filtering, summary metrics  
<br>  
<br>
Easel was run on the UCONN HPC but the output is saved at:  
 /redser5/projects/GVTP/gene_annotations  gvtp-easel.tar.gz  
 Command to run easel: nextflow.sh  
 <br>
 Configurations for run: gvtp.yaml  
<br><br>
Scripts to run are saved above along with descriptive output such as metrics and the entap log.  

</details>
