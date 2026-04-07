# ❄️ Clustering Analysis of Cocaine Abuse Patterns in the U.S. (STAT 437)
> **Identifying Public Health Patterns using Unsupervised Learning (K-medoids, Hierarchical Clustering)**

## 📌 Project Overview
* **Period:** Aug 2024 - Dec 2024 (Finalized March 2025)
* **Nature:** UIUC STAT 437 (Nonparametric Statistics) Team Project
* **Objective:** Cluster U.S. states based on age-specific cocaine abuse rates to provide deeper insights for public health policy-making.
* **Tools:** R, RStudio

## 🛠 Tech Stack
* **Language:** R
* **Algorithms:** * **K-medoids (PAM):** Robust clustering to handle potential outliers in state-level data.
  * **Hierarchical Clustering:** AGNES using Single, Complete, Average, and Ward linkage methods.
* **Evaluation:** Silhouette Coefficient, Dendrogram visualization.
* **Libraries:** `cluster`, `factoextra`, `tidyverse`

## 🚀 Key Analysis & Features

### 1. High-Dimensional Data Preprocessing & EDA
* Structured 17 years of longitudinal data covering three demographic groups (12-17, 18-25, 26+) across 50 states and D.C.
* Investigated correlations between age groups and state-level trends to validate the clustering approach.

### 2. Advanced Clustering & Validation
* **Hierarchical Approach:** Compared four linkage methods to identify the most natural hierarchical structure, addressing issues like "chaining" in single linkage.
* **K-medoids (PAM):** Implemented Partitioning Around Medoids (PAM) for enhanced robustness compared to standard K-means.
* **Model Evaluation:** Utilized Silhouette Plots to quantitatively measure cluster cohesion and separation, ensuring the optimal number of clusters ($k$).

### 3. Interpretation & Policy Recommendations
* Identified specific high-risk clusters and analyzed geographic/demographic commonalities among member states.
* Proposed integrating the findings with synthetic opioid (fentanyl) data to improve resource allocation for state health departments.

## 🏆 Key Achievements & Insights
* **Unsupervised Learning Expertise:** Demonstrated the ability to extract meaningful patterns from unlabeled complex public health datasets.
* **Methodological Rigor:** Ensured high-quality results by comparing multiple distance metrics and linkage methods.
* **Actionable Insights:** Transformed statistical outputs into strategic recommendations for policymakers, highlighting data storytelling skills.
