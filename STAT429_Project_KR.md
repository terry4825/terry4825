# 📈 시계열 분석을 통한 데이터 예측 모델링 (STAT 429)

## 📌 프로젝트 개요
* **수행 기간:** [날짜 입력, 예: 2024.01 - 2024.05]
* **성격:** UIUC STAT 429(Time Series Analysis) 전공 팀 프로젝트
* **목표:** 특정 시계열 데이터의 추세(Trend)와 계절성(Seasonality)을 분석하고, 최적의 통계 모델을 구축하여 미래 수치를 예측
* **사용 도구:** R, RStudio

## 🛠 분석 기술 스택
* **Language:** R
* **Methods:** ARIMA (Autoregressive Integrated Moving Average), SARIMA, Box-Jenkins Methodology, Unit Root Test (ADF Test), ACF/PACF Analysis

## 🚀 주요 수행 내용
* **데이터 전처리 및 변환:** 비정상성(Non-stationary) 시계열 데이터를 처리하기 위해 차분(Differencing) 및 로그 변환(Log Transformation) 수행
* **모델 식별 및 추정:** ACF 및 PACF 그래프 분석을 통해 잠재적 모델 후보군을 식별하고, AIC/BIC 기준에 따라 최적의 파라미터($p, d, q$) 결정
* **잔차 진단 (Diagnostic Checking):** Ljung-Box Test를 통해 잔차의 백색 잡음(White Noise) 여부를 검정하여 모델의 적합성 검증
* **예측 (Forecasting):** 최종 선정된 모델을 바탕으로 미래 시점의 데이터를 예측하고 95% 신뢰구간 산출

## 🧠 기술적 통찰 (Key Insights)
* 단순한 수치 예측을 넘어, 데이터에 내재된 불확실성을 통계적으로 계량화하는 과정을 경험함
* 실무 환경에서 발생할 수 있는 이상치(Outlier)가 모델의 예측력에 미치는 영향을 분석하고 이를 보정하는 기법을 학습함
