#!/bin/bash
set -e
set -u
set -o pipefail

    cd data/
    echo "# Inspecting and Manipulating Text Data with Unix Tools"

    echo "# Inspecting Data with Head and Tail"
    head -n 2 cerebella_mouse_1_known.csv
    tail -n 2 cerebella_mouse_1_known.csv

    # less
    # look at a file with less. To quit less, press q.
    #less cerebella_mouse_1_known.csv
    # To search text and highlights matches in less, press / and enter text (e.g. "Acetyl", "methyl", "phosphate")

    echo; echo "# wc -l outputs the number of lines"
    wc -l cerebella_*_known.csv
    echo; echo "# ls -lh reports human-readable file sizes"
    ls -lh cerebella_*_known.csv

    # grep
    echo; echo "# use grep to extract lines of a file that match a pattern"
    grep "glucose" cerebella_mouse_1_known.csv
    echo; echo "# add the option -i to grep to be case insensitive"
    grep -i "glucose" cerebella_mouse_1_known.csv
    # add the option `--color` to grep to enable terminal colors
    #grep --color "[Gg]lucose" cerebella_mouse_1_known.csv
    echo; echo "# add the option -c to grep to count how many lines match a pattern"
    grep -c "[Gg]lucose" *_known.csv
    echo; echo "# add the option -v to grep to only return lines that do not match a pattern"
    grep -v "cation\|anion" *_unknown.csv

    echo; 
    echo "# Using grep, cut, sort, uniq to summarize columns of data"
    echo "# use grep to extract lines of a file that match a pattern"
    echo "# Extracting the column(s) with cut"
    echo "# Sorting Plain-Text Data with Sort"
    echo "# Finding Unique Values in Uniq"
    grep 'Conc' *.csv | cut -d',' -f3 | sort | uniq
    echo "# Adding the option -c to uniq to show the counts of occurrences next to the unique lines"
    grep 'Conc' *.csv | cut -d',' -f3 | sort | uniq -c

