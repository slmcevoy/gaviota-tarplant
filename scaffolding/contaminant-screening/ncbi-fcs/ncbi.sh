#!/bin/bash

# Docker is the default image, and will be automatically downloaded and used by the runner script.

# test database

#SOURCE_DB_MANIFEST="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/FCS/database/test-only/test-only.manifest"
#LOCAL_DB="/projects/GVTP/assemblies/flye/3ddna-erc5/ncbi_contams/testdb"
#sudo python3 fcs.py db get --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/test-only"
#sudo python3 fcs.py db check --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/test-only"

#GXDB_LOC=/projects/GVTP/assemblies/flye/3ddna-erc5/ncbi_contams/testdb
#sudo python3 ./fcs.py screen genome --fasta curated_wrapped.FINAL.chloroplast_rm.contams_rm.fasta --out-dir ./ncbi_test_out/ --gx-db "$GXDB_LOC/test-only"  --tax-id 425869


# full database screening

SOURCE_DB_MANIFEST="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/FCS/database/latest/all.manifest"
LOCAL_DB="/projects/GVTP/assemblies/flye/3ddna-erc5/ncbi_contams/fulldb"
sudo python3 fcs.py db get --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/gxdb" 
GXDB_LOC=/projects/GVTP/assemblies/flye/3ddna-erc5/ncbi_contams/fulldb
GX_NUM_CORES=60
sudo python3 ./fcs.py screen genome --fasta curated_wrapped.FINAL.chloroplast_rm.contams_rm.fasta --out-dir ./gx_out/ --gx-db "$GXDB_LOC/gxdb" --tax-id 425869

# clean the genome using the report

cat curated_wrapped.FINAL.chloroplast_rm.contams_rm.fasta | sudo python3 ./fcs.py clean genome --action-report ./gx_out/curated_wrapped.FINAL.chloroplast_rm.contams_rm.425869.fcs_gx_report.txt --output curated_wrapped.FINAL.chloroplast_rm.contams_rm.ncbiclean.fasta --contam-fasta-out contam.fasta

