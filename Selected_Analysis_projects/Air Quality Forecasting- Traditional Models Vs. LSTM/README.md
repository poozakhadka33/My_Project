# Air Quality Forecasting: LSTM vs. Traditional Time-Series Models

## Overview

How far ahead can air pollution be forecast reliably, and does deep learning always outperform traditional statistical methods?

I investigated these questions by building and comparing four forecasting approaches for hourly air pollutant concentrations: **SARIMA, Holt-Winters, Vector Autoregression (VAR), and Long Short-Term Memory (LSTM)**.

The goal was to determine which methods produced the most accurate and consistent forecasts over horizons ranging from 1 to 72 hours. Rather than assuming that a more complex model would perform better, I evaluated the models under a consistent rolling-window forecasting framework and compared both prediction errors and their variability.

## Why This Matters

Air pollution levels change with daily cycles, weather conditions, emissions, and other environmental factors. Reliable short-term forecasts can help inform air-quality monitoring, environmental planning, and early-warning decisions.

However, forecasting performance is not just about achieving low error on average. A model also needs to produce reasonably consistent results as conditions change and the forecast horizon increases.

This project explored that trade-off between **accuracy, stability, and model complexity**.

## What I Did

### 1. Prepared the Air Quality Data

Worked with hourly observations from the Belisario monitoring station in Quito, Ecuador, using data from September 2023 to August 2024.

The dataset included five pollutants:

- Nitrogen dioxide (NO₂)
- Sulfur dioxide (SO₂)
- Carbon monoxide (CO)
- Ozone (O₃)
- Fine particulate matter (PM₂.₅)

I developed a preprocessing workflow to handle missing observations, corrupted values, negative pollutant concentrations, and extreme outliers. I also used time-series decomposition and imputation techniques to prepare the data for forecasting.

### 2. Built and Compared Four Forecasting Models

I evaluated four approaches to understand how different modelling assumptions affect forecast quality.

- **SARIMA:** Captures autocorrelation and recurring seasonal patterns.
- **Holt-Winters:** Models trend and seasonality using exponential smoothing.
- **VAR:** Models relationships between multiple pollutant time series.
- **LSTM:** Uses a recurrent neural network to learn temporal patterns in sequential data.

For LSTM, I used a 48-hour look-back window and an iterative forecasting approach to generate predictions up to 72 hours ahead.

### 3. Evaluated Forecast Accuracy and Reliability

I used a rolling-window framework to evaluate forecasts across different time periods and forecast horizons.

The main evaluation metric was **Root Mean Squared Error (RMSE)**. I also calculated the standard deviation of RMSE across rolling windows to examine how consistent each model's performance was.

This helped distinguish models that achieved lower average errors from those whose predictions varied more substantially across evaluation windows.

### 4. Interpreted the Results

I compared forecast performance across all five pollutants and examined how errors and uncertainty changed over the 72-hour forecasting horizon.

The analysis focused on identifying which models provided the most reliable results under the available data conditions, rather than selecting a model based on complexity alone.

## Key Findings

The results challenged the expectation that LSTM would outperform traditional statistical models.

| Model | Average RMSE | RMSE Standard Deviation |
|---|---:|---:|
| VAR | 6.64 | 5.46 |
| SARIMA | 6.68 | 5.48 |
| Holt-Winters | 7.55 | 5.78 |
| LSTM | 8.86 | 7.09 |

*Values are taken from the model comparison in the project report. RMSE is calculated in each pollutant's original measurement units, so the aggregate values should be interpreted in the context of the report's evaluation methodology.*

The main findings were:

- **VAR achieved the lowest average RMSE**, with SARIMA performing almost as well.
- **Traditional models were more consistent** across rolling evaluation windows.
- LSTM captured temporal patterns but showed greater variability and increasing forecasting error at longer horizons.
- Holt-Winters provided a useful middle ground, particularly for pollutant series with recurring daily patterns.
- The limited one-year observation period may have constrained LSTM's ability to learn longer-term dependencies.

The outcome demonstrated that a more complex model is not automatically the best choice. Data volume, temporal patterns, forecasting horizon, and model stability all matter.

## Tools and Techniques

- **Python** — data preparation, modelling, and evaluation
- **pandas and NumPy** — data manipulation and numerical analysis
- **Statsmodels** — SARIMA, VAR, Holt-Winters, and time-series analysis
- **TensorFlow/Keras** — LSTM neural network
- **scikit-learn** — preprocessing and imputation utilities
- **Matplotlib** — visual comparison of forecast errors and variability
- **Time-series methods** — rolling-window evaluation, seasonal decomposition, and RMSE analysis

## Skills Demonstrated

- Data cleaning and preprocessing
- Time-series forecasting
- Statistical and deep-learning model comparison
- Multivariate time-series analysis
- Feature scaling and missing-data handling
- Model evaluation using RMSE
- Forecast stability and uncertainty analysis
- Interpreting results and communicating analytical findings

## Limitations and Next Steps

The experiment used one year of hourly data and pollutant-only inputs for the forecasting models. This limited the amount of historical information available to learn longer-term patterns.

Potential improvements include:

- Evaluating models on multiple years of data.
- Incorporating weather variables and time-based features.
- Investigating hybrid forecasting approaches.
- Exploring additional methods for quantifying prediction uncertainty.
- Testing performance across different seasons and environmental conditions.

These improvements would help establish whether more complex models offer a meaningful advantage when more historical context and relevant explanatory variables are available.

## Project Takeaway

This investigation strengthened my ability to turn a forecasting question into a systematic analytical comparison: prepare real-world data, build multiple models, evaluate them consistently, investigate uncertainty, and use the results to make evidence-based conclusions.

**The key lesson:** the most useful model is not necessarily the most complex one, but the one that performs reliably for the problem and data available.
