# ✈️ Utilizing Machine Learning to Forecast Passenger Satisfaction in the Airline Industry

This project explores how **machine learning algorithms** can be used to forecast passenger satisfaction within the **airline industry**.  
It was developed as part of the **Master’s Program in Data Analysis at Högskolan Dalarna University (Sweden)**, and focuses on applying **Python** and **R programming** for predictive analytics and data visualization.

---

## 🧠 Overview

The study examines how effectively airline passenger satisfaction can be predicted using machine learning models — particularly comparing the performance of the **Random Forest Classifier** with traditional models like **Decision Tree** and **Logistic Regression**.

Using a publicly available dataset from **Kaggle**, which includes over 129,000 records of passenger demographics, travel information, and service ratings, this project identifies the most influential factors that impact overall customer satisfaction.

---

## 🎯 Research Objectives

- Develop a predictive model to classify airline passengers as *Satisfied* or *Not Satisfied*  
- Evaluate and compare **Random Forest**, **Decision Tree**, and **Logistic Regression** models  
- Identify the **key features** influencing satisfaction using feature importance analysis  
- Assess performance using metrics such as **Accuracy**, **Precision**, **Recall**, **F1-score**, and **ROC-AUC**  
- Conduct **statistical testing (McNemar’s Test)** to confirm significance in performance differences  

---

## 🧰 Tools and Technologies

- **Languages:** Python, R  
- **Libraries:** pandas, numpy, matplotlib, seaborn, scikit-learn, caret  
- **Techniques:** Classification, Feature Engineering, Cross-validation, Statistical Testing  
- **Concepts Applied From Coursework:**  
  - Data Analysis and Visualization  
  - Data Warehousing  
  - GIS (Geographic Information Systems)

---

## 📊 Dataset

- **Source:** [Airline Customer Satisfaction – Kaggle (Ramin, 2024)](https://www.kaggle.com/datasets/raminhuseyn/airline-customer-satisfaction)  
- **Records:** 129,880  
- **Attributes:** 23 variables including demographics, travel type, class, and multiple service-related ratings (seat comfort, in-flight entertainment, Wi-Fi service, food, and cleanliness).

---

## ⚙️ Methodology

1. **Data Preprocessing:**  
   - Cleaned missing values and dropped negatively correlated features (e.g., Flight Distance, Gate Location).  
   - Encoded categorical variables using **One-Hot Encoding**.

2. **Model Training:**  
   - Split dataset into 80% training and 20% testing.  
   - Implemented and tuned:
     - Random Forest (n_estimators=100, max_depth=10)
     - Decision Tree (max_depth=5)
     - Logistic Regression (baseline model)

3. **Validation & Evaluation:**  
   - 5-Fold Stratified Cross-Validation  
   - Evaluated using accuracy, precision, recall, F1-score, ROC-AUC, and confusion matrix.  
   - Applied McNemar’s test to assess statistical significance between models.

---

## 🧩 Results

| Model | Accuracy | Precision | Recall | F1-Score | ROC-AUC |
|--------|-----------|------------|---------|-----------|----------|
| **Random Forest** | **92.9%** | 0.93 | 0.94 | 0.93 | **0.99** |
| Decision Tree | 87.6% | 0.85 | 0.89 | 0.87 | 0.95 |
| Logistic Regression | 82.0% | 0.82 | 0.81 | 0.82 | 0.90 |

- The **Random Forest Classifier** achieved the **highest accuracy (92.9%)** and demonstrated the best generalization with minimal overfitting.  
- **Key features influencing satisfaction:** Online boarding, Seat comfort, and In-flight entertainment.

---

## 📈 Insights

- **Random Forest** was the most reliable and statistically significant model.  
- Service-related features were found to be the **primary determinants of passenger satisfaction**, surpassing demographic factors.  
- The findings suggest that airlines can enhance customer satisfaction by improving **in-flight entertainment**, **seat comfort**, and **boarding experience**.

---

## 🔮 Future Improvements

- Test additional ensemble models such as **Gradient Boosting** and **XGBoost**  
- Apply **hyperparameter tuning** for model optimization  
- Integrate **real-time data** or **sentiment analysis** for dynamic feedback  
- Develop an **interactive dashboard** for visualization of results  

---

## 👨‍💻 Authors

**Puja Khadka** – Business Intelligence Program  
**Prayag Narasingh Rana** – Business Intelligence Program  
📍 *Högskolan Dalarna University, Borlänge, Sweden*  

📧 v24pujkh@du.se | v24prara@du.se  

---

⭐ *This project demonstrates how machine learning can enhance service quality and customer satisfaction strategies in the airline industry.*
