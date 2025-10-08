# ✈️ Utilizing Machine Learning to Forecast Passenger Satisfaction in the Airline Industry

This project investigates how **machine learning algorithms** can predict airline passenger satisfaction levels using service and demographic data.  
Developed as part of the **Master’s Program in Data Analysis** at **Högskolan Dalarna University, Sweden**, this study compares multiple machine learning models to determine which best predicts passenger satisfaction.

---

## 🧠 Project Overview

The goal of this project is to analyze airline passenger data and determine whether **Random Forest** performs better than other traditional classification models — namely **Decision Tree** and **Logistic Regression** — in predicting customer satisfaction.  

The project also identifies the **key service-related features** that most influence satisfaction, helping airlines improve their service quality and overall customer experience.

---

## 🎯 Research Questions

1. How effectively can airline passenger satisfaction be predicted using the **Random Forest** model?  
2. Which features have the greatest impact on predicting passenger satisfaction?

---

## 🛠️ Tools and Technologies

- **Programming Language:** Python  
- **Libraries Used:** pandas, numpy, scikit-learn, matplotlib, seaborn  
- **Techniques:** Supervised Machine Learning, Classification, Feature Importance Analysis  
- **Validation Method:** Stratified 5-Fold Cross Validation  
- **Statistical Test:** McNemar’s Test for model comparison  

---

## 📊 Dataset

- **Source:** [Kaggle – Airline Passenger Satisfaction Dataset (Ramin, 2024)](https://www.kaggle.com/datasets/raminhuseyn/airline-customer-satisfaction)  
- **Records:** 129,880  
- **Attributes:** 23 variables including passenger demographics, flight characteristics, and ratings for various service aspects such as seat comfort, online boarding, in-flight entertainment, and cabin service.  

During preprocessing:
- Missing values were handled  
- Negatively correlated features (e.g., flight distance, gate location, arrival delay) were removed  
- Categorical variables (e.g., customer type, class, satisfaction) were encoded numerically  

---

## ⚙️ Methodology

### 1. Data Preprocessing
- Cleaned and encoded data to make it suitable for model training.  
- Converted categorical variables into numerical form using one-hot encoding.

### 2. Model Development
Three machine learning models were developed and compared:
- **Random Forest Classifier** – ensemble-based model tuned with `n_estimators=100`, `max_depth=10`  
- **Decision Tree Classifier** – simple tree model with `max_depth=5`  
- **Logistic Regression** – baseline linear classifier  

### 3. Evaluation
Models were evaluated using:
- Accuracy  
- Precision  
- Recall  
- F1-Score  
- ROC-AUC Score  
- Confusion Matrix  
- McNemar’s Test for statistical significance  

---

## 🧩 Results Summary

| Model | Accuracy | Precision | Recall | F1-Score | ROC-AUC |
|--------|-----------|------------|---------|-----------|----------|
| **Random Forest** | **92.9%** | 0.93 | 0.94 | 0.93 | **0.99** |
| Decision Tree | 87.6% | 0.85 | 0.89 | 0.87 | 0.95 |
| Logistic Regression | 82.0% | 0.82 | 0.81 | 0.82 | 0.90 |

- The **Random Forest Classifier** achieved the **highest accuracy (92.9%)** and best performance across all metrics.  
- Key influential features included **Online Boarding**, **Seat Comfort**, and **In-flight Entertainment**.  
- Statistical testing confirmed Random Forest’s performance was **significantly superior** (p < 0.05).

---

## 📈 Key Insights

- Service quality factors (especially comfort and in-flight experience) are the strongest predictors of satisfaction.  
- Random Forest provides robust and accurate classification with minimal overfitting.  
- The approach can help airlines identify areas needing improvement to enhance customer experience.  

---

## 🔮 Future Work

- Test additional ensemble algorithms such as **Gradient Boosting** and **XGBoost**  
- Perform **hyperparameter optimization** for even higher accuracy  
- Visualize model results in an interactive dashboard  
- Extend the dataset with new customer feedback attributes  

---

## 👨‍💻 Authors

**Puja Khadka**  
**Prayag Narasingh Rana**  
📍 *Business Intelligence Program, Högskolan Dalarna University, Borlänge, Sweden*  

📧 v24pujkh@du.se | v24prara@du.se  

---

⭐ *This project demonstrates how machine learning techniques—particularly Random Forest—can be effectively applied to forecast passenger satisfaction and derive actionable insights for service improvement in the airline industry.*
