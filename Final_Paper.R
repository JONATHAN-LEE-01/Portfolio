library('car')
library('olsrr')
# Housing Data #
df <- read.csv("df.csv", TRUE)
df
# Renovation dummy variable #
df$renovated = ifelse(df$yr_renovated==0,0,1)
# Square foot living adjustment #
df$sqft_living2 = df$sqft_living * df$sqft_living
#df$sqft_living3 = df$sqft_living * df$sqft_living * df$sqft_living
# Model in test #
fit = lm(price~date+bedrooms+bathrooms+sqft_living+sqft_lot+floors+waterfront
         +condition+grade+sqft_above+sqft_basement+yr_built, data = df)
# Updated model (took out date and floors) #
fit2 = lm(price~bedrooms+bathrooms+sqft_lot+sqft_living
          +waterfront+condition+grade+yr_built+sqft_living2+renovated, data = df)
# Anova analysis #
anova(fit)
anova(fit2)
# Correlation matrix of fit 2)
mat = matrix(c(df$price,df$bedrooms,df$bathrooms,
               df$sqft_living,df$sqft_living2,df$sqft_lot,
               df$floors,df$waterfront,df$condition,
               df$grade,df$yr_built), ncol = 11)
cor(mat)
vif(fit2)
# coefficient interpretation #
fit2$coefficients
sum = summary(fit2)
sum
sum$fstatistic
# normality/constant variance tests #
ei = fit2$residuals
qqnorm(ei)
qqline(ei)
plot(fit2$fitted.values, ei, xlab = "Fitted Values", ylab = "Residuals")
hii = hatvalues(fit2)
bm = 2*(15+1)/21517
plot(hii, ylim = c(0,0.05))
abline(h=bm, lty=2)
5
ols_step_best_subset(fit2)
new = data.frame(bedrooms=c(4), bathrooms=c(2.5), sqft_living=c(2600),
                 waterfront=c(0), condition=c(4), grade=c(8), yr_built=(2004),
                 sqft_living2=c(6760000), renovated=c(0), sqft_lot=c(4250))
predict(fit2, new)
predict(fit2, new, interval = "predict")