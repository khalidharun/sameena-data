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

### Prepare Phone Bank Data
```
Rscript scripts/prepare_phone_bank_data FILE1 [FILE2 ...] [-o OUTPUT_PATH]
Rscript scripts/prepare_phone_bank_data data/sameena-mustafa-02-07-2018-433922415.csv data/sameena-mustafa-02-08-2018-857422284.csv -o output.los.csv
```

### Prepare Mailing List
```
Rscript scripts/prepare_mailing_list FILE1 [FILE2 ...] [-o OUTPUT_PATH]
Rscript scripts/prepare_mailing_list data/NewMail20180205-21275515603.csv -o output.mail.csv
```
