 # Jonathan Lee - Mathematics and Economics Student

  ## **About**
  
   Hi, I’m Jonathan.
   <br /> I graduated with a bachelor's degree in Mathematics and Economics from Western Washington University. I'm currently expanding my technical support comprehension in Active Directory, Microsoft System Center Configuration Manager (SCCM), and Bomgar remote software. My personal interests include analyzing data, developing accessible and inclusive communities, assessing public policy implications, and learning finance strategies. During my studies, I have acquired technical experience in Excel, Stata, Rstudio, Python, MATLAB, and Tableau.
  <br />
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
 - Non-Linear Optimization:
   - Newton Line Searches
   - Steepest Descent
   - Quasi-Newton Methods
   - Conjugate Gradient Methods
   - Lagrange Multipliers
   - Inequality Constrained Optimization
   - Integral Constrained Optimization

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
    + [Research Paper](#research-paper)
  - [**Non-Linear Optimization Projects**](#non-linear-optimization-projects)
  - [**Show Case of Related Works**](#show-case-of-related-works)
    + [Papers](#papers)
    + [Course Notes](#course-notes)
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
  <br /> &nbsp; &nbsp; &nbsp; &nbsp; This homework was assigned from Econometrics 475 at WWU. I explored panel data by applying my knowledge in pooled OLS and fixed effects regressions to interpret when the predictor variables are correlated to the error terms.
### ***Research Paper***
 <br />****PDF:**** [`Working Paper`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/62012ba95f58882fa4877ebbe05670290c84925d/475%20Working%20Paper.pdf)
 <br />****Do-File:**** [`475DataAnalysis.do`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/62012ba95f58882fa4877ebbe05670290c84925d/475DataAnalysis.do)
  <br />****Description:**** 
  <br /> &nbsp; &nbsp; &nbsp; &nbsp; This is a working paper on identifying the factors that influence a recent WWU undergraduate's probability of obtaining any number of job offers after graduation. It uses survey data collected in 2010 by my Econometrics 475 professor John Krieg. I adapt Professor Denise Jackson's research in her paper, "Factors Influencing Job Attainment in Recent Undergraduates" to construct the approach in my analysis. I attempt to create composite variables using Krieg's data that fit the description of factors that Jackson identified in her research. I use a logit regression to identify the odds ratio and marginal effects of the robust regression to identify the change in odds given a one unit change in a predictor variable. This research is incomplete as it has not resolved the issue of the large presence of heteroskedasticity amongst the predictor variables.

 ## **Non-Linear Optimization Projects**
  ### ***Implementing Test Functions***
 <br />****My Quadratic Function:**** [`myQuad.py`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/80b3ae95542e2b92570a3efb296e6710e790949a/myQuad.py)
 <br />****Booth Test Function**** [`myBooth.py`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/80b3ae95542e2b92570a3efb296e6710e790949a/myBooth.py)
 <br />****Beale Test Function**** [`myBeale.py`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/80b3ae95542e2b92570a3efb296e6710e790949a/myBeale.py)
 <br />****N-D Perm Test Function**** [`myPerm.py`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/80b3ae95542e2b92570a3efb296e6710e790949a/myPerm.py)
 <br />****Rosenbrock Test Function**** [`myRosenbrock.py`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/80b3ae95542e2b92570a3efb296e6710e790949a/myRosenbrock.py)
 
  <br />****Description:**** 
  <br /> &nbsp; &nbsp; &nbsp; &nbsp; The culmination of several assignments in Math 435: Non-Linear Optimization. Its purpose is to generate code to test the algorithms that we developed throughout the course. Specifically, we wrote code that serves as a "black box" test function. This code is comprised of the following functions, [r,g]=myQuad(x,Q,b) and [r,g]=myBooth(x), [r,g]=myBeale, [r,g]=myBooth, [r,g]=myPerm, [r,g]=myRosenbrock. Each of these functions utilize different optimization methods, theorems, and techniques to approximate the global minimum or maximum. 
  
 ## **Show Case of Related Works**
 - ### **Papers**
   + ### ****A Solow Model Alternative:**** [407FinalPaper.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/518d168ae93bbe6ede84bb97975a389044b4f390/407FinalPaper.pdf)
   + ### ****The US Response to China's National Security Law Explained:**** [491FinalPaper.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/518d168ae93bbe6ede84bb97975a389044b4f390/491FinalPaper.pdf)
   + ### ****Hong Kong: The Duality of Foreign Domestic Workers**** [462FinalPaper.pdf](https://github.com/JONATHAN-LEE-01/Portfolio/blob/8ec4df5fe296569262bed0b6db50cbb0c1e0b525/462%20Final%20Paper.pdf)
 - ### **Course Notes**
   + [Notes on Math 226: Limits and Infinite Series](https://share.goodnotes.com/s/atxQISuAqVv9ExN0mZO9io)
   + [Notes on Math 331: Differential Equations](https://web.goodnotes.com/s/MgL6vsqzjeRuuKqYMAW8ol#page-1)
   + [Notes on Math 432: Systems of Differential Equations](https://share.goodnotes.com/s/D7jG0tRfflVeCstb9GzDsa)
   + [Notes on Math 435: Non-Linear Optimization](https://share.goodnotes.com/s/VFTZBu11PZGDUwMSCEld2P)
   + [Notes on Econ 306: Intermediate Microeconomics](https://web.goodnotes.com/s/aV0mrgGnEl8dT7VN2rEAMK#page-1)


 ## **Resume** 
   [`Jonathan Lee Resume`](https://github.com/JONATHAN-LEE-01/Portfolio/blob/533e7d72f330aeb753310a35cf05cafe1672197d/General%20Resume.pdf)
  <br />
  <br />
  <br />
 ## **Contact**
   - E-mail: jondeanlee@gmail.com
   <br />
   <br />
   <br />
