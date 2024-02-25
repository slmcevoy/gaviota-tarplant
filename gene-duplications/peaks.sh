#!/bin/bash

#perl add_ka_ks_to_collinearity_file.pl gvtplongest

#perl compute_ks_for_synteny_blocks.pl gvtplongest.collinearity.kaks

# might need python 2.7
#python plot_syntenic_blocks_ks_distri.py gvt.synteny.blocks.ks.info 2 gvtplongest

#perl add_ka_ks_to_collinearity_file.pl hann
#perl compute_ks_for_synteny_blocks.pl hann.collinearity.kaks
python plot_syntenic_blocks_ks_distri.py han.synteny.blocks.ks.info 3 hann
