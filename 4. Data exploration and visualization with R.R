#Data exploration and visualization with R

#Step 1: Open R script
#Step 2: Change the working directory
#Step 3: Rerun
Toyota.df <- read.csv("ToyotaCorolla.csv")

#Step 4 answer: We can predict car prices based on the car features.

#Step 5:
unique(Toyota.df$Color)
#Color has 7 categories: Blue, Silver, Black, White, Grey, Red, Green, Yellow, Violet, Beige.

#Step 6: Frequency count and barchart
barplot(
  table (Toyota.df$Color),
  ylab='Frequency',
  main='Barplot of color distribution')

#Step 7: Statistics and distribution plots
median(Toyota.df$Price)
mean(Toyota.df$Price)
max(Toyota.df$Price)
min(Toyota.df$Price)
quantile(Toyota.df$Price)
var(Toyota.df$Price)
sd(Toyota.df$Price)
hist(Toyota.df$Price)
boxplot(Toyota.df$Price)

#Step 8: skewness
install.packages("e1071")
library(e1071)
skewness(Toyota.df$Price)
#Answer: Yes it is positively skewed. We can do log transformation to correct it.

#Step 9: Manufacture year and mileage for the first 3 records:
# Car ID 193 - Price: $4350 - Year: 2001 - Mileage: 158320 KM
# Car ID 1053 - Price: $4400 - Year: 1998 - Mileage: 203254 KM
# Car ID 396 - Price: $4450 - Year: 2000 - Mileage: 129155 KM
#Answer: They are not outliers by error. The cars with high prices are relatively new with very low mileage. The prices are reasonable.

# Step 10: Correlation, covariance and scatterplot 
cor(Toyota.df$Price, Toyota.df$Age_08_04)
cov(Toyota.df$Price, Toyota.df$Age_08_04)
plot(Toyota.df$Price ~ Toyota.df$Age_08_04)
#Answer: Negative correlation and covariance mean that Price and Age_08_04 are inversely proportional. 
#The plot also indicates that as age increases, price decreases.

#Step 11" Price vs mfr_guarantee
boxplot(Toyota.df$Price ~ Toyota.df$Mfr_Guarantee)
#Answer: The boxplot shows that the price of vehicles are higher for cars with guarantee.

#Step 12: installggplot2
install.packages("ggplot2")

#Step 13:
library(ggplot2)
ggplot(Toyota.df) +
  geom_point(aes(x = Age_08_04, y = Price, color = Fuel_Type))
#Most cars use petrol fuel. The most expensive cars use diesel.

#Step 14:
ggplot(Toyota.df) +
  geom_point(aes(x = Age_08_04, y = Price, color = Fuel_Type)) +
  facet_wrap(~Fuel_Type,nrow = 3)
#The relationship for all 3 types remains the same. 

#Step 15:
ggplot(Toyota.df)+
  geom_point(aes(x = Age_08_04, y = Price, color = Fuel_Type, size = HP))+
  facet_wrap(~Fuel_Type,nrow = 3)
#All CNG cars have the same HP.
