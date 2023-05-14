Jonathan Lee* 
*Econ 475 Project* 
*2010 Undergraduate Exit Survey* 

*Open Dataset* 
cd "C:\Users\jonde\Desktop\475 desktop" 
use "2010 Undergraduate Exit Survey (1).dta" 


tabulate joboffrd
**********# PRELIMINARY DATA EXPLORATION #**********
summarize
tabulate plnempoffr
	*Note: Removed observation 697 due to job offer equalling 75 (249 observations in plnempoffr, after 1 removed.)*
drop if plnempoffr == 75
summarize plnempoffr
		tabulate plnempsrch
		*Note: plnempoffr was decided as not the most accurate tracker of jobs offered to graduates hoping to work after college

**********# SEARCHING FOR DEPENDEDNT DUMMY VARIABLE #**********

	**gen dum for job search status**
tabulate plnempsrch, gen(srchstatus_)
	**gen dum for searching**
gen srching = 0
	**add 1's for when plnempsrch has any observation above 0. (drops the nonrespondent observations**
replace srching = 1 if plnempsrch > 0
	**drop observations of students not expecting to enter work force after graduation**
drop if srching == 0
drop if missing(plnempsrch)
	**gen dum for job offered**
gen joboffrd =0
replace joboffrd = 1 if srchstatus_2 == 1
replace joboffrd = 1 if srchstatus_3 == 1
replace joboffrd = 1 if srchstatus_4 == 1
tabulate joboffrd srching

**********# CREATING INDEPENDENT VARIABLES #**********

	**Dummy per Major Dept**
	tabulate MajorDept1 
	tabulate MajorDept1, gen(Dept_) 
	**Dummy per Degree type BA, BAE, BFA, BMUS, BS**
	tabulate DEGREE 
	tabulate DEGREE, gen(Degree_) 
	**Per Response of Expected Time to Graduate** 
	tabulate ttdexpec, gen(GradExpec_) 
	**generate gender x skill develop**
	gen GenderxSkill = FemaleBin*Skill_Development
	*generate age x skill development
	gen AgexSkill = AGE*Skill_Development
	*generate age^2
	gen AGE2=AGE^2
	*generate lndebtamnt*
	generate lndebtamnt=ln(debtamnt)
	*generate Minority from Ethnic not equalling 1
	gen Minority = 0
	replace Minority = 1 if Ethnic > 1
	
**********# CREATING COMPOSITE VARIABLES  #**********

	**Skill Development Composite**
		***check if on same scale***
	codebook abilconwrit abilconoral abilconcrit abilconind abilconcoop abilconsci abilconqnt abilcontech
		***Check correlation***
	corr abilconqnt abilconsci abilconcrit abilconcoop abilconwrit abilconind
		***Cronbach Alpha, Internal Consistency of Responses, alpha=0.7394>0.7***
	alpha abilconwrit abilconoral abilconcrit abilconind abilconcoop abilconart abilconsci abilconqnt abilcondiv abilconlib abilcontech, item
	**Note: Variable manager, create extended variable, "skill_miss" (checking for nonrespondents)
egen float skill_miss = rowmiss(abilconwrit abilconoral abilconcrit abilconind abilconcoop abilconart abilconsci abilconqnt abilcondiv abilconlib abilcontech)
	**Check for missing responses**
	tabulate skill_miss
	**Note: Variable manager, create extended variable, "Skill_Development" (Creating composite variable for Skill Development of graduates who missed no more than 1 question within the composite)*
egen float Skill_Development = rowmean(abilconwrit abilconoral abilconcrit abilconind abilconcoop abilconart abilconsci abilconqnt abilcondiv abilconlib abilcontech) if skill_miss<3
	tabulate Skill_Development

	**Institution Composite Cronbach alpha=0.7573>0.7**
	summarize wwusat majsatavail majsatvar majsatfac majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv
	codebook wwusat majsatavail majsatvar majsatfac majsatqual majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv
	corr wwusat majsatavail majsatvar majsatfac majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv
	alpha wwusat majsatavail majsatvar majsatfac majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv, item
	egen instit_miss = rowmiss(wwusat majsatavail majsatvar majsatfac majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv)
	tab instit_miss
	egen Institution = rowmean(wwusat majsatavail majsatvar majsatfac majsatchal majsatintsvc majsatrlv majsatappl majsatindrsch majsatfacrsch majsatdiv majsatadv) if instit_miss<5
	tabulate Institution

	**Graduate Identity cronbach alpha 0.7340>0.7***
		*Checking for scale*
	codebook engfreqdisc engfreqcar engfreqevnt q0_a q0_b q0_c q0_d engfreqrsch q1_a q1_b
			*Note: not equivalent scale, standardized row per variable*
	egen z_engfreqdisc=std(engfreqdisc), mean(0) sd(1)
	egen z_engfreqcar=std(engfreqcar), mean(0) sd(1)
	egen z_engfreqevnt=std(engfreqevnt), mean(0) sd(1)
	egen z_engfreqrsch=std(engfreqrsch), mean(0) sd(1)
	egen z_q0_a=std(q0_a), mean(0) sd(1)
	egen z_q0_b=std(q0_b), mean(0) sd(1)
	egen z_q0_c=std(q0_c), mean(0) sd(1)
	egen z_q1_a=std(q1_a), mean(0) sd(1)
	egen z_q1_b=std(q1_b), mean(0) sd(1)
	corr engfreqdisc engfreqcar engfreqevnt q0_a q0_b q0_c engfreqrsch q1_a q1_b
			*Note: removed q0_d b/c it increased our alpha from 0.7228 to 0.7340
		*Cronbach Alpha Test*
	alpha z_engfreqdisc z_engfreqcar z_engfreqevnt z_engfreqrsch z_q0_a z_q0_b z_q0_c z_q1_a z_q1_b, item
			*Note: removed q0_d b/c it increased our alpha from 0.7228 to 0.7340
	*generate gradid_miss (checking for nonrespondents)*
	egen float gradid_miss = rowmiss(z_engfreqdisc z_engfreqcar z_engfreqevnt z_engfreqrsch z_q0_a z_q0_b z_q0_c z_q1_a z_q1_b)
	*Check for nonrespondents*
	tabulate gradid_miss
	*Generate Graduation_Identity 
	egen float Graduate_Identity = rowmean(z_engfreqdisc z_engfreqcar z_engfreqevnt z_engfreqrsch z_q0_a z_q0_b z_q0_c z_q1_a z_q1_b) if gradid_miss<5
	tabulate Graduate_Identity



***********# TROUBLESHOOT #***********
**TS Note 1: all ethnic dummy variables except for ethnic_1 ethnic_2 removed by Stata, Why? *** 
	codebook ethnic_4 ethnic_2
		***TS Note 1: Solved. Omitted due to perfect collinearity. Regression can estimate the following responses given ethnic_1 and either ethnic_2 or ethnic_3
	
**TS Note 2: Humanities major_college_8 omitted why? 
tabulate joboffrd major_college_8
describe major_college_8
codebook major_college_8
		***TS Note: Solved. two "major_college_8"'s in regression......***

*TS Note 2: GradExpec_3 omitted WHY?
tabulate GradExpec_3
		***TS Note 2 omitted due to to perfect collinearity. changed swapped GradExpec_1 for GradExpec_3 due to more observations in 2 and 3 than 1.
		*TS Note 3 Solved: Majsatqual omitted.

							***# THE MODELS #***
							
*1st Model*
*reg joboffrd Institution Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 major_college_4 major_college_5 major_college_6 major_college_7 major_college_8 major_college_9 major_college_10 FemaleBin GenderxSkill GradExpec_2 GradExpec_3 AgexSkill lndebtamnt
*2nd Model*
*reg joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill
*3rd Model*
*reg joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill

**********# TESTS #**********
*Model 1 Test*
reg joboffrd Institution Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 major_college_4 major_college_5 major_college_6 major_college_7 major_college_8 major_college_9 major_college_10 FemaleBin GenderxSkill GradExpec_2 GradExpec_3 AgexSkill lndebtamnt Minority

*Model 2 test*
reg joboffrd Graduate_Identity Skill_Development majsatqual Minority AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill
drop resid
drop res
drop res2
drop lnres
drop yhat


predict resid
predict yhat
gen res2=res^2
gen lnres=ln(res)
graph twoway scatter res yhat || lfit res yhat
graph twoway scatter res2 yhat || lfit res2 yhat
graph twoway scatter lnres yhat || lfit lnres yhat
graph twoway scatter res2 Graduate_Identity || lfit res2 Graduate_Identity
graph twoway scatter res Graduate_Identity || lfit res Graduate_Identity
summarize resid
estat imtest, white
	*Model 1 estat imtest, white RESULTS: chi2(189)=195.03 & Prob>chi2=0.3666, reject null of evidence of heteroskedasticity. (no evidence of hetero, search futher)
	*Model 2 estat imtest, white RESULTS: chi2(193)=210.33 & Prob>chi2=0.1866, reject null of evidence of heteroskedasticity. (no evidence of hetero, search futher)
estat hettest
	*estat hettest RESULTS: chi2(1)=23.88 & prob>chi2=0, reject null completely, significant evidence of nonconstant variance.
hettest, rhs fstat
imtest
	** "hettest, rhs fstat" Results: F(21,295) = 1.86 & prob>F=0.0134, reject null of "no heteroskedasticity" (it is hetero) **

drop yhat
drop res
drop res2
drop lnres

	*ENDOGENEITY TESTS*
reg joboffrd Graduate_Identity Skill_Development majsatqual Minority AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill, noconstant
estat hettest
estat imtest, white
*reg joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill debtamnt GradExpec_2 GradExpec_3 AgexSkill, noconstant robust



estat vce
predict yhat

predict res, resid
gen res2=res^2
gen lnres=ln(res)

drop yhat 
drop res
drop res2
drop lnres

graph twoway scatter res yhat || lfit res yhat
graph twoway scatter res2 yhat || lfit res2 yhat
graph twoway scatter lnres yhat || lfit lnres yhat

graph twoway scatter res Graduate_Identity || lfit res Graduate_Identity
graph twoway scatter res2 Graduate_Identity || lfit res2 Graduate_Identity
graph twoway scatter lnres Graduate_Identity || lfit lnres Graduate_Identity

	**OLS REGRESSION 1.1**	
*reg joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 major_college_4 major_college_5 major_college_6 major_college_7 major_college_8 major_college_9 major_college_10 FemaleBin GenderxSkill debtamnt GradExpec_2 GradExpec_3 AgexSkill AGExGradExpec_3, noconstant robust

		*** LOGIT 1 ***
drop yhat
drop res
drop res2
drop lnres

mfx

logit joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA ethnic_1 ethnic_4 major_college_4 major_college_5 major_college_6 major_college_7 major_college_8 major_college_9 major_college_10 FemaleBin GenderxSkill debtamnt GradExpec_2 GradExpec_3 AgexSkill AGExGradExpec_3, noconstant robust

predict yhat
predict res, resid
gen res2=res^2
gen lnres=ln(res)

graph twoway scatter res yhat || lfit res yhat
graph twoway scatter res2 yhat || lfit res2 yhat
graph twoway scatter lnres yhat || lfit lnres yhat

graph twoway scatter res Graduate_Identity || lfit res Graduate_Identity
graph twoway scatter res2 Graduate_Identity || lfit res2 Graduate_Identity
graph twoway scatter lnres Graduate_Identity || lfit lnres Graduate_Identity

	** OLS REGRESSION 2 **
drop yhat
drop res
drop res2
drop lnres

reg joboffrd Graduate_Identity Skill_Development majsatqual Minority AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill AGExGradExpec_3, noconstant robust
predict yhat
predict res
gen res2 = res^2
gen lnres=ln(res)


*xtreg joboffrd Graduate_Identity Skill_Development majsatqual AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill AGExGradExpec_3, fe

	*** LOGIT 2 ***
tabulate ethnic_1 Minority

mfx

logit joboffrd Graduate_Identity Skill_Development majsatqual Minority AGE UG_WWU_GPA Dept_1 Dept_2 Dept_3 Dept_4 Dept_5 Dept_6 Dept_7 Dept_8 Dept_9 Dept_10 Dept_11 Dept_12 Dept_13 Dept_14 Dept_15 Dept_16 Dept_17 Dept_18 Dept_19 Dept_20 Dept_21 Dept_22 Dept_23 Dept_24 Dept_25 Dept_26 Dept_27 Dept_28 Dept_29 Dept_30 Dept_31 Dept_32 Dept_33 Dept_34 Dept_35 Dept_36 Dept_37 Dept_38 Dept_39 Dept_40 Dept_41 Dept_42 Dept_43 Dept_44 Dept_45 Dept_46 Dept_47 Dept_48 FemaleBin GenderxSkill lndebtamnt GradExpec_2 GradExpec_3 AgexSkill, noconstant robust 

	*NOTE: Dept_1,4,7,15,17,25,29,31,33,36,38,44,,46,48 removed. 0 numbers. dept 2,6,40 omitted cause of perfect collinearity
predict yhat
predict res, resid
gen res2=res^2
gen lnres=ln(res)

graph twoway scatter res yhat || lfit res yhat
graph twoway scatter res2 yhat || lfit res2 yhat
graph twoway scatter lnres yhat || lfit lnres yhat

graph twoway scatter res Graduate_Identity || lfit res Graduate_Identity
graph twoway scatter res2 Graduate_Identity || lfit res2 Graduate_Identity
graph twoway scatter lnres Graduate_Identity || lfit lnres Graduate_Identity

