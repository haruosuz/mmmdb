----------

Haruo Suzuki  
Last Update: 2016-01-10  

----------

# Mouse Multiple tissue Metabolome DataBase (MMMDB) Project
Project started 2015-11-12.  

Duplicated datasets from mouse (1) and mouse (2) were retrieved from the Mouse Multiple tissue Metabolome DataBase (MMMDB). I used R to draw histograms and scatter plots for the values of m/z (mass-to-charge ratio) and concentrations for metabolites.

## Project directories

    mmmdb/
     README.md: project documentation 
     data/: contains metabolome data in CSV format
     scripts/: contains R and Shell scripts
     analysis/: contains results of data analyses

## Data

The 44 .csv files downloaded on 2015-11-12 from <http://mmdb.iab.keio.ac.jp/download.html> into `data/`:

     data/*_mouse_{1,2}_{known,unknown}.csv

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories (`data/` and `analysis/`), downloading data files,
running the shell script for inspecting data `scripts/run_InspectingData.sh`, and
running the R script `scripts/my_analysis.R` that generates the output files `analysis/plot.pdf` and `analysis/table.csv`.
The R script `scripts/my_analysis_reshape2.R` generates the output files `analysis/plot_reshape2.pdf` and `analysis/table_reshape2.csv`. 

## Usage

In the project's main directory `mmmdb/`, we run the shell script `scripts/run.sh` with:

    bash scripts/run.sh > log.txt 2>&1 &

----------

### References
- [Nucleic Acids Res. 2012 Jan;40(Database issue):D809-14. MMMDB: Mouse Multiple Tissue Metabolome Database.](http://www.ncbi.nlm.nih.gov/pubmed/22139941)
 - [Supplementary Data](http://nar.oxfordjournals.org/content/suppl/2011/12/01/gkr1170.DC1/nar-02043-data-e-2011-File003.pdf)

----------
