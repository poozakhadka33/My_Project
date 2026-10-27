# NYC Taxi Data Processing with Apache Spark

## Project Overview

This project explores the January 2024 NYC Yellow Taxi trip dataset using **Python and PySpark**. It demonstrates how distributed data processing techniques can be applied to large, structured datasets to perform filtering, aggregation, and exploratory analysis efficiently.

The notebook processes approximately **2.96 million taxi trips** and explores trip activity, fare information, passenger counts, payment methods, and pickup locations.

## Objectives

- Process large datasets using Apache Spark.
- Apply RDD and DataFrame transformations and aggregations.
- Analyze taxi trip activity and fare-related metrics.
- Understand Spark partitions, lazy evaluation, and shuffle operations.
- Explore caching and execution plans.
- Write and read analytical data using Parquet.

## Tools and Technologies

- **Language:** Python
- **Big Data Processing:** Apache Spark, PySpark
- **Data Storage:** Parquet
- **Analysis:** PySpark SQL and DataFrame API
- **Environment:** Jupyter Notebook

## Dataset

The project uses the January 2024 NYC Yellow Taxi trip dataset published by the New York City Taxi and Limousine Commission (TLC).

The dataset includes trip timestamps, passenger counts, trip distances, pickup and drop-off location IDs, fare amounts, tips, total charges, and payment types.

Source: [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

## Methodology

### 1. Data Loading and Exploration
- Loaded the Parquet dataset into a Spark DataFrame.
- Examined the schema, records, and partition distribution.
- Explored partitioning and parallel processing.

### 2. Data Processing and Aggregation
- Filtered trips based on passenger counts, distances, and payment types.
- Calculated total trip revenue and average tip percentage.
- Identified the most frequently used pickup location.
- Calculated average fare per mile for selected trips.
- Analyzed trip counts by hour of day.

### 3. Spark Performance Concepts
- Compared RDD operations with DataFrame operations.
- Examined lazy evaluation and the execution plan.
- Explored narrow and wide transformations and their associated shuffle behavior.
- Investigated caching and DataFrame reuse.

### 4. Data Export
- Filtered trips from January 1, 2024.
- Exported the results to Parquet.
- Read the exported data back into Spark for verification.

## Key Results

The notebook produced the following results:

- **Total trips processed:** 2,964,624
- **Total recorded trip revenue:** $79,456,384.28
- **Trips with more than four passengers:** 55,919
- **Average tip percentage for eligible credit-card trips:** 28.70%
- **Trips recorded on January 1, 2024:** 81,013
- **Trips with total charges above $100:** 39,976

These figures reflect the notebook's calculations and have not been independently validated.

## Skills Demonstrated

PySpark DataFrames, RDDs, data filtering, aggregation, partitioning, lazy evaluation, shuffle operations, execution plans, caching concepts, and Parquet data processing.

## How to Run

1. Install Python, Java 17, and Jupyter Notebook.
2. Install PySpark:

   ```bash
   pip install pyspark jupyter
   ```

3. Open the notebook in Jupyter.
4. Run the cells in sequence. The notebook downloads the January 2024 taxi dataset when it is not already present.

A local Spark environment with sufficient memory is recommended.

## Future Improvements

- Add systematic data-quality checks and handle invalid records.
- Investigate fare and trip patterns across pickup zones and times.
- Compare Spark execution performance under different configurations.
- Create visualizations and actionable business recommendations.
- Develop an interactive dashboard to communicate the findings.

