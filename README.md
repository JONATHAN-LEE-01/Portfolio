 # Jonathan Lee - Mathematics and Economics Student

  ## **About**
  
   Hi, I’m Jonathan.
   <br /> I'm a Mathematics and Economics student at Western Washington University and am currently expanding my mathematical and computer science comprehension in Non-Linear Optimization. My personal interests include analyzing data, developing accessible and inclusive communities, assessing public policy implications, and learning personal finance strategies. During my studies, I have acquired technical experience in Excel, Stata, Rstudio, and Tableau.
  <br />My knowledge of data analytics includes but is not limited to:

 - Probability and Statistical Inferences:
   - Multiple Linear Regression
   - Binomial Distribution
   - T-Distribution
   - F-Distribution
   - Chi-Squared Distribution
   - Conditional Probability
   
 - Econometrics:
   - Gaussian Distribution
   - Run's Test
   - White's Test/Correction
   - Durbin-Watson Autocorrelation Test
   - Cochrane-Orcutt Procedure
   - Generalized Least Squares
   - Weighted Least Squares
   - Maximum Likelihood Estimations
   - Binary Logistic Regressions
   - Data Cleaning
   - Data Visualization
 


  <br />This is a repository to showcase analytical skills and share recent projects.
  
  ---
  ## **Table of Contents**
  - [**Statistics Projects**](#statistics-projects)
    + [Real Estate Appraisal Analysis](#real-estate-appraisal-analysis)
    + [Analysis of Descrepancies in Professor Salaries](#analysis-of-descrepancies-in-professor-salaries)
    + [Final Project Correlations Between House Features and Price in King County](#final-project-correlations-between-house-features-and-price-in-king-county)
  - [**Econometrics Projects**](#econometrics-projects)
    + [Homework 2](#homework-2)
    + [Homework 5](#homework-5)
  - [**Show Case of Related Projects**](#show-case-of-related-projects)
    + [Excel Projects](#excel-projects)
    + [Course Notes](#course-notes)
    + [Papers Written for Economic Courses](#papers-written-for-economic-courses]
  - [**Resume**](#resume)
  - [**Contact**](#contact)
  
 ## **Statistics Projects**
   ### ***Real Estate Appraisal Analysis***
  <br />****Code:**** [`Appraisal_Code.Rmd`](https://github.com/JONATHAN-LEE-01/About/blob/main/Appraisal%20Code.R) 
  <br />****Presentation:**** [`Appraisal_Analysis.pdf`](https://github.com/JONATHAN-LEE-01/About/blob/main/Appraisal_Analysis.pdf)
  <br />****Description:**** 
   <br /> &nbsp; &nbsp; &nbsp; &nbsp; The second workshop in Math 342 (Probability and Statistical Inferences). The dataset, which was pulled from the paper *"Using Multiple Regression Analysis in Real Estate Appraisal"* (*Appraisal Journal* [2002]:424-430), contains sale price, size, and land-to-building ratio for 10 large industrial properties. This assignment is guided with the following steps: separate the data into two categories (price and size), make a scatterplot and obtain correlation coefficient, calculate least-sums estimates, run an ANOVA table to perform F-test, construct a 95% confidence interval, make a scatterplot of the residuals to check for constant variance and linearity, plot the normal Q-Q and run the Wilk-Shapiro testto check if the normality assumption is satisfied, graph the standardized residuals with boundaries to identify possible outliers, and plot the leverage values with boundaries to identify influential observations. 

   ### ***Analysis of Descrepancies in Professor Salaries***
   <br />****Code:**** [`Professor_Code.Rmd`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Professor_Salaries.Rmd) 
   <br />****Presentation:**** [`Professor_Salaries`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Professor_Salaries.pdf)
   <br />****Description:**** 
<br /> &nbsp; &nbsp; &nbsp; &nbsp; The fourth workshop in Math 342. The dataset consists of the 2008-2009 nine-month academic salary for Assistant Professors, Associate Professors, and Professors in a college in the U.S. This data was analyzed to monitor salary differences between male and female faculty members. The workshop follows theses steps in exact order: attach and display head of *"Salaries"* dataset, create dummy and indicator variables to separate rank, sex, and discipline, fit full model using only dummy and indicator variables to check overal model significance, interpret coefficients and explain anomalies, perform stepwise regression to accquire predictors of the final model, construct a 95% prediction interval female associate professors in the applied department with 8 years of service and 10 years after PhD, perform diagnostic check of final model, identify outliers or influential points, plot normal Q-Q, run Wilk-Shapiro test to test for linearity, constant variance and normality.
   ### ***Final Project Correlations Between House Features and Price in King County***
   <br />****Code:**** [`Final_Paper.R`](https://github.com/JONATHAN-LEE-01/About/blob/main/Final_Paper.R) 
   <br />****Presentation:**** [`Math 342 Final Paper.pdf`](https://github.com/JONATHAN-LEE-01/About/blob/main/Math%20342%20Final%20Paper.pdf) 
   <br />****Tableau Public:**** [`Final Project Dashboard`](https://public.tableau.com/app/profile/jonathan.lee8070/viz/UnexploredDatainCorrelationsBetweenHouseFeaturesandPriceinKingCounty/Correlations_1)
   <br />****Description:**** 
   <br /> &nbsp; &nbsp; &nbsp; &nbsp; The final project in Math 342. The dataset was pulled from [kaggle.com](https://www.kaggle.com/datasets/harlfoxem/housesalesprediction). For this assignment, we were to find a dataset collected from the real world and construct a hypothesis and the best fit prediction model. There were 21614 samples in the dataset with each sample including 21 observations. Our process was as follows: find dataset with a certain amount of quantitative and categorical predictors, apply exploratory data analysis techniques to clean dataset, construct our hypothesis: *"we are relatively confident that the price of homes can be predicted (given certain home characteristics",* apply regression analysis techniques such as creating dummy variables, fit full and reduced models, run ANOVA table, run a correlation matrix of predictors, test for normality/constant variance, plot leverage and residual values, accquire best subset model, construct 95% prediction and confidence intervals, test model using a random sample, and write up paper. 
   <br /> &nbsp; &nbsp; &nbsp; &nbsp; In the *"Regression Analysis"* section, it discussed the process of data cleaning and removing certain predictors due to lack of information or quantitative value despite us having assumptions that they could affect our accuary of our model. I took the removed predictors and graphed them against price and applied trend lines in order to confirm our assumptions of correlation in predicting price. In a future model, I plan to incorporate this data into our best fit model in order to shrink our confidence interval.

 ## **Econometrics Projects**
  ### ***Homework 2***
 <br />****PDF:**** [`Homework 2`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/7d515352d776c19ea39ae84796d604421d296e87/Hw2.pdf)
 <br />****Do-File:**** [`HW2_StataCode.do`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/0983efbc447b6b73308c931fc533ca5e1bc3adf3/HW2_StataCode.do) 
  <br />****Description:**** 
  <br /> &nbsp; &nbsp; &nbsp; &nbsp; This homework was assigned from Econometrics 475 at WWU. The assignment provided me with insight on how heteroskedasticity errors in our regression can influence our model. Further on in the assignment I apply the Park's Test, White's Test, WLS corrections and FGLS re-estimations.
### ***Homework 5***
 <br />****PDF:**** [`Homework 5`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/fd4b966ba432ee4156e7beafc7b05aa23d445f1f/475HW5.pdf)
 <br />****Do-File:**** [`hw5stata.do`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/fd4b966ba432ee4156e7beafc7b05aa23d445f1f/hw5stata.do) 
  <br />****Description:**** 
  <br /> &nbsp; &nbsp; &nbsp; &nbsp; This homework was assigned from Econometrics 475 at WWU. I explored panel data by using pooled OLS a fixed effects regression to interpret for when my predictor variables are correlated to my error terms.

 ## **Show Case of Related Projects**
 - ### **Excel-Projects**
   + ### ***Personal Monthly Expense Excel***
   <br />****Excel File:**** [`Expenses.xlsx`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Expenses.xlsx) 
   <br />****PDF File:**** [`Expenses.pdf`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Expenses.pdf)
   <br />****Description:****
   <br /> &nbsp; &nbsp; &nbsp; &nbsp; As I mentioned above, I have an strong interest in personal finance. Achieving and maintaining financial independence with minimal to no debts has been a goal of mine since I was in elementary school. Using my experience in Excel, I built a personal monthly expense tracker to help me visualize my spending to ensure that I am on track to save every month. This Excel file is not meant to categorize all of my purchases but rather be a general summary of my income vs my expenses. This project includes table formatting, conditional formatting, sparklines, and a pie chart using multiple series. Once more data on my expenses are collected, I plan to incorporate detailed breakdowns of each section in my summary and credit card statements using .csv files, an annual summary sheet, and utilize more percentage functions.
   + ### ***Tech Support Organization Excel***
   <br />****Excel File:**** [`TechSupport.xlsx`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Copy%20of%20Lee_EXP19_Excel_Ch04_Cap_TechSupport.xlsx) 
   <br />****PDF File:**** [`TechSupport.pdf`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/TechSupport.pdf)
   <br />****Description:****
   <br /> &nbsp; &nbsp; &nbsp; &nbsp; This is an excel file on *Technical Support Calls* within a company. The data has about 100 samples with 8 observations each. The observations include: incident number, date created, last name, agent name, computer ID, description, status, and date resolved. Originally the data was completely raw with no formatting. The following edits I made include: freezing planes, table formatting, removal of duplicate records, adding a duration column with the appropriate formula, multiple levels of alphabetical and description sorting, conditional formatting, and inserting sparklines and page breaks. The excel file attached above is an interactive excel sheet that can sort through the data from editting the sorting levels if need be in the future.
 - ### **Course Notes**
   + ### ***Notes on Differential Equations:*** [331 Notes.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/6e8bb8be810d2fbc8c2712aa1bd43076269dcc30/331%20Notes.pdf)
   + ### ***Notes on Notes on Limits and Infinite Series:*** [226 Notes.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/6e8bb8be810d2fbc8c2712aa1bd43076269dcc30/226%20Notes.pdf)
   + ### ***Notes on Intermediate Microeconomics:*** [306 Notes.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/6e8bb8be810d2fbc8c2712aa1bd43076269dcc30/306%20Notes.pdf)
 - ### **Final Papers Written for Economics Courses**
   + ### ***A Solow Model Alternative:*** [407 Final Paper.pdf]
   + ### ***The US Response to China's National Security Law Explained:*** [491 Final Paper.pdf]

 ## **Resume** 
   [`Jonathan Lee Resume`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/main/Jonathan_Lee_Resume.pdf)
  <br />
  <br />
  <br />
 ## **Contact**
   - E-mail: jonathandlee0120@gmail.com
   <br />
   <br />
   <br />
