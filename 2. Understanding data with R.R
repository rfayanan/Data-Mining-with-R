#Understand data with R

#To import Toyota dataset
Toyota.df <- read.csv("ToyotaCorolla.csv")

#Find the dimension of the data frame
dim(Toyota.df)
#There are 1436 observations and 39 variables

#To show variable names
names(Toyota.df)

#Slicing data frame
Toyota.df[,10] #first 10 rows
Toyota.df[,5] #whole first 5 variables
Toyota.df[5,20:29] #the fifth row of variable 20-29 

#Summary statistic
summary(Toyota.df)

#Find the data type of each variable and print them out
for (i in seq(2,39)){
  nm = colnames(Toyota.df)[i]
  cls = class(Toyota.df[ , i])
  print(c(nm, cls))
}

