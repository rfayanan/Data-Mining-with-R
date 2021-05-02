#Linear regression

#Step 3
BostonHousing.df <- read.csv("BostonHousing.csv")
#Step 4 -	What is the data type of CHAS? Make sure it is a factor variable. 
class(BostonHousing.df$CHAS)
BostonHousing.df <- as.factor(BostonHousing.df$CHAS)
#Step 5 - In our data exploration, we found that CRIM (crime rate) is skewed. Create a new variable lgCRIM by taking log of CRIM. 
BostonHousing.df$lgCRIM <- log(BostonHousing.df$CRIM)
#Step 6 - Fit a multiple linear regression model to the median house price (MEDV) as a function of all the variables except the original CRIM variable, the coded CAT..MEDV and RAD
BostonHousing.lm <- lm(MEDV~.-CRIM-CAT..MEDV-RAD, data = BostonHousing.df)
#Step 7 -	What is the coefficient of NOX? Standard error? t-value? p-value? Is it significant? How would you interpret the impact of that variable on median housing price?
summary(BostonHousing.lm)
#Coefficient of NOX: -19.228533
#Standard error: 4.056245
#t-value: -4.740
#p-value:2.79e-06 
#It is significant.
#The higher the level of NOX, the lower the median housing price would be. 
#A one unit increase in the level of NOX would decrease median housing price by 19.228533 

#Step 8 - What is the coefficient of CHAS? Standard error? t-value? p-value? Is it significant? How would you interpret the impact of bounding Charles River on median housing price? 
#Coefficient of CHAS:3.211274 
#Standard error:0.880843
#t-value:3.646
#p-value:0.000295
#It is significant
# Houses that bound the Charles River have high median prices.A one unit increase would mean an increase of 3.211274 in median housing price.

#Step 9 - Using the estimated regression model to make predictions and get the accuracy measures. What is RMSE? 
medv.pred <- predict(BostonHousing.lm, BostonHousing.df)
install.packages('forecast')
library(forecast)
accuracy(BostonHousing.lm)
#RMSE = 4.824668

#Step 10 - 10.	Perform a backward selection of variables on the model in Step 6. Which variables are excluded from the model? 
BostonHousing.df.step <- step(BostonHousing.lm, direction = "backward")
summary(BostonHousing.df.step)
