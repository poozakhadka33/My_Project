# Wine Quality Prediction and Clustering with Machine Learning

## Project Overview

How well can machine learning models predict wine quality from its chemical properties?

In this project, I explored wine quality data using classification and clustering techniques. The goal was to investigate whether measurable characteristics of red and white wines could help predict quality ratings, and to explore patterns within the combined dataset.

The project gave me practical experience in preparing data, comparing machine learning models, evaluating classification performance, and exploring unsupervised learning methods.

## Objectives

- Prepare and combine red and white wine datasets for analysis.
- Explore the relationship between wine characteristics and quality ratings.
- Train and compare classification models for predicting wine quality.
- Evaluate model performance using classification metrics.
- Apply clustering methods to explore patterns in the data.

## Dataset

The project uses red and white wine quality datasets containing physicochemical measurements and quality ratings.

The datasets are combined into one dataset, with an additional variable identifying wine type.

**Target variable:** Wine quality rating.

## Tools and Technologies

- **Python** — data preparation and analysis
- **pandas** — data manipulation
- **scikit-learn** — machine learning, model selection, and evaluation
- **Matplotlib and Seaborn** — data visualization
- **Jupyter Notebook** — analysis and experimentation

## Methodology

### 1. Data Preparation

- Loaded the red and white wine datasets.
- Combined them into a single dataset.
- Added a variable to distinguish red wine from white wine.
- Prepared the features and target variable for modelling.
- Split the data into training and testing sets while preserving the distribution of quality classes.

### 2. Classification Models

I explored three classification algorithms:

- **Decision Tree** — a tree-based model that learns decision rules from the data.
- **Random Forest** — an ensemble of decision trees designed to improve predictive performance.
- **Support Vector Machine (SVM)** — a model that learns decision boundaries between classes.

Grid search and cross-validation were used to explore model hyperparameters and support model comparison.

### 3. Model Evaluation

The models were evaluated using classification reports, confusion matrices, and accuracy scores. These measures help assess how well the models predict wine quality and where they have difficulty distinguishing between classes.

The analysis also highlights the challenge of predicting less frequent quality ratings when most observations belong to a smaller number of classes.

### 4. Clustering

I also experimented with two unsupervised learning methods:

- K-Means clustering
- Agglomerative hierarchical clustering

Silhouette scores were calculated to examine how well the resulting clusters were separated.

**Important:** The clustering evaluation is still being refined. The current notebook includes wine type among the clustering features and compares cluster labels directly with wine type. These comparisons should not be treated as reliable accuracy measures because cluster labels are arbitrary. A more appropriate analysis would standardize the chemical features, exclude the wine type and quality labels from clustering, and use suitable clustering evaluation metrics.

## Key Learnings

Through this project, I gained experience in:

- Preparing and combining datasets for machine learning.
- Training and tuning multiple classification algorithms.
- Using cross-validation to compare model configurations.
- Evaluating classification results beyond accuracy alone.
- Understanding class imbalance and the difficulty of predicting less common categories.
- Exploring clustering and recognizing the importance of appropriate feature selection and evaluation.

## Limitations and Future Improvements

- Improve the notebook's reproducibility by replacing local file paths with relative paths and clear dataset download instructions.
- Standardize features where required, particularly for SVM and distance-based clustering.
- Review the quality-label preprocessing and document any changes to the original ratings.
- Improve clustering evaluation using appropriate features and metrics.
- Add a clear comparison table showing the final test-set results for all classification models.

## Repository Contents

- `wine_quality_analysis.ipynb` — Jupyter Notebook containing data preparation, model training, evaluation, and clustering experiments.
- `README.md` — Project overview, methodology, and findings.
- `requirements.txt` — Python dependencies, if included.

## Conclusion

This project demonstrates my practical exploration of classification and clustering using Python and scikit-learn. It helped me understand the full workflow from preparing structured data to training models, evaluating predictions, and critically reviewing analytical results.

The project is part of my Data Science portfolio and reflects my interest in using data analysis and machine learning to investigate real-world questions.

---

*Project completed as part of my data science learning and experimentation.*
