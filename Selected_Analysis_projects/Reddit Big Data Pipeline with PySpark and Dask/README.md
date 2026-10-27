# Reddit Big Data Pipeline with PySpark and Dask

## Project Overview

This project implements a big-data processing pipeline for Reddit comments using **Python, Apache Spark (PySpark), and Dask**. It demonstrates large-scale data ingestion, validation, transformation, aggregation, logging, and Parquet storage.

The project also explores performance differences between Spark and Dask for common data-processing operations.

## Objectives

- Process tens of millions of Reddit comment records.
- Implement data-quality validation and filtering.
- Identify the most active subreddits and rank them by average comment score.
- Add logging, error handling, and basic resource monitoring.
- Store aggregated results in Parquet format.
- Compare Spark and Dask processing times.

## Technologies

- Python
- Apache Spark and PySpark
- Dask DataFrame
- Pandas and NumPy
- Parquet
- Requests
- Python logging and psutil
- Jupyter Notebook

## Dataset

The notebook downloads five Parquet files from the Pushshift Reddit Comments dataset hosted on Hugging Face.

**Dataset source:** [Pushshift Reddit Comments on Hugging Face](https://huggingface.co/datasets/fddemarco/pushshift-reddit-comments)

The pipeline selects three columns for its main processing workflow:

- `subreddit`: Name of the subreddit.
- `score`: Comment score.
- `created_utc`: Comment creation timestamp.

## Pipeline Architecture

1. **Data ingestion:** Retrieves Parquet file links and downloads the selected files.
2. **Data loading:** Loads the files into a PySpark DataFrame.
3. **Validation:** Removes records with missing subreddit or score values and filters records based on score.
4. **Transformation:** Converts Unix timestamps and filters positive-score records.
5. **Aggregation:** Calculates comment counts by subreddit and ranks subreddits by average score.
6. **Storage:** Writes aggregated datasets to Parquet files.
7. **Monitoring:** Records processing stages, execution times, row counts, and process memory usage.
8. **Benchmarking:** Compares selected Spark and Dask operations.

## Key Results

The saved notebook outputs report the following:

| Metric | Result |
|---|---:|
| Initial records loaded | 82,660,155 |
| Records after positive-score filtering | 74,962,882 |
| Records removed during validation | 7,697,273 |
| Subreddits in the main aggregation | 29,251 |
| Most frequent subreddit | AskReddit |
| AskReddit comment count | 10,114,987 |
| Recorded pipeline execution time | 85.54 seconds |

These are results recorded in the notebook, not independently reproduced benchmarks.

## Spark vs. Dask

The notebook records these execution times for selected operations:

| Operation | Spark | Dask |
|---|---:|---:|
| DataFrame creation / loading step | 8.14 s | 0.16 s |
| Positive-score filtering | 2.72 s | 4.48 s |
| Group-by aggregation | 7.17 s | 9.74 s |

**Benchmark limitation:** The loading measurements are not directly comparable because Dask can defer reading data until computation is triggered. The recorded timings should therefore be treated as preliminary observations, not a definitive performance ranking. The aggregation results also need reconciliation because the notebook reports different subreddit counts across the Spark and Dask paths.

## Reliability and Monitoring

The pipeline includes:

- Timestamped log files and console logging.
- A retry decorator for handling transient failures.
- A custom exception for empty-data checks.
- Basic row-count, execution-time, and process-memory monitoring.
- Parquet output for downstream processing.

## How to Run

### Prerequisites

- Python
- Java 17
- Jupyter Notebook
- Sufficient disk space and memory for large Parquet files

### Install dependencies

```bash
pip install pyspark "dask[dataframe]" pandas numpy requests psutil jupyter
```

### Run the notebook

1. Clone or download this repository.
2. Open `RedditBigDataPipeline.ipynb` in Jupyter Notebook.
3. Run the cells in sequence.
4. Allow the dataset files to download before processing begins.
5. Inspect the generated logs and Parquet outputs.

The notebook configures Spark with 8 GB of driver memory. Adjust this setting to match your available system resources.

## Limitations and Future Improvements

- Standardize data filtering between Spark and Dask.
- Benchmark equivalent actions using repeated runs and consistent timing methodology.
- Investigate discrepancies in unique subreddit counts.
- Improve empty-data handling and pipeline failure reporting.
- Optimize global ranking operations to avoid unnecessary single-partition processing.
- Add automated tests, configuration management, and a reproducible setup.
- Explore date-based trends and additional insights from comment activity.

## Skills Demonstrated

Big-data processing, PySpark DataFrames, Dask, data validation, aggregation, window functions, logging, error handling, performance measurement, and Parquet storage.
