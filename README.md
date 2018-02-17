# sameena-data

## Prerequisites
- Install RStudio - https://www.rstudio.com/
- Install r-packages:

## Installation
Open RStudio and install the required packages
```
install.packages(c('magrittr', 'gdata', 'optparse'))
```

## Usage
```
Rscript  -o <output-file-path> <input-file-path-1>  <input-file-path-2>
```

Example:
```
Rscript -o output.csv scripts/prepare_phone_bank_data data/sameenaphonebankingdata/sameena-mustafa-02-07-2018-433922415.csv data/sameenaphonebankingdata/sameena-mustafa-02-08-2018-857422284.csv
```
