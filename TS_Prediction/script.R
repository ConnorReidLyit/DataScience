install.packages("forecast")
install.packages("tseries")
library(forecast)
library(tseries)

ts_data <- read.csv("CA3_TS_Data.csv", stringsAsFactors = FALSE)
str(ts_data)

opar <- par()
par(mfrow = c(1, 1))

ts_data$Dates <- as.Date(ts_data$Dates, format = "%d/%m/%Y")
ts_data <- ts_data[, -2]
ts_tbl <- ts(table(ts_data), frequency = 12)
plot(ts_tbl)


decompose_result <- decompose(ts_tbl, type = "multi")
plot(decompose_result)

decompose_result <- decompose(ts_tbl, type = "additive")

#seasonal_trend_error <- stl(ts_tbl, s.window = "periodic")
monthplot(ts_tbl)

plot(forecast(HoltWinters(ts_tbl), 10))
acf(ts_tbl)
pacf(ts_tbl)


adf.test(ts_tbl)
kpss.test(ts_tbl)

ndiffs(ts_tbl)
plot(ts_tbl)

d_ts <- diff(ts_tbl)
plot(d_ts)
ndiffs(d_ts)



fit <- auto.arima(d_ts)
accuracy(fit)

qqnorm(fit$residuals)
qqline(fit$residuals)

library(forecast)
Box.test(fit$residuals, type = "Ljung-Box")
pred <- forecast(fit, 20)
plot(pred)
