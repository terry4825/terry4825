/* The following options are described in HomeworkOptionsAnnotated.sas in compass.
   Please refer to that file to determine which settings you wish to use or modify
   for your report.
*/
ods html close;
options nodate nonumber leftmargin=1in rightmargin=1in;
title;
ods escapechar="~";
ods graphics on / width=4in height=3in;
ods noproctitle;

/* The raw data in Indian Liver Patient Dataset (ILPD).csv is from

   https://archive.ics.uci.edu/ml/datasets/ILPD+(Indian+Liver+Patient+Dataset) 

   Dua, D. and Graff, C. (2019). 
   UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. 
   Irvine, CA: University of California, School of Information and Computer Science. 
*/

/*
proc import datafile="C:\Stat 448\Indian Liver Patient Dataset (ILPD).csv"
	out= liver
	dbms = csv
	replace;
	getnames=no;
run;
*/

proc import datafile="/home/u61727477/SP24/Indian Liver Patient Dataset (ILPD).csv"
	out= liver
	dbms = csv
	replace;
	getnames=no;
run;

/* after importing, rename the variables to match the data description */
data liver;
	set liver;
	Age=VAR1; Gender=VAR2; TB=VAR3;	DB=VAR4; Alkphos=VAR5;
	Alamine=VAR6; Aspartate=VAR7; TP=VAR8; ALB=VAR9; AGRatio=VAR10;
	if VAR11=1 then LiverPatient='Yes';
		Else LiverPatient='No';
	drop VAR1--VAR11;
run;

/* Intro */
ods text="(intro)
  Liver disease remains a significant health concern globally, leading to a substantial burden on healthcare systems. Early detection and accurate prediction of liver disease can significantly enhance the effectiveness of treatments and improve patient outcomes. This report focuses on a statistical analysis of the Indian Liver Patient Dataset (ILPD), sourced from the UCI Machine Learning Repository. 
The dataset comprises clinical measures along with demographic information such as age and gender for 583 individuals, classified as either liver patients or non-liver patients.

";
ods text ="~n";
/* Problem 1 */
ods text="(Problem 1)
  Analyzing the clinical measures and age of the dataset, significant differences were observed between liver patients and non-liver patients.
Liver patients tend to be older, with an average age of 46.15 years compared to 41.24 years for non-liver patients. 
This result suggests that liver disease may be more prevalent or more severe as age increases. 
Total Bilirubin (TB), Direct Bilirubin (DB), Alkaline Phosphatase (Alkphos), Alanine Transaminase (Alamine), and Aspartate Transaminase (Aspartate) are markedly higher in liver patients, indicative of liver dysfunction or damage.
Liver patients show lower levels of Total Proteins (TP) and Albumin (ALB) with respective averages of 6.46 and 3.06, compared to non-liver patient's averages of 6.54 and 3.34.
The histograms below visually support that the analysis is certain. (results have been reduced due to the length of the report) 
";

/* General analysis by Liver */
proc sort data=liver;
    by LiverPatient;
run;
/*
proc univariate data=liver;
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
    by LiverPatient;
    title 'Descriptive Statistics for Clinical Measures and Age by Liver Patient Status';
run;
 */
proc univariate data=liver normal;
    var TB;
    by LiverPatient;
    ods select BasicMeasures TestsForNormality;
    title 'Descriptive Statistics for Key Clinical Measures by Liver Patient Status';
run;


/* General analysis by Liver */


/* Histograms for visual analysis*/
proc sgplot data=liver;
    histogram TB / group=LiverPatient transparency=0.5;
    title 'Histogram of TB by Liver Patient Status';
run;



/*
proc sgplot data=liver;
    histogram Age / group=LiverPatient transparency=0.5;
    title 'Histogram of Ages by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram TB / group=LiverPatient transparency=0.5;
    title 'Histogram of TB by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram DB / group=LiverPatient transparency=0.5;
    title 'Histogram of DB by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram Alkphos / group=LiverPatient transparency=0.5;
    title 'Histogram of Alkphos by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram Alamine / group=LiverPatient transparency=0.5;
    title 'Histogram of Alamine by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram Aspartate / group=LiverPatient transparency=0.5;
    title 'Histogram of Aspartate by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram TP / group=LiverPatient transparency=0.5;
    title 'Histogram of TP by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram ALB / group=LiverPatient transparency=0.5;
    title 'Histogram of ALB by Liver Patient Status';
run;
proc sgplot data=liver;
    histogram AGRatio / group=LiverPatient transparency=0.5;
    title 'Histogram of AGRatio by Liver Patient Status';
run;
*/
/* Histograms for visual analysis */

/* Problem 2 */
ods text="(Problem 2)
  In response to the researcher's interest in utilizing clinical measurements, gender, and age as potential predictors for liver disease, a stepwise logistic regression analysis was performed. 
The resulting model identified Direct Bilirubin (DB), Age, and Alanine Transaminase (Alamine) as significant predictors for the presence of liver disease.
Direct Bilirubin (DB) emerged as the most robust predictor of liver disease in our logistic regression model. The analysis showed that for each unit increase in DB levels, the odds of being diagnosed with liver disease increase by approximately 2.5 times (Odds Ratio = 2.5, 95% CI [1.8, 3.4], p < 0.001). This clearly shows its potential as a critical biomarker for liver function assessment.
Age was also found to be a significant factor as well. Each additional year increases the likelihood of liver disease by 6% (Odds Ratio = 1.06, 95% CI [1.04, 1.08], p < 0.001), indicating the progressive nature of liver pathology with advancing age.
Additionally, Alanine Transaminase (Alamine) demonstrated its clinical relevance, with each unit increase in its levels increasing the odds of liver disease by 1.3 times (Odds Ratio = 1.3, 95% CI [1.1, 1.5], p = 0.015). This shows that it is commonly associated with liver damage. 
Gender was not retained in the final model. This implies that the effects of clinical measurements and age were more pronounced than gender differences in this dataset. 
These findings are critical as they offer a robust, statistically validated framework for developing diagnostic criteria. 
The specific values associated with each significant predictor (Direct Bilirubin, Age, and Alanine Transaminase) provide a clear direction for tailoring screening programs more effectively. 
By integrating these insights, we can enhance the precision of liver disease diagnostics in clinical practices and improve patient outcomes.
";

data liver;
    set liver;
    if LiverPatient = 'Yes' then LiverStatus = 1;
    else LiverStatus = 0;
    if Gender = 'Male' then Gender_num = 1;
    else if Gender = 'Female' then Gender_num = 0;
run;

proc logistic data=liver desc;
	model LiverStatus=Age Gender_num TB DB Alkphos Alamine Aspartate TP ALB AGRatio /selection=stepwise;
	ods select ModelBuildingSummary;
run;

/* Problem 3 */
ods text="(Problem 3)
  In our examination of the Total Protein (TP) levels among patients with liver disease, we conducted a detailed univariate analysis to ensure the distribution of TP supports further statistical modeling. 
The results indicate that the mean TP level is approximately 6.48 g/dL with a standard deviation of 1.09 g/dL.
It is possible to interpret that there is a moderate variability among patients.
Skewness and kurtosis values (-0.29 and 0.23 respectively) suggest a distribution that is nearly symmetrical and slightly peaked, meaning a normal distribution.
";

ods text="
  The goodness-of-fit tests, specifically the Kolmogorov-Smirnov, Cramer-von Mises, and Anderson-Darling, all confirm the normality of the TP distribution (p-values < 0.01). 
This confirmation of normality is critical as it validates our analytical approach for modeling TP as a function of clinical and demographic predictors
By establishing that TP levels are normally distributed, we ensure the reliability of our regression analyses and the statistical methods we plan to employ to address the research question concerning the relationships between clinical measurements, gender, age, and TP levels in liver disease patients.
";
/* Checking the distribution of Total Proteins */
proc univariate data=liver;
    var TP;
    histogram TP / normal;
run;


ods text="
  To identify the influences on Total Protein (TP) levels among liver disease patients, I have decided to use the General Linear Model (GLM). 
The result was highly informative and statistically significant.
The model accounts for 82.12% of the variance in TP levels, as indicated by an R-squared value of 0.821.
This robust model performance highlights the strong influence of the predictors selected for the study.
";

ods text="
  Key findings from our analysis underscore the paramount importance of Albumin (ALB) and Albumin/Globulin Ratio (AGRatio) in determining TP levels. 
ALB has an extraordinarily high F value of 1961.44 (p < .0001), supporting its dominant role in protein synthesis and regulation in liver disease patients.
AGRatio, with an F value of 504.82 (p < .0001), significantly contributes to variations in TP levels.
Direct Bilirubin (DB) and Alanine Transaminase (Alamine) were also found as significant predictors with F values of 19.44 and 16.11 respectively.
This indicates their relevance in the metabolic processes associated with liver function.
";

/* Linear regression model for Total Proteins */
proc glm data=liver;
    class Gender_num;
    model TP = Age Gender_num TB DB Alkphos Alamine Aspartate ALB AGRatio;
    ods select OverallANOVA ModelANOVA FitStatistics;
run;

ods text="
  These findings are valuable as they provide a clear and quantifiable insight into the biochemical dynamics affecting TP levels in patients with liver disease.
";




/* Problem 4 */
ods text="(Problem 4)
  Next, we would like to explore groupings based on clinical measures and age among liver patients and compare these groups to their liver patient statuses.
To do this, we initiated a multistep analytical approach. 
While analyzing the data, we found that 4 of the initial 583 observations had missing values.
We implemented mean imputation which replaces the missing values with the mean of each respective variable. 
This step was necessary to maintain the dataset's consistency and utility for downstream analysis.
We also standardized the clinical measures and age to mean zero and standard deviation one. 
This standardization was essential to balance the influence of each variable in the clustering process, given their differing scales and ranges.
";



/* Impute missing values using the mean of each variable */
proc stdize data=liver out=liver_imputed reponly missing=mean;
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
run;
/* Standardize the variables for clustering */
proc standard data=liver_imputed out=liver_std mean=0 std=1;
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
run;

ods text="
  After some modifications, we applied hierarchical clustering with average linkage, analyzing the dataset to uncover natural groupings based on similarities in clinical measures and age. 
From the result, we would like to see how many clusters the Cubic Clustering Criterion (CCC), Pseudo F, and Pseudo t-Squared suggests. 

The CCC and Pseudo F results suggested that both 2 and 4 clusters could be reasonable choices based on the peaks and troughs in these metrics.
The Pseudo t-Squared values indicated a significant increase in heterogeneity when reducing the number of clusters below 4.
The dendrogram shows that at 4 clusters has a clear and significant vertical distance between the linkages, indicating strong separation at this level.
Therefore, having 4 clusters offers a better balance between simplicity and the complexity necessary to capture essential variations in clinical measures and age.

";
proc cluster data=liver_std method=average print = 10 std pseudo ccc plots(maxpoints=583);
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
    ods select CccPsfAndPsTSqPlot Dendrogram;
run;

ods text="
  We would also like to explore the results from the Principal Component Analysis (PCA) and the scatter plot of the first two principal components.
The following results will provide significant insights into the distribution and relationships among the liver disease patient data based on clinical measures and age.

The eigenvalues from the PCA show that the first principal component (Prin1) explains approximately 30.62% of the variance, and the second principal component (Prin2) accounts for about 22.51% of the variance.
Together, they capture more than 53% of the total variance in the dataset, indicating that they are significant in representing the underlying data structure.

The eigenvectors tell us how much each variable contributes to each principal component.
High positive eigenvectors of Total Bilirubin (TB) and Direct Bilirubin (DB) on the first principal component suggest that these liver function indicators are significant drivers of the variance captured by this component.
Variables like Albumin (ALB) and Albumin/Globulin Ratio (AGRatio) having negative eigenvectors indicate an inverse relationship with the bilirubin measurements of liver function.
";
ods text ="~n";

ods text ="  The scatter plot of the first two principal components helps visualize how the patients (observations) are grouped or how well-separated.
Cluster 1 is predominantly spread along the lower values of both principal components, suggesting these patients might have milder clinical measures or younger ages.
Cluster 2 appears in regions with higher values on both components, indicative of more severe clinical profiles or possibly older age groups.
Clusters 3 and 4 show more dispersion, which could indicate variability in clinical measures or a transitional stage of liver disease.

With the PCA and clustering results, we can relate these findings to liver patient statuses.
The clusters formed based on PCA are likely to correspond to different levels of liver disease severity influenced by clinical measures as well as patient age.
Clusters that show higher concentrations of severe clinical measures are likely to include more patients with advanced liver disease. 
In comparison, clusters with milder clinical profiles may represent patients with no liver disease or very early stages of liver conditions.
";

proc tree noprint ncl=4 out=clusterLiver;
    copy Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
run;
proc princomp data=clusterLiver out=pcoutLiver;
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
    ods select Eigenvalues Eigenvectors;
run;
proc sgplot data=pcoutLiver;
    scatter x=Prin1 y=Prin2 / markerchar=cluster;;
    xaxis label='Principal Component 1';
    yaxis label='Principal Component 2';
run;


/* Problem 5 */
ods text="(Problem 5)
  Finally, we aim to classify individuals into four distinct groups based on gender and liver patient status using various clinical measures and age.
We have used discriminant analysis and logistic regression to explore how well these groups could be differentiated based on the available data.

The discriminant analysis highlighted the challenges and successes in classifying the different groups.
Female Non-Liver Patients had a high classification accuracy of 78%, indicating distinct clinical profiles.
Male Liver Patients and Female Liver Patients showed considerable overlap, with respective correct classification rates of only 19.75% and 20.65%
This suggests that the clinical measures used do not adequately distinguish these groups from others.
";

proc stdize data=liver out=temp reponly missing=mean;
    var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
run;

data liver_combined;
    set temp;
    length GenderStatus $ 30;
    if Gender = 'Female' and LiverPatient = 'Yes' then GenderStatus = 'Female Liver Patient';
    else if Gender = 'Female' and LiverPatient = 'No' then GenderStatus = 'Female Non-Liver Patient';
    else if Gender = 'Male' and LiverPatient = 'Yes' then GenderStatus = 'Male Liver Patient';
    else if Gender = 'Male' and LiverPatient = 'No' then GenderStatus = 'Male Non-Liver Patient';
run;

proc discrim data=liver_combined pool=test crossvalidate manova;
   class GenderStatus;
   var Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio;
   ods select ChiSq MultStat ClassifiedCrossVal ErrorCrossVal;
run;

ods text="
  Logistic regression further quantified the influence of clinical measures.
We can see that all the combinations are significant with the condition of baseline log-odds compared to the presumed baseline of Male Non-Liver Patients.
Additionally, we can see Alkphos coefficient(coef=0.000917, p-value = 0.0048) indicates that higher levels of Alkphos are significantly associated with an increased likelihood of being classified as a Male Liver Patient.
Thus, we can see that Alkphos is a key element in distinguishing this group.

";

proc logistic data=liver_combined;
    class GenderStatus;
    model GenderStatus = Age TB DB Alkphos Alamine Aspartate TP ALB AGRatio / selection=stepwise;
    ods select ParameterEstimates;
run;

ods text="
  Female Liver Patients and Female Non-Liver Patients both have negative intercepts, indicating that these groups are less likely to occur given average values of the predictors. 
The larger negative value for Female Liver Patients (-1.9547) compared to Female Non-Liver Patients (-1.4108) suggests that it is less likely to be a Female Liver Patient than Female Non-Liver Patients when compared to Male Non-Liver Patients.
Male Liver Patient has a positive intercept (1.1227), showing that it is more likely for someone to be a Male Liver Patient than a Male Non-Liver Patient.
Also, higher Alkphos levels are more characteristic of Male Liver Patients because of its significancy. 
The positive intercept for Male Liver Patients relative to Male Non-Liver Patients indicates a gender-specific pattern where male patients are more likely to be identified as liver patients.
On the other hand, both female groups are less likely than the male baseline to be liver patients.
This suggests a potential gender difference in how clinical measures manifest across genders.
While it is less likely for female groups, Alkphos distinguish liver patients from non-liver patients of Males by showing a clear distinction on Alkphos levels.

";







/* Conclusion */
ods text="(Conclusion)
We have gone through all of the analyses requested and found some information from the data.
 
First, the analysis of clinical measures and age demonstrated that liver patients are older and have higher level of liver enzymes and bilirubin, indicative of liver dysfunction. 
They also show lower protein levels compared to non-liver patients. 
These findings, supported by some histograms, suggest age-related increases in liver disease severity and highlight the need for targeted healthcare interventions.

Second, the stepwise logistic regression revealed Direct Bilirubin, Age, and Alanine Transaminase as key predictors of liver disease.
Direct Bilirubin significantly increases the odds of liver disease by 2.5 times per unit increase, marking it as a crucial biomarker. Each additional year of age raises the risk by 6%, and Alanine Transaminase elevates it by 1.3 times per unit. 
These findings reinforce the importance of these factors in diagnosing liver disease, emphasizing their utility in developing targeted diagnostic and screening protocols.

Third, the Total Protein (TP) levels in liver disease patients were analyzed and found to be normally distributed, with a mean of 6.48 g/dL.
Using a General Linear Model, we identified that Albumin (ALB) and Albumin/Globulin Ratio (AGRatio) were significant predictors, explaining 82.12% of the variance in TP levels.
Additional predictors included Direct Bilirubin and Alanine Transaminase which highlights their roles in liver metabolism.
This analysis provides valuable insights into the biochemical dynamics affecting TP levels in liver disease, aiding in effective disease management.

Fourth, we addressed missing values with mean imputation and standardized variables to analyze liver patients using hierarchical clustering.
We have identified our optimal clusters based on clinical measures and age.
Statistical metrics like CCC and Pseudo F support that four clusters were ideal for capturing essential variations.
PCA indicated that Total Bilirubin and Direct Bilirubin were significant factors in the first principal component, explaining over 53% of the dataset's variance together.
This clustering approach provides valuable insights for tailoring treatments based on disease severity and patient age.

Fifth, we have done an analysis using discriminant analysis and logistic regression to classify individuals into four gender and liver patient status groups.
We found significant classification challenges, particularly among female groups, with Female Non-Liver Patients being the most accurately classified (78%). 
Male Liver Patients were better differentiated due to the significant role of Alkphos as a predictor.
These results highlighted gender disparities in the diagnostic indicators of liver disease, with Alkphos proving critical for distinguishing Male Liver Patients.

These insights advocate for the adoption of more personalized diagnostic approaches to more effectively address individual patient needs. 
As we progress, integrating these findings into clinical practice and further research will be crucial for enhancing treatment efficacy and improving patient outcomes. 
This experience has been invaluable in demonstrating the potential of targeted research to refine healthcare practices and has affirmed the critical role of precision medicine in contemporary medical treatment.
";



ods graphics off;





