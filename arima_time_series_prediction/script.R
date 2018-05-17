#Daily Closing prices of Major European Stock Indicies 1991 - 1998
ts_data <- EuStockMarkets[, 1]
opar <- par()
par(mfrow = c(1, 2))

#use type = additive for additive components
decompose_result <- decompose(ts_data, type = "multi")
plot(decompose_result)

decompose_result <- decompose(ts_data, type = "additive")
plot(decompose_result)

seasonal_trend_error <- stl(ts_data, s.window = "periodic")

par <- opar

seasonal_trend_error$time.series

#shifted 3 lag periods earlier. use -3 to shift the data forward.
lagged_ts <- lag(ts_data, 3)

install.packages("DataCombine")
library(DataCombine)

#create a data from with 1 lag and 1 lead
my_dataframe <- as.data.frame(ts_data)

#create lag 1 variable
my_dataframe <- slide(my_dataframe, "x", NewVar = "xLag1", slideBy = -1)

my_dataframe <- slide(my_dataframe, "x", NewVar = "xLead1", slideBy = 1)

head(my_dataframe)

#acf () generates plot by default
acf_res <- acf(AirPassengers) #autocorrelation
pacf_res <- pacf(AirPassengers)


plot(JohnsonJohnson)
trained_model <- lm(JohnsonJohnson ~ c(1:length(JohnsonJohnson)))
plot(resid(trained_model), type = "l")

#deseasonalise a time series
install.packages("forecast")
library(forecast)

#decompose the time series
ts_decompose <- stl(AirPassengers, "periodic")

#de-seasonalise the time series
ts_season_adjust <- seasadj(ts_decompose)
plot(AirPassengers, type = 'l')

plot(ts_season_adjust, type = 'l')

#seasonal frequency set as 12 for monthly data
par(mfrow = c(1, 1))
seasonplot(ts_season_adjust, 12, col = rainbow(12), year.labels = TRUE,
    main = "Season plot: Airpassengers")

library(tseries)

#p-value < 0.05 inidcates teh TS is stationary
adf.test(ts_data) # not stationary

kpss.test(ts_data) # Stationary


#Seasonal differencing
#number for seasonal differenceing needed
#if adf and kpss differ use differencing to idenfity the number of lags needed
nsdiffs(AirPassengers) #shows that 1 lag is needed to make the data stationary

#apply 1 seasonal difference
AirPassengers_seasdiff <- diff(AirPassengers, lag = frequency(AirPassengers), differences = 1)
?diff
plot(AirPassengers_seasdiff, type = 'l', main = "Seasonally differenced")

nsdiffs(AirPassengers_seasdiff)


#ARIMA - used for forecasting and predicting models
#data has to be stationary, we've done that above
#by removing trends and seasonality

#plot the time series and assess its stationary
library(tseries)
plot(Nile)

#identify the number of lags needed to 
ndiffs(Nile)


#plot the differenced time series
d_nile <- diff(Nile)
plot(d_nile)
ndiffs(d_nile)

#apply ADF test to find p-value to suggest it stationary

adf.test(d_nile)
kpss.test(d_nile)

#compare plots for acf and pacf 
par(mfrow = c(1, 2))
Acf(d_nile)
Pacf(d_nile)

#identifying the model manually
library(forecast)
fit <- Arima(Nile, order = c(0, 1, 1))
fit
accuracy(fit)

#qqnorm help evaluate the model
par(mfrow = c(1, 1))
qqnorm(fit$residuals)
qqline(fit$residuals)

#Testing auto-correlations
Box.test(fit$residuals, type = "Ljung-Box")

pred <- forecast(fit, 3)
plot(pred)

#let R define the model
fit <- auto.arima(Nile)
fit
accuracy(fit)

qqnorm(fit$residuals)
qqline(fit$residuals)

Box.test(fit$residuals, type = "Ljung-Box")

pred <- forecast(fit, 4)
plot(pred)