

# Load libraries
library(readxl)  # For reading Excel files
library(dplyr)   # For data manipulation
library(ggplot2) # For plotting
library(TTR)     # For Bollinger Bands

# Define the path to the Excel file
excel_path <- "C:/Users/User/Downloads/Historical prices.xlsx"

# Get the sheet names from the Excel file
sheet_names <- excel_sheets(excel_path)

# Initialize a list to store data from each sheet
data_list <- list()
# Loop through each sheet, load the data, and calculate log returns
for (sheet in sheet_names) {
  # Load the data and ensure it's sorted by date
  data <- read_excel(excel_path, sheet = sheet) %>%
    arrange(Date)
  
  # Calculate log returns using 'Close' prices
  data <- data %>%
    mutate(log_return = log(Close / lag(Close)))
  
  # Store the processed data in the list
  data_list[[sheet]] <- data
}

# Calculate the mean of log returns for each sheet
mean_log_returns <- data.frame(Sheet = character(), Mean_Log_Return = numeric())

for (sheet in sheet_names) {
  mean_return <- mean(data_list[[sheet]]$log_return, na.rm = TRUE)
  mean_log_returns <- rbind(mean_log_returns, data.frame(Sheet = sheet, Mean_Log_Return = mean_return))
}

print("Mean Log Returns:")
print(mean_log_returns)
# Calculate the standard deviation of log returns for each sheet
sd_log_returns <- data.frame(Sheet = character(), SD_Log_Return = numeric())

for (sheet in sheet_names) {
  sd_return <- sd(data_list[[sheet]]$log_return, na.rm = TRUE)
  sd_log_returns <- rbind(sd_log_returns, data.frame(Sheet = sheet, SD_Log_Return = sd_return))
}

print("Standard Deviation of Log Returns:")
print(sd_log_returns)
# Combine mean and standard deviation into a single data frame
performance_summary <- inner_join(mean_log_returns, sd_log_returns, by = "Sheet")

print("Performance Summary (Mean and SD of Log Returns):")
print(performance_summary)
# Use data from the first sheet for Bollinger Bands (e.g., 'Sheet1')
data_example <- data_list[["Sheet1"]]

# Calculate Bollinger Bands
bb <- BBands(data_example$Close, n = 20, sd = 2)

# Add the Bollinger Bands to the data
data_example <- cbind(data_example, bb)

# Plot the Bollinger Bands
ggplot(data_example, aes(x = Date)) +
  geom_line(aes(y = Close), color = "blue") +
  geom_ribbon(aes(ymin = dn, ymax = up), fill = "gray", alpha = 0.3) +
  ggtitle("Bollinger Bands (Sheet1)") +
  xlab("Date") + ylab("Close Price") + theme_minimal()
# Create a data frame with log returns for all sheets
log_returns <- data.frame(Date = data_list[[1]]$Date)  # Start with dates

for (sheet in sheet_names) {
  log_returns[[sheet]] <- data_list[[sheet]]$log_return
}

# Calculate the correlation matrix of log returns
cor_matrix <- cor(log_returns[, -1], use = "complete.obs")  # Exclude Date column

print("Correlation Matrix:")
print(cor_matrix)
set.seed(123)  # For reproducibility
n_days <- 365 * 4  # 4 years
n_sim <- 300  # Number of simulations

# Get mean and SD of log returns from the first sheet (Sheet1)
mu <- mean(data_list[["Sheet1"]]$log_return, na.rm = TRUE)
sigma <- sd(data_list[["Sheet1"]]$log_return, na.rm = TRUE)
last_price <- tail(data_list[["Sheet1"]]$Close, 1)  # Last known price

# Perform Monte Carlo simulation
simulations <- replicate(n_sim, {
  prices <- numeric(n_days)
  prices[1] <- last_price
  for (t in 2:n_days) {
    growth_rate <- exp(rnorm(1, mean = mu, sd = sigma))
    prices[t] <- prices[t - 1] * growth_rate
  }
  return(prices)
})

# Plot the first few simulations
matplot(simulations[, 1:5], type = "l", lty = 1, col = 1:5,
        main = "Monte Carlo Simulations", xlab = "Days", ylab = "Price")
# Define a simple SMA trading strategy
sma_strategy <- function(prices, n = 20) {
  sma <- SMA(prices, n = n)
  signals <- ifelse(prices > sma, 1, -1)  # 1 = Buy, -1 = Sell
  return(signals)
}

# Apply the strategy to the first simulation
sim_prices <- simulations[, 1]  # First simulation prices
signals <- sma_strategy(sim_prices)

# Calculate cumulative returns
cumulative_returns <- cumsum(signals)

# Plot cumulative returns
plot(cumulative_returns, type = "h", main = "Cumulative Returns for SMA Strategy",
     xlab = "Days", ylab = "Cumulative Return")
# Check if 'cumulative_returns' has NA or Inf values
print(cumulative_returns)

# Remove any NA or infinite values from cumulative_returns
cumulative_returns <- cumulative_returns[is.finite(cumulative_returns)]

print(sim_prices)  # Check if the simulation prices are valid
# Define a revised SMA strategy that handles NA values gracefully
sma_strategy <- function(prices, n = 20) {
  sma <- SMA(prices, n = n)
  signals <- ifelse(!is.na(sma) & prices > sma, 1, -1)  # Handle NA values
  signals[is.na(signals)] <- 0  # Replace remaining NA signals with 0
  return(signals)
}

# Apply the strategy to the first simulation
signals <- sma_strategy(sim_prices)

# Check the signals to ensure they are valid
print(signals)  # Ensure it contains valid -1, 0, or 1 values
# Calculate cumulative returns
cumulative_returns <- cumsum(signals)

# Print cumulative returns to check if they are valid
print(cumulative_returns)
# Check if cumulative returns contain valid values
if (all(is.na(cumulative_returns))) {
  cat("No valid cumulative returns to plot.\n")
} else {
  # Plot the cumulative returns
  plot(cumulative_returns, type = "h", main = "Cumulative Returns for SMA Strategy",
       xlab = "Days", ylab = "Cumulative Return")
}


