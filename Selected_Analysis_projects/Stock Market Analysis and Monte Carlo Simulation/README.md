# Stock Market Risk Analysis and Monte Carlo Simulation

## Project Overview

How can historical stock market data help us understand price movements, market relationships, and investment risk?

This project uses historical stock prices to explore stock returns, compare the behaviour of different companies, visualize price volatility, and simulate possible future price paths. The analysis combines financial data processing, statistical analysis, visualization, and Monte Carlo simulation using Python.

The goal was to understand how historical market behaviour can support risk analysis and demonstrate how data analytics techniques can be applied to financial datasets.

## Objectives

- Analyse historical stock prices and daily log returns.
- Compare the average returns and volatility of different companies.
- Visualize price movements using Bollinger Bands.
- Explore relationships between companies through return correlations.
- Simulate possible future stock prices using Monte Carlo methods.
- Explore a simple moving-average trading signal.

## Tools and Technologies

- **Python**
- **pandas** — data loading and manipulation
- **NumPy** — numerical calculations and simulation
- **Matplotlib** — charts and visualizations
- **ta** — Bollinger Bands technical indicator
- **Jupyter Notebook** — analysis workflow

## Project Workflow

### 1. Data Preparation

Loaded historical stock-price data from an Excel workbook, organized the data by company, sorted observations by date, and prepared closing prices for analysis.

### 2. Returns and Volatility Analysis

Calculated daily log returns using closing prices. Summary statistics were used to compare average returns and the variability of returns across the available companies.

### 3. Bollinger Bands

Calculated 20-day Bollinger Bands for Microsoft to visualize price movements relative to a rolling average and measure of recent variability.

### 4. Correlation Analysis

Created a correlation matrix of company log returns to explore how the selected stocks moved in relation to one another.

### 5. Monte Carlo Simulation

Generated simulated Microsoft stock-price paths over a four-year horizon using historical mean and standard deviation of log returns. The simulation used 300 paths and a fixed random seed for reproducibility.

These paths illustrate a range of possible outcomes under the model's assumptions; they are scenarios, not reliable predictions of actual future prices.

### 6. Moving-Average Strategy Exploration

Explored a trading signal based on whether the closing price was above or below its 20-day simple moving average. This was an initial strategy experiment, not a validated trading backtest.

## Key Learning Outcomes

- Calculating and interpreting log returns from financial time-series data.
- Comparing average returns and volatility across stocks.
- Using technical indicators to visualize price behaviour.
- Applying correlation analysis to financial datasets.
- Using Monte Carlo simulation to explore uncertainty in future price paths.
- Recognizing the assumptions and limitations of statistical models applied to financial markets.

## Limitations and Future Improvements

This project is an exploratory analysis rather than a complete investment or risk-management system.

Potential improvements include:

- Replacing local file paths with reproducible data-loading instructions.
- Verifying the company names and completeness of the dataset.
- Improving the moving-average strategy by calculating actual strategy returns, including transaction costs, and comparing results with a buy-and-hold benchmark.
- Evaluating simulation assumptions and comparing simulated outcomes with historical observations.
- Adding risk measures such as maximum drawdown and Value at Risk (VaR).

## How to Run

1. Download or provide the historical stock-price Excel workbook expected by the notebook.
2. Install the required Python libraries.
3. Update the notebook's file path to point to your workbook.
4. Run the notebook cells in order.

Install the main dependencies with:

```bash
pip install pandas numpy matplotlib ta openpyxl jupyter
```

## Project Context

This project was completed as part of my data analysis and risk analysis learning. It demonstrates my practical use of Python for financial data preparation, statistical exploration, visualization, and simulation.

**Note:** The analysis depends on the structure and contents of the original Excel workbook. The results should not be interpreted as financial advice or evidence of a profitable trading strategy.
