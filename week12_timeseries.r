#Week 12: Time Series Model:
#a) Plot the Time series data using R visualizations
# -------------------------------
# Week 12(a): Plot Time Series Data
# -------------------------------

# Load dataset
data(AirPassengers)  # Monthly Airline Passenger Numbers 1949-1960
ts_data <- AirPassengers

# View first few observations
head(ts_data)

# Plot Time Series
plot(ts_data,
     main = "Monthly Air Passengers (1949-1960)",
     ylab = "Passengers",
     xlab = "Year",
     col = "blue",
     lwd = 2)

# Add a seasonal plot
monthplot(ts_data,
          main = "Seasonal Plot of Air Passengers",
          ylab = "Passengers",
          xlab = "Month",
          col = "red",
          lwd = 2)



#b) Time series Forecasting using Exponential smoothing, ARIMA models.

# Load required package for forecasting
install.packages("forecast")
library(forecast)

# -------------------------------
# 1️⃣ Exponential Smoothing (Holt-Winters)
# -------------------------------
hw_model <- HoltWinters(ts_data)

# Forecast next 12 months
hw_forecast <- forecast(hw_model, h = 12)

# Plot forecast
plot(hw_forecast,
     main = "Holt-Winters Forecast of Air Passengers",
     ylab = "Passengers",
     xlab = "Year",
     col = "darkgreen")

# -------------------------------
# 2️⃣ ARIMA Model Forecasting
# -------------------------------
# Fit ARIMA model automatically
arima_model <- auto.arima(ts_data)


arima_forecast <- forecast(arima_model, h = 12)


plot(arima_forecast,
     main = "ARIMA Forecast of Air Passengers",
     ylab = "Passengers",
     xlab = "Year",
     col = "purple")
