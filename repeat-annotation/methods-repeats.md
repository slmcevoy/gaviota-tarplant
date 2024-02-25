## Repeat annotations  

### Repeat masking  

A de novo repeat library was generated with RepeatModeler using the flag -LTRStruct.  This was combined with the curated plant database of LTRs, InpactorDB_redundant_final_V5.fasta for RepeatMasker.  An alternative database, ASTER-REP was also tested but resulted in much less repeat coverage.  

### Parsing  

ParseRM scripts were used to summarize the RepeatMasker .out file.  A short scripts are included that were used to reformat RepeatMasker results to fix the naming of Gypsy and Copia subfamilies from the InpactorDB so they are included in ParseRM totals.  ParseRM -l was also used to create a file formated to create a landscape abundance plot in ggplot2.  

