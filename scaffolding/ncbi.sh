#!/bin/bash

# Docker is the default image, and will be automatically downloaded and used by the runner script.

SOURCE_DB_MANIFEST="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/FCS/database/test-only/test-only.manifest"
LOCAL_DB="/public/groups/meyerlab/dbs/fcs-test"
python3 fcs.py db get --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/test-only" 


./run_fcsadaptor.sh --fasta-input curated_wrapped.FINAL.chloroplast_rm.contams_rm.fasta --output-dir fcsadaptor_o --euk

# clean the genome using the report
cat curated_wrapped.FINAL.chloroplast_rm.contams_rm.fasta | sudo python3 ./fcs.py clean genome --action-report ./gx_out/curated_wrapped.FINAL.chloroplast_rm.contams_rm.425869.fcs_gx_report.txt --output curated_wrapped.FINAL.chloroplast_rm.contams_rm.ncbiclean.fasta --contam-fasta-out contam.fasta
