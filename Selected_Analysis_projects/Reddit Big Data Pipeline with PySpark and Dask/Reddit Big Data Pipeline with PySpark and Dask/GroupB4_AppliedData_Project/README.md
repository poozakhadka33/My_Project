# Reddit Big Data Pipeline

## Project Overview

This project demonstrates a distributed data pipeline for processing
Reddit comments at large scale. The pipeline ingests data from an API,
processes it using Apache Spark and Dask, and extracts insights such as
top subreddits and average comment scores.


## Data Source

The dataset is obtained from the Hugging Face API:

https://huggingface.co/api/datasets/fddemarco/pushshift-reddit-comments/parquet/default/train"

-   Format: Parquet\
-   Size: \~12 GB\
-   Access Method: REST API (returns signed URLs)

The pipeline automatically downloads the required files and as per our code it downloads the first 5 files. Data is not included in the repository due to size limitations.


## Features

-   Distributed processing with PySpark and Dask\
-   Data cleaning and validation\
-   Aggregation and ranking\
-   Parquet storage\
-   Deployment on Minikube (Kubernetes)


## Project Structure

project/ 
├── README.md #Setup instruction and datasets
├── requirements.txt
├── RedditBigDataPipeline.ipynb
├── Deployment.ipynb
├── data/#Dataset downloaded through api
├── output/#Generated 
├── logs/


## Setup Instructions

### Install dependencies

pip install -r requirements.txt

### Run notebook

jupyter notebook


## Minikube Deployment

1.  Start Minikube\
    minikube start --cpus=4 --memory=6144 --driver=docker

2.  Deploy Dask\
    helm repo add dask https://helm.dask.org/\
    helm repo update

helm install my-dask dask/dask\
--set scheduler.image.tag=2025.1.0\
--set worker.image.tag=2025.1.0\
--set scheduler.replicas=1\
--set worker.replicas=2\
--set jupyter.enabled=false

3.  Port forward\
    kubectl port-forward svc/my-dask-scheduler 8786:8786\
    kubectl port-forward svc/my-dask-scheduler 8787:80

Dashboard: http://localhost:8787



## Notes

-   Only one Parquet file is used during deployment to avoid memory
    issues\
-   Full dataset may cause out-of-memory errors on local machines



## Author

Group B4
