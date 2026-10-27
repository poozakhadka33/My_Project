# Parking Lot Occupancy Simulation and Analysis in R

## Project Overview

How can simulation help us understand parking demand and plan parking capacity throughout the day?

This project explores parking lot occupancy using a simulation built in R. It models vehicle arrivals and parking durations over 365 simulated days, then visualizes occupancy patterns at hourly intervals between 11:00 and 15:00.

The project demonstrates how statistical distributions, simulation, and data visualization can be used to investigate an operational problem: understanding how parking demand may affect the use of available parking spaces.

## Objectives

- Simulate vehicle arrivals during morning and afternoon periods.
- Model parking durations using a probability distribution.
- Explore parking occupancy at different times of day.
- Visualize daily occupancy patterns across simulated days.
- Use trend lines to help interpret variation in the simulated data.

## Tools and Technologies

- **R** — statistical computing and simulation
- **dplyr** — data manipulation
- **ggplot2** — data visualization
- **Probability distributions** — modelling arrival intervals and parking durations

## Methodology

### 1. Simulation Setup

Defined the main simulation parameters:

- Simulation period: 365 days
- Parking capacity: 200 spaces
- Morning arrival rate: 90 cars per hour
- Afternoon arrival rate: 60 cars per hour
- Average parking duration parameter: 150

These values are assumptions used by the simulation rather than measurements from a real parking facility.

### 2. Vehicle Arrival Modelling

Generated vehicle arrival times using an exponential distribution to represent the time between arrivals during the specified periods.

### 3. Parking Duration Modelling

Used a geometric distribution to generate parking durations for simulated vehicles. These durations determine when vehicles are expected to leave the parking facility.

### 4. Occupancy Analysis

Recorded simulated occupancy at hourly intervals from 11:00 to 15:00 and organized the results into a data frame for analysis.

### 5. Data Visualization

Created line charts using ggplot2 to explore variation in occupancy across simulated days. A smoothed trend line was also added to help visualize the overall pattern.

## Key Learning Outcomes

- Applying probability distributions to model real-world processes.
- Building a simulation workflow in R.
- Organizing simulated results into analysis-ready data.
- Creating time-based visualizations with ggplot2.
- Understanding how modelling assumptions influence analytical results.

## Limitations and Future Improvements

This project is an initial simulation and requires further validation before its occupancy estimates can be interpreted as reliable results.

Planned improvements include:

- Correctly counting vehicles that have arrived and have not yet departed at each observation time.
- Ensuring parking-duration units are consistent with the stated average stay.
- Checking that simulated occupancy cannot exceed the available parking capacity without explicitly modelling overflow or rejected arrivals.
- Calculating average occupancy, peak occupancy, and the proportion of time the facility is near capacity.
- Comparing scenarios with different arrival rates, parking durations, and numbers of spaces.
- Validating model assumptions against real parking data, if available.

## How to Run

1. Install R.
2. Install the required packages:

```r
install.packages(c("dplyr", "ggplot2", "viridis"))
```

3. Open the `.R` script in RStudio.
4. Run the script to generate the simulation and visualizations.

## Project Context

This project was developed as part of risk analysis and simulation coursework. It demonstrates my interest in applying statistical methods and visualization to practical operational questions.

**Note:** The simulation uses assumed inputs and should not be treated as a forecast of actual parking demand. Occupancy calculations and time-unit consistency should be corrected before interpreting the results.
