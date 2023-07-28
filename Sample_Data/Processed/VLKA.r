#library for using adf.test
library('tseries')
VLKAFmonthly <- read_csv("VLKAFmonthly.csv")

#deleting two first rows with price equal 1000
VLKA_deleted <- tail(VLKAFmonthly,-2)

#convert data to time series
VLKA_ts<-ts(VLKA_deleted$price, start=c(2008, 10), end=c(2021, 6), frequency=12)
ts.plot(VLKA_ts)

#visualization of decomposition
plot(decompose(VLKA_ts))

#autocorrelation functions
acf(VLKA_ts)
pacf(VLKA_ts)

#Augmented Dickey-Fuller Test
adf.test(VLKA_ts)

