# transactional-data-analysis
Having transactional data about various companies, we would like to analise them and predict the companies prices. 

## 1. Data Acquisition
All our data comes from [NASDAQ](https://www.nasdaq.com/ ) inside data sources - AWS bucket.
We thank NASDAQ company very much for providing us their data for academic purposes. 

Data was downloaded in PARQUET format, then joined and transformed into CSV files. 

#### Sample data (part of VLKAF2009.csv):

 |  |seqnum |timestamp |mktcenter |price |shares |salescondition |canceled |dottchar |issuechar |msgseqnum |originalmsgseqnum |submkt |
 |--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
 | 0 | 5005092 | 2009-05-07 09:51:24 | U | 311.0 | 7 | @    | False | F | ? | 11866 | 0 |  | 
 | 0 | 647028 | 2009-03-31 09:34:59 | U | 306.0 | 1 | @    | False | F | ? | 3459 | 0 |  | 
 | 0 | 12557913 | 2009-11-10 11:54:02 | U | 154.0 | 3 | @    | False | F | S | 42819 | 0 |  | 
 | 0 | 520998 | 2009-12-15 09:33:19 | U | 117.75 | 150 | @    | False | F | S | 6069 | 0 |  | 
 | 1 | 137136 | 2009-12-15 09:24:25 | U | 116.7498 | 50 | T    | False | T | S | 270 | 0 |  | 
 | 2 | 6125819 | 2009-12-15 10:36:25 | U | 117.5 | 90 | @    | False | F | S | 27253 | 0 |  | 
 | 0 | 1298876 | 2009-12-02 09:40:14 | U | 122.0 | 10 | @    | False | F | ? | 8907 | 0 |  | 
 | 0 | 8399796 | 2009-12-03 10:40:39 | U | 123.5 | 1 | @    | False | F | S | 29242 | 0 |  | 
 | 1 | 13296992 | 2009-12-03 11:56:55 | U | 123.5 | 75 | @    | False | F | S | 45884 | 0 |  | 
 | 2 | 3040677 | 2009-12-03 09:53:46 | U | 125.0 | 25 | @    | False | F | S | 14470 | 0 |  | 
 | 0 | 952622 | 2009-12-23 09:40:58 | U | 107.25 | 100 | @    | False | F | S | 7713 | 0 |  | 
 | 0 | 8362920 | 2009-08-05 10:27:06 | U | 350.0 | 5 | @    | False | F | ? | 25343 | 0 |  | 
 | 0 | 6762822 | 2009-11-03 10:17:29 | U | 160.0 | 2 | @    | False | F | ? | 19433 | 0 |  | 
 | 0 | 19760382 | 2009-11-12 14:17:35 | U | 153.75 | 200 | @    | False | F | S | 61286 | 0 |  | 
 | 1 | 1033532 | 2009-11-12 09:38:04 | U | 151.0 | 2 | @    | False | F | S | 7101 | 0 |  | 
 | 2 | 20446367 | 2009-11-12 14:30:17 | U | 150.5 | 200 | @    | False | F | S | 63243 | 0 |  | 
 | 3 | 20482154 | 2009-11-12 14:31:06 | U | 148.0 | 200 | @    | False | F | S | 63358 | 0 |  | 
 | 4 | 20434029 | 2009-11-12 14:29:55 | U | 153.75 | 200 | @    | True | F | S | 63192 | 61286 |  | 
 | 0 | 739074 | 2009-06-02 09:34:15 | U | 360.0 | 30 | @    | False | F | ? | 6499 | 0 |  | 
 | 0 | 68586 | 2009-07-28 09:05:49 | U | 360.7284 | 10 | U    | False | T | S | 224 | 0 |  | 
 | 0 | 1460568 | 2009-10-01 09:39:38 | U | 162.5 | 1 | @    | False | F | ? | 9963 | 0 |  | 

## 2. Data Cleaning and Aggregating
We have aggregated data by Year and Month (Closing Price from every month). 

#### Sample data (VLKAF2009aggregated.csv):

 | year |month |timestamp |price |
 |--- | --- | --- | --- | 
 | 2009 | 1 | 2009-01-28 08:05:12 | 306.0 | 
 | 2009 | 2 | 2009-02-20 09:55:18 | 117.75 | 
 | 2009 | 3 | 2009-03-31 09:34:59 | 117.5 | 
 | 2009 | 4 | 2009-04-24 14:12:37 | 125.0 | 
 | 2009 | 5 | 2009-05-28 10:49:17 | 153.75 | 
 | 2009 | 6 | 2009-06-12 09:52:37 | 150.5 | 
 | 2009 | 7 | 2009-07-30 08:01:01 | 165.0 | 
 | 2009 | 8 | 2009-08-28 15:42:16 | 181.75 | 
 | 2009 | 9 | 2009-09-25 09:49:45 | 201.0 | 
 | 2009 | 10 | 2009-10-26 15:05:20 | 336.0645 | 
 | 2009 | 11 | 2009-11-30 15:58:17 | 112.75 | 
 | 2009 | 12 | 2009-12-31 09:40:42 | 333.0 | 

## 3. Data Understanding
We have created charts for the time series. 

#### Sample chart (VLKAF_monthly_closing_prices.png):
![GitHub Logo](/Docs/Data_Report/VLKAF_monthly_closing_prices.png)

## 4. Time series decomposition
We decomposed series into trend, seasonality and irregular element. 

#### VLKAF data summary:
- Estimation span: [10-2008 - 6-2021] 
- 153 observations 
- Series has been log-transformed 
- No trading days effects 
- No easter effect 
- 11 detected outliers

![GitHub Logo](/Docs/Data_Report/VLKAF_Trend.png)
![GitHub Logo](/Docs/Data_Report/VLKAF_Seasonality.png)
![GitHub Logo](/Docs/Data_Report/VLKAf_Irregular.png)
