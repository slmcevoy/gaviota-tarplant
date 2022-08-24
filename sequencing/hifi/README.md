### Sequencing reports

Provided by Oanh Nguyen (OHNGUYEN@ucdavis.edu), Staff Research ASsociate - PacBio Platform, DNA Technologies Core, UC Davis Genome Center

### FastQC

FastQC, is primarly for short read quality control, but it was run here as one evaluation.

### Trimming

LongQC provides summary statistics and QC for a variety of long read technologies.  It trimmed a small amount of adapter.  I used the bp statistics for calculating coverage as shown in the [google sheet](https://docs.google.com/spreadsheets/d/1UE9K6D2R1yrIELLfxwF7lrPZlcxHniXjwkWnjI0mfms)

### Filtering

Centrifuge was used to identify and filter contaminants.  I copied over and index I was using at UConn, containing archaea, bacteria, fungus, and virus.
LongQC was run after this filtering to check the drop in coverage.
