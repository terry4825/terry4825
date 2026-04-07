# 🩺 인도 간 질환 환자 데이터(ILPD) 기반 다변량 통계 분석
> **SAS를 활용한 임상 지표 분석 및 간 질환 예측 모델링 개인 프로젝트**

## 📌 프로젝트 개요
* **수행 기간:** 2024.04.15 - 2024.05.01
* **성격:** UIUC STAT 448 (Advanced Data Analysis) Individual Final Project
* **목표:** 583명의 임상 데이터를 분석하여 간 질환 여부와 연령, 성별 및 각종 혈액 검사 수치(Bilirubin, Albumin 등) 간의 통계적 인과관계 규명
* **사용 도구:** SAS (Statistical Analysis System)

## 🛠 분석 기술 스택
* **Language:** SAS
* **Statistical Methods:** * **Logistic Regression:** 간 질환 유무에 영향을 미치는 주요 임상 요인 식별 및 오즈비(Odds Ratio) 산출
    * **ANOVA & T-test:** 환자 군과 비환자 군 간의 연령 및 단백질 수치 차이 검정
    * **Log-linear Models:** 성별과 질환 유무 간의 범주형 데이터 상호작용 분석
    * **Stepwise Selection:** 최적의 예측 변수 조합 선택을 위한 변수 선택법 적용
* **Diagnostics:** Residual Analysis, Multicollinearity Check (VIF), Hosmer-Lemeshow Test

## 🚀 주요 수행 내용

### 1. 임상 지표별 그룹 비교 분석
* 간 질환 환자군이 비환자군에 비해 평균 연령이 높고(46.15세 vs 41.24세), 빌리루빈(TB, DB) 및 알칼라인 포스파타제(Alkphos) 수치가 현저히 높음을 통계적으로 증명.
* 반면, 총 단백질(TP)과 알부민(ALB) 수치는 환자군에서 낮게 나타나는 경향을 파악하여 간 기능 저하와의 상관관계 확인.

### 2. 다변량 로지스틱 회귀 모델 설계
* 성별과 간 질환 상태의 조합을 인터랙션 변수로 설정하여 모델링 수행.
* **분석 결과:** 여성 간 질환 환자군에서 특정 임상 수치 변화가 질환 발생 확률에 미치는 영향력이 남성 그룹과 차이가 있음을 확인하고, 성별에 따른 맞춤형 진단 지표의 필요성 제시.

### 3. 모델 최적화 및 타당성 검토
* Stepwise 선택법을 통해 모델의 복잡도를 줄이면서도 예측력을 극대화하는 변수 조합 도출.
* 잔차 분석과 다중공선성 진단을 통해 통계적 가정(Assumptions)을 위배하지 않는 신뢰성 있는 모델 구축.

## 🏆 주요 성과 및 인사이트
* **SAS 숙련도 입증:** 데이터 핸들링부터 고급 통계 모델링까지 전 과정을 SAS 코드로 직접 구현하여 기업용 통계 솔루션 활용 능력 증명.
* **복합적 가설 검정:** 단순 상관관계 분석을 넘어, 로지스틱 회귀와 로그 선형 모델을 결합하여 범주형과 수치형 변수가 혼재된 복잡한 의료 데이터를 효과적으로 해석.
* **의료 도메인 데이터 해석:** 임상 수치의 의학적 의미를 통계적 유의성으로 치환하여 분석 보고서를 작성하는 실무적 커뮤니케이션 역량 확보.

### 📂 관련 자료 (Project Files)
* 📋 [프로젝트 과제 및 분석 요건 (PDF)](./STAT448/Project_Questions.pdf)
* 📄 [통계 분석 답안 및 리포트 (PDF)](./STAT448/Hyunkyu_Yi_Final_Project.pdf)
* 💾 [분석에 사용된 데이터셋 (CSV)](./STAT448/Indian_Liver_Patient_Dataset_(ILPD).csv)
* 💻 [SAS 통계 분석 소스 코드 (.sas)](./STAT448/Hyunkyu_Yi_Final_Project.sas)
