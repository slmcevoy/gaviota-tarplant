# Gaviota tarplant Reference genome  

This repository contains methods and workflow commands used to generate a reference genome for Deinandra increscens subsp. villosa (Asteraceae).  
 
  
### Sequencing  

[ONT](sequencing/ont/)  
[Omni-C](sequencing/omni-c/)  
[HiFi](sequencing/hifi/)   

### Genome estimates  

[Flow cytometry estimate](genome-size/flowcy/README.md) - 1.7 -2.3 Gbp  
[K-mer based estimates](genome-size/kmer-distribution/README.md) - 1.75 Gbp, 70% repeats, and heterozygosity of 1.83.  

### Genome Assembly  

[Draft assemblies](draft-assemblies/) 
 * Flye, Canu, Verkko, Hifiasm  
 * Purge Haplotigs  

[Scaffold assemblies](draft-assemblies/) Flye in Juicer/3D-DNA/JuiceBox  


### Annotation  

[Repeat annotation](repeat-annotation)  
 * RepeatModeler DeNovo with --LTRStruct  
 * RepeatMasker: RepeatModeler results plus ltrstruct_inpactor, a curated plant LTR database. ASTER-REP database was also tested.  ParseRM was used to examine the RepeatMasker results.  

[Gene annotation](gene-annotation) - using 8 RNA-Seq libraries (2 tissue types, 4 individuals) in the EASEL pipeline.  

### Gene duplication   

[Gene duplication](gene-duplication) 

Identification and categorization of gene duplication pairs using https://github.com/qiao-xin/DupGen_finder
Plotting of WGD peaks for Gaviota tarplant and sunflower https://github.com/qiao-xin/Scripts_for_GB
