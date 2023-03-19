*Jonathan Lee*
*ECON 475*
*HOMEWORK 5*
*3/5/2023*

cd "C:\Users\jonde\OneDrive\Desktop\PC SCHOOL\475 hw"
use "WA Building Data"

summarize

*1a) Perform OLS regression
reg math_pass perwhite perfreelunch avgexp studperteacher

*1b) Perform Fixed Effect Regression
iis bldg
xtreg math_pass perwhite perfreelunch avgexp studperteacher, fe

*1f) Is FE appropriate or should we use RE?
xtreg math_pass perwhite perfreelunch avgexp studperteacher, re
hausmanfe re
estimates dir