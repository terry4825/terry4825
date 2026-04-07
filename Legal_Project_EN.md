# ⚖️ AI-based Legal Data Analysis & Legislative Improvement Solution
> **Participant in the 1st Legal Data Utilization Idea Contest | Passed Initial Screening**

## 📌 Project Overview
* **Period:** May 1, 2025 - June 30, 2025
* **Organizer:** Ministry of Government Legislation, Republic of Korea
* **Objective:** Designing an AI-driven platform to diagnose structural flaws in legislation (redundancy, conflict, obsolescence) and propose automated policy improvements using Big Data and AI.
* **Key Role:** **Technical Architect & Lead Designer for AI Solution**
    * Designed the data analysis pipeline and machine learning algorithm framework.
    * Planned the AWS-based cloud infrastructure and real-time data processing workflow.

## 🛠 Proposed Technical Architecture

### 🤖 AI & Machine Learning
* **NLP & Embedding:** `Sentence-BERT` (Quantifying semantic similarity between legal clauses to detect contextual conflicts).
* **Clustering:** `K-Means` (Detecting redundant or unnecessary clauses through similarity-based grouping).
* **Classification & Regression:** `XGBoost`, `Random Forest` (Predicting risk scores and prioritizing legislative revision based on public petition frequency and judicial precedents).
* **Generative AI:** `LLM` (Automated generation of concise legal improvement drafts and summaries).

### ☁️ Cloud Infrastructure (AWS)
* **Data Pipeline:** `AWS Kinesis` (Real-time data ingestion), `AWS Glue` (ETL processes).
* **Storage & DB:** `Amazon S3` (Data Lake), `Amazon RDS` (Metadata management).
* **Model Serving:** `Amazon SageMaker` (Model training & deployment), `AWS Lambda` (Event-driven computing).

## 🚀 Key Planning & Design Features

### 1. Multi-dimensional Legal Data Integration
* **Data Linkage:** Integrated over 8 types of data via the Public Data Portal API (Current laws, Judicial precedents, Administrative trials, Civil petition big data, Legislative history, etc.).
* **Semantic Analysis:** Overcame the limitations of simple keyword matching by applying S-BERT embeddings to identify **contextual contradictions and logical flaws** within legal texts.

### 2. Strategic Data Processing Pipeline
1.  **Ingestion & Preprocessing:** Collected unstructured legal texts via APIs, performed text cleaning, and executed embedding using a legal-specific vocabulary dictionary.
2.  **Diagnostic Modeling:** Grouped similar clauses using K-Means and quantified the "Necessity for Revision" (Risk Score) using XGBoost and Random Forest to determine
