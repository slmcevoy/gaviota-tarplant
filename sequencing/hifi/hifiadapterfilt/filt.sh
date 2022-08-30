#!/bin/bash

export PATH=$PATH:/redser4/projects/GVTP/software/HiFiAdapterFilt:/redser4/projects/GVTP/software/HiFiAdapterFilt/DB

#bash pbadapterfilt.sh -p m64069_220729_164623 -t 12 -o C1 1>C1.o 2>C1.e

#bash pbadapterfilt.sh -p m64069_220809_200722 -t 12 -o A1 1>A1.o 2>A1.e

bash pbadapterfilt.sh -p m64069_220811_070224 -t 8 -o B1 1>B1.o 2>B1.e
