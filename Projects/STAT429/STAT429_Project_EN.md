# 📈 U.S. Oil Consumption & Production Trend Analysis (STAT 429)
> **Individual Final Project: Time Series Forecasting and Modeling (Data: 1965-2022)**

## 📌 Project Overview
* **Period:** Jan 2024 - May 2024
* **Nature:** UIUC STAT 429 (Time Series Analysis) **Individual Final Project**
* **Objective:** Analyze long-term U.S. oil data to identify correlations between consumption and production and forecast future market trends.
* **Tools:** R, RStudio

## 🛠 Tech Stack
* **Language:** R
* **Models:** * **Consumption:** `ARIMA(2,0,0)`
  * **Production:** `ARIMA(1,0,2)`
  * **Regression:** Integrated regression modeling to analyze the impact of global oil prices and production on consumption.
* **Methods:** Stationarity Check, Box-Jenkins Methodology, Diagnostic Checking, Forecasting (95% Confidence Interval).

## 🚀 Key Analysis & Features

### 1. Handling Non-stationarity in Long-term Data
* Identified significant volatility, including the decline in consumption in the early 2000s and the surge in production since 2007.
* Analyzed trends and autocorrelation to stabilize variance for accurate time-series modeling.

### 2. Optimal Model Identification & Validation
* **Consumption Model:** Confirmed `ARIMA(2,0,0)` as the best fit, reflecting the influence of previous data points.
* **Production Model:** Identified `ARIMA(1,0,2)` to capture the stability of production trends including moving average components.
* **Diagnostic Checking:** Verified model adequacy by ensuring residuals behaved as white noise.

### 3. Multivariate Interaction via Regression
* Supplemented time-series forecasting by analyzing how global oil prices and production levels causally affect consumption.
* Interpreted the impact of global events (e.g., Russia-Ukraine war) on price spikes and resulting supply chain shifts.

## 🏆 Key Achievements & Insights
* **Data-Driven Forecasting:** Predicted a gradual increase in consumption while production remains stable over the next five years.
* **Quantifying Uncertainty:** Applied a 95% confidence interval to forecasts to provide a statistically conservative and realistic market outlook.
* **Analytical Expertise:** Demonstrated the ability to transform complex real-world economic data into sophisticated statistical models for actionable insights.

### 📂 Project Files
* 💻 [R Markdown Source Code (.Rmd)](./Stat429FinalProject_HY.Rmd)
* 📄 [Final Analysis Report (PDF)](./Stat429FinalProject_HY.pdf)
* 📊 [Dataset: Global Crude Oil Prices](./crude-oil-prices.csv)
* 📊 [Dataset: Oil Consumption by Country](./oil-consumption-by-country.csv)
* 📊 [Dataset: Oil Production by Country](./oil-production-by-country.csv)
