#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading data
wget -P data/ -A "*.csv" -r -np -nd -nv http://mmdb.iab.keio.ac.jp/download/

# Running shell script for Inspecting Data
bash scripts/run_InspectingData.sh

# Running R scripts
Rscript --vanilla scripts/my_analysis.R
#Rscript --vanilla scripts/my_analysis_reshape2.R

# Print operating system characteristics
uname -a

echo "[$(date)] Thank you, come again."
