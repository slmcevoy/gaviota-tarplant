### Sequencing files

* /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220809_195002/A1/outputs/m64069_220809_200722.hifi_reads.fastq
* /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220809_195002/B1/outputs/m64069_220811_070224.hifi_reads.fastq
* /redser4/raw/Meyer_GVTP_Hifi/PB766_GVTP-1_GaviotaTarplant_HiFiv3/r64069_20220726_183843/C1/outputs/m64069_220729_164623.hifi_reads.fastq

### Sequencing reports

Provided by Oanh Nguyen (OHNGUYEN@ucdavis.edu), Staff Research Associate - PacBio Platform, DNA Technologies Core, UC Davis Genome Center
* [A1-m64069_220809_200722](https://github.com/slmcevoy/gaviota-tarplant/blob/main/sequencing/hifi/A1-PB776_GVTP_1_GaviotaTarplant_cell2_report.pdf)
* [B1-m64069_220811_070224](https://github.com/slmcevoy/gaviota-tarplant/blob/main/sequencing/hifi/B1-PB776_GVTP_1_GaviotaTarplant_HiFiv3_cell3_report.pdf)
* [C1-m64069_220729_164623](https://github.com/slmcevoy/gaviota-tarplant/blob/main/sequencing/hifi/C1-PB776_GaviotaTarplant_cell1_report.pdf)

### Quality control

* LongQC v1.2.0c was used to generate [summary statistics](https://docs.google.com/spreadsheets/d/1UE9K6D2R1yrIELLfxwF7lrPZlcxHniXjwkWnjI0mfms) on raw reads and after the final filtering. I also tested this for adapter trimming (see longQC/A1-trimmed/, etc) before deciding on HiFiAdapterFilt.  It found 5-15 seqs per library for trimming, but these might be inaccurate.  FastQC also picked up a tiny amount of RNA related adapters so I think these trimming tools that are non-specific to Hifi might pick up more artifacts if left to detect them automatically.
* HiFiAdapterFilt v2.0.0 was used to filter reads with adapters. (Only 0-1 per library).  According to PacBio documentation, [adapter and length filtering occur during CSS creation](https://ccs.how/how-does-ccs-work.html).
* FastQC is primarly for short read quality control, but it was run here as an additional check.

### Filtering

* Not Used: Centrifuge v1.0.4 was used to identify and filter contaminants.  I copied over and index I was using at UConn, containing archaea, bacteria, fungus, and virus.
  * It appears that mainly bacteria were filtered. Acinetobacter baumannii and Clostridium tetani had the most reads filtered by far.
* This was not filtered for fear of filtering plastid-like sequence.  Particularly in this situation where there were difficulties assembling the chloroplast.  The filtering didn't make any difference with the HiFi nuclear assembly issues.

