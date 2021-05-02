#Logistic regression

#Step 2 
banks.df <- read.csv('banks.csv')

#Step 3 - Run the logistic regression
lgreg <- glm(Financial.Condition ~ TotExp.Assets + TotLns.Lses.Assets, data = banks.df, family = 'binomial')

#Step 4 - 4.	Display the results use summary() function.
summary(lgreg)

#Step 5 - Using the regression outcome, write the estimated equation that associates the financial condition of a bank with its two predictors in three formats:
#The logit as a function of the predictors
#The odds as a function of the predictors
#The probability as a function of the predictors

#Logit = - 14.721 + (89.834*TotExp.Assets) +(8.371*TotLns.Lses.Assets)
#odds = e^(- 14.721 + (89.834*TotExp.Assets) +(8.371*TotLns.Lses.Assets))
#probability = (e^(-14.721 + (89.834*TotExp.Assets) + (8.371*TotLns.Lses.Assets)))/1 + (e^(-14.721 + (89.834*TotExp.Assets) + (8.371*TotLns.Lses.Assets)))

#Step 6 - Get the predicted probabilities for the data set
lgreg.pred <- predict(lgreg, data = banks.df, type = 'response')

#Step 7 - From your logistic regression model, estimate the following four quantities for this banklgreg.pred <- predict(lgreg, data = banks.df, type = 'response')
#Logit = 0.18334
#Odds = 1.20122
#Prob = 2.40244
#Logit = ln(p/(1-p)) = 0

#Step 8 - The cutoff value of 0.5 is the probability of being financially weak. Compute the corresponding odds and logit of being financially weak.
#Odds = p/(1-p) = 1
#Logit = ln(p/(1-p)) = 0

#Step 9 - Interpret the estimated coefficient for the total loans & leases to total assets ratio (TotLns&Lses/Assets) in terms of the odds of being financially weak
#Odds will increase by e^(0.1*8.371) = 2.30966






