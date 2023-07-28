# Code for data acquisition and understanding (exploratory analysis)

GPW load data - script for loading data

GPW analyse data - script for analyse data

GPW EDA - exploratory data analysis, looking for correlations between companies

NASDAQ download data - script for downloading data from AWS cloud in PARQUET format

NASDAQ merge data - script for merging downloaded PARQUET data into one big CSV file

NASDAQ load data - script for loading data in CSV format. 
Because of problems with loading one big CSV file, we divided it into multiple smaller CSV files (using external software) and then loaded them into one big pandas dataframe. 

EXTRA INTC visualisation - visualisation of INTEL prices using external data (scrapped from websites)

EXTRA companies visualisation - visualisation of companies prices using external data

EXTRA group plot cor data - using external data, we grouped them into one minute interval, then plotted and found correlations between lagged data (using time windows)