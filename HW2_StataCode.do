*Open Dataset*
cd "C:\Users\leej207\Desktop\475 HW\HW2"
use "Whatcom County Homesales.dta"

*2a) generate regression*
gen lnprice = ln(price)
gen sqft2 = sqft^2
reg lnprice sqft sqft2 bedrooms age

*2c) Residuals from regression to create a plot of residuals and an independent variable to search for heteroskedasticity*
predict res, resid
scatter res sqft

 *2d) Park's test on Age*
 gen res2 =  res^2
 reg res2 age, noconstant

 *2e) White Test on part a*
drop res2
gen sqft22 = sqft2^2
gen sqftsqft2 =  sqft*sqft2
gen sqft2bedrooms = sqft2*bedrooms
gen bedroomsage = bedrooms*age
gen res2 = res^2
gen sqft22 = sqft2^2
gen bedrooms2 = bedrooms^2
gen sqft22bedrooms = sqft22*bedrooms
gen sqftage = sqft*age
gen bedrooms2 = bedrooms^2
gen age2 = age^2
gen sqftbedrooms = sqft*bedrooms
reg res2 sqft sqft2 bedrooms age sqft2 sqftsqft2 sqft2bedrooms sqftage sqft22 bedrooms2 age2 sqft22bedrooms bedroomsage sqft22 bedrooms2 age2 sqftbedrooms

*2f) WLS technique
drop w
gen w = 1/(age^0.5)
gen wlnprice = w*lnprice
gen wsqft = w*sqft
gen wsqft2 = w*sqft2
gen wbedrooms = w*bedrooms
gen wage = w*age
reg wlnprice w wsqft wsqft2 wbedrooms wage, noconstant

*2h) FGLS
drop res2
drop res
reg lnprice sqft sqft2 bedrooms age
predict res, resid
gen res2 = res^2
gen lnres2 = ln(res2)
reg lnres2 sqft sqft2 bedrooms age
predict res2ageres, xb
gen e_res2ageres = exp(res2ageres)
gen w= 1/(e_res2ageres^0.5)
gen wlnprice = w*lnprice
gen wsqft = w*sqft
gen wsqft2 = w*sqft2
gen wbedrooms = w*bedrooms
gen wage = w*age
reg wlnprice w wsqft wsqft2 wbedrooms wage, noconstant

*white correlation?
 sum age
 gen age_res = (age - 35.4059)^2
 total age_res
 gen res2ageres = res2*age_res
 total res2ageres



 
