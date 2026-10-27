# Load necessary libraries
library(dplyr)
library(ggplot2)

# Set parameters for the simulation
set.seed(123)  # For reproducibility
num_days <- 365  # Number of days for simulation
total_spots <- 200  # Initial number of parking spots
avg_stay <- 150  # Average stay time in minutes
arrival_rate_morning <- 90  # Cars per hour for 07:30-10:30
arrival_rate_afternoon <- 60  # Cars per hour for 10:30-14:00

# Define times for tracking occupancy
tracking_times <- seq(660, 900, by = 60)  # From 11:00 (660 mins) to 15:00 (900 mins)

# Function to generate arrivals for a specific period
generate_arrivals <- function(rate, start_minute, end_minute) {
  arrival_times <- numeric(0)
  current_time <- start_minute
  while (current_time < end_minute) {
    inter_arrival_time <- rexp(1, rate / 60)  # Exponential time between arrivals
    current_time <- current_time + inter_arrival_time
    if (current_time < end_minute) {
      arrival_times <- c(arrival_times, current_time)
    }
  }
  return(arrival_times)
}

# Function to generate stay times using a Geometric distribution
generate_stays <- function(num_cars, avg_stay) {
  rgeom(num_cars, prob = 1 / avg_stay) * 60  # Convert to minutes
}

# Simulate occupancy for each day and calculate results
occupancy_results <- matrix(0, nrow = num_days, ncol = length(tracking_times))

for (day in 1:num_days) {
  # Simulate car arrivals and departures
  morning_arrivals <- generate_arrivals(arrival_rate_morning, 450, 630)  # 07:30-10:30
  afternoon_arrivals <- generate_arrivals(arrival_rate_afternoon, 630, 840)  # 10:30-14:00
  all_arrivals <- sort(c(morning_arrivals, afternoon_arrivals))
  num_arrivals <- length(all_arrivals)
  stay_times <- generate_stays(num_arrivals, avg_stay)
  departures <- all_arrivals + stay_times
  
  # Create a vector to track parking lot status
  parking_lot <- numeric(total_spots)
  
  # Calculate occupancy at each tracking time
  for (t in seq_along(tracking_times)) {
    current_time <- tracking_times[t]
    parking_lot <- departures[departures > current_time]  # Only cars still parked
    occupancy_rate <- length(parking_lot) / total_spots
    occupancy_results[day, t] <- occupancy_rate
  }
}

# Convert to a data frame for visualization
occupancy_df <- data.frame(
  Day = rep(1:num_days, each = length(tracking_times)),
  Time = rep(tracking_times, num_days),
  OccupancyRate = as.vector(t(occupancy_results))
)

occupancy_df$Time <- as.POSIXct(occupancy_df$Time * 60, origin = "1970-01-01", tz = "UTC")

# Plot the time series of the occupancy rate
ggplot(occupancy_df, aes(x = Time, y = OccupancyRate, group = Day)) +
  geom_line(alpha = 0.3) +
  labs(title = "Daily Occupancy Rate from 11:00 to 15:00", x = "Time", y = "Occupancy Rate") +
  theme_minimal()


# Improve the visualization of the occupancy data
ggplot(occupancy_df, aes(x = Time, y = OccupancyRate, color = as.factor(Day))) +
  geom_line(alpha = 0.2) +  # Use a low alpha for better visualization of individual lines
  scale_color_viridis_d(option = "plasma", guide = "none") +  # Use a color palette for better differentiation
  geom_smooth(aes(group = 1), method = "loess", color = "blue", se = FALSE, linetype = "dashed", size = 1) +  # Add a trend line
  labs(
    title = "Daily Occupancy Rate from 11:00 to 15:00",
    x = "Time",
    y = "Occupancy Rate",
    subtitle = "Each line represents a day's occupancy rate; dashed line shows the average trend"
  ) +
  scale_x_datetime(date_labels = "%H:%M", date_breaks = "1 hour") +  # Format the x-axis for better readability
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )




