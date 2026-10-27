# Storage Strategy Documentation
## Reddit Big Data Pipeline


## 1. Overview

This document outlines the storage strategy employed in the Reddit Big Data Pipeline, covering input data format, intermediate processing, output storage, and the rationale behind each choice.


## 2. Input Data Storage
- Format : Parquet
- Source : Hugging Face (Pushshift Reddit Comments Dataset)
- Total Size : 12GB
- Files : 5 Parquet files (0.parquet through 4.parquet)
- Rows : 82,660,155
- Access Method : REST API with signed URLs


## Why Parquet?
- Columnar storage enables reading only required columns (subreddit, score, created_utc), reducing I/O
- Built-in compression (Snappy) reduces storage footprint
- Schema preservation maintains data types across processing stages
- Spark optimization leverages Parquet's predicate pushdown for faster queries


## 3. Intermediate Storage
- Format : In-memory (Spark DataFrames)
- Location : Spark Executor Memory
- Duration : During pipeline execution only


## Why In-Memory?
- Pipeline processes data in a single batch and intermediate results are not needed between runs
- Avoids unnecessary disk I/O, improving performance
- Dataset (12GB) fits within allocated Spark memory (8GB driver + worker memory)
- No checkpointing required for this scale


## 4. Output Storage
- Format : Parquet
- Location : output/directory
- Files : top_subreddits/ and ranked_subreddits/ (Parquet directories)


## Why Parquet for Output?
- Consistent format : same as input, maintaining columnar benefits
- Compression : Snappy compression reduces storage size
- Schema preservation : maintains data types for future processing


## Output Schema:

| File | Columns | Description |
|------|---------|-------------|
| top_subreddits/ | subreddit, comment_count | Most active subreddits by comment volume |
| ranked_subreddits/ | subreddit, avg_score, rank | Subreddits ranked by average comment score |


## 5. Logging Storage
- Format : Plain Text Logs
- Location : logs/directory
- Naming: pipeline_YYYYMMDD_HHMMSS.log 


## Log Content:
- Timestamp of each pipeline stage
- Record counts before/after validation
- Memory usage metrics
- Execution time per stage
- Error traces (if any)
- Performance comparison between Spark and Dask



## 6. Storage Pipeline Flow

+-----------------+     +-----------------+     +-----------------+
|   INPUT DATA    |---->|   PROCESSING    |---->|   OUTPUT DATA   |
|   Parquet       |     |   In-Memory     |     |   Parquet       |
|   ~12 GB        |     |   Spark/Dask    |     |   Compressed    |
|   Hugging Face  |     |   DataFrames    |     |   output/       |
+-----------------+     +-----------------+     +-----------------+
                                 |
                                 v
                        +-----------------+
                        |     LOGS        |
                        |   Text Files    |
                        |   logs/         |
                        +-----------------+



## 7. Scalability Considerations

If scaling to 100GB+ or deploying to cloud:

1. Partition input data by date or subreddit for parallel processing
2. Use partitioned output (e.g., output/top_subreddits/year=2024/)
3. Implement checkpointing every 10M rows for fault tolerance
4. Store data in cloud object storage (AWS S3, Azure Blob, GCS)
5. Use column pruning to read only necessary columns
6. Optimize Spark shuffle partitions based on cluster size



## 8. File Structure

project/
├── data/                    # Input Parquet files (not in submission - instructions to download in code and readme file)
│   ├── 0.parquet
│   ├── 1.parquet
│   ├── 2.parquet
│   ├── 3.parquet
│   └── 4.parquet
├── output/                  # Results (Parquet)
│   ├── top_subreddits/
│   │   └── part-*.parquet
│   └── ranked_subreddits/
│       └── part-*.parquet
├── logs/                    # Pipeline execution logs
│   └── pipeline_*.log
└── docs/                    # Documentation
    └── storage_strategy.md  # This file

---

## 9. References

- Apache Parquet. (n.d.). Parquet Documentation. https://parquet.apache.org/
- Apache Spark. (n.d.). Spark SQL Guide. https://spark.apache.org/docs/latest/sql-data-sources-parquet.html
- fddemarco. (n.d.). Pushshift Reddit Comments Dataset. Hugging Face. https://huggingface.co/datasets/fddemarco/pushshift-reddit-comments

---

Author:
**Team:** B4