# ❄️ Clustering Analysis of Cocaine Abuse Patterns in the U.S.
> **Diagnosing Public Health Data Structures via Unsupervised Learning (K-medoids & Fuzzy C-means)**

## 📌 Project Overview
* **Period:** March 4, 2024 - May 13, 2024
* **Nature:** Public Health Data Statistical Analysis Project
* **Objective:** Cluster U.S. states based on cocaine abuse rates and conduct a technical diagnosis of the dataset's structural characteristics.
* **Key Role:** **Model Selection & Validation of Analytical Adequacy**
    * Independently selected **K-medoids** and **Fuzzy C-means** to handle outliers and overlapping cluster boundaries.
    * Performed post-analysis reviews to identify structural limitations of the dataset and proposed future improvement strategies.

## 🛠 Tech Stack
* **Language:** R
* **Selected Algorithms:** **K-medoids (PAM):** Implemented for robust clustering against potential data outliers.
    * **Fuzzy C-means:** Explored the multidimensional relationships and membership weights of data points.
* **Methods:** Silhouette Coefficient, Exploratory Data Analysis (EDA), Trend Analysis.

## 🚀 Key Responsibilities & Technical Insights

### 1. Data Exploration & Technical Challenges
* Structured 17 years of longitudinal cocaine usage data.
* Identified significant skewness in population variables that dominated early clustering results, highlighting the critical need for feature selection.

### 2. Model Diagnosis & Result Interpretation
* **Analyzing Spatial-Temporal Similarity:** Discovered that 'State' and 'Year' variables caused excessive data density within the same regions (e.g., California clustering together across all years), hindering meaningful group separation.
* **Scientific Interpretation of Inconclusiveness:** Statistically proved that the current dataset lacks distinct cluster boundaries for K-medoids and Fuzzy C-means, providing a rigorous validation of the model's limitations.

### 3. Proposed Future Enhancements
* Suggested integrating synthetic opioid (fentanyl) overdose data for multivariate analysis to identify high-risk areas more effectively.

## 🏆 Key Achievements & Insights
* **Critical Analytical Thinking:** Demonstrated professional integrity by identifying and explaining why the models were inconclusive based on data defects (Skewness, Auto-correlation).
* **Strategic Problem Solving:** Transformed an "inconclusive" result into a comprehensive technical report on data restructuring and advanced modeling roadmaps.

### 📂 Project Files
* 📊 [Final Presentation Slide (PDF)](./Project_PPT.pdf)
* 💻 [Deep Learning Implementation & Analysis Report (.ipynb)](./STAT_437_Project_HY.ipynb)
* 💾 [Source Dataset: Pharmaceutical/Drug Data (CSV)](./drugs.csv)
