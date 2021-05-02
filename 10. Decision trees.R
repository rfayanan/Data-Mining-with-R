#Decision trees

#Step 2 - 
Toyota.df <- read.csv("ToyotaCorolla.csv")

#Step 4 
install.packages("rpart") 
install.packages("rpart.plot")

#Step 5 - 
selected.var <- c(3,4,7,8,9,10,12,13,14,17,18)
carcat.df <- Toyota.df[,selected.var]

#Step 6 - Categorize Price variable into a categorical variable with cutoff of 10000
carcat.df$PriceCat <- ifelse(carcat.df$Price>10000,'high','low') #this is to turn a numerical variable into a categorical value; price has been categorized into high and low

#Step 7 - Drop variable "Price". 
carcat.df <- carcat.df[,-1] 

#Step 8 - Build a decision tree 
car.tree <- rpart::rpart(PriceCat ~ ., data = carcat.df, method = 'class')

#Step 9 - Plot the tree
rpart.plot::prp(car.tree,type = 1, extra = 1, split.font = 1, varlen = -10)

#Step 10 - How many leaves? 4 
#Step 11 - What is the classification of the right most leaf? What is the IF-THEN rule to describe this leaf?
#Classification of the right-most leaf = low; if the car is not less than 57 years old, price is low

#Step12 - Misclassification rate = (45+1+20+92)/(487+45+12+1+20+38+92+741) = 0.11

#Build a more complex tree with a complexity parameter
carC.tree <- rpart::rpart(PriceCat ~ ., data = carcat.df, cp = 0.005, method = 'class') #cp = complexity parameter, the lower the cp, the less comples the tree which prevents overfitting
rpart.plot::prp(carC.tree, type = 1, extra = 1, split.font = 1, varlen = -10)

#Step 14 - How many leaves does this tree have? What will be a potential problem of this tree? How can we address it?
#12 leaves, potential problem will be overfitting, we can address it by pruning