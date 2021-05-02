#Clustering

#Step 2 - Cereal.df <- read.csv('Cereals.csv')

#Delete missing data
#is.na returns True for missing values and False for not missing values
#rowSums in this case returns either True if there are missing values in the row or False if there are no missing values
record.missing <- rowSums(is.na(Cereal.df))
Cereal.df.notmissing <- Cereal.df[!record.missing,] #! = not, this line keeps the cereal.df dataset with records where there are no missing values

#Step 4 - Drop variables
Cereal.df.notmissing <- Cereal.df.notmissing[, -c(1,2,3,13,14,15,16)] #this drops the irrelevant variables

#Step 5 - Normalize data
Cereal.df.notmissing.norm <- sapply(Cereal.df.notmissing, scale) #we normalized the dataset because variables are measured at different scales and if we don't normalize then large scale variables will dominate as a distance measure

#Step 6 - Apply hierarchical clustering to the data using Euclidean distance and single linkage and plot the tree. 
dist.norm <- dist(Cereal.df.notmissing.norm, method = 'euclidean')
hcl <- hclust(dist.norm, method = 'single')
plot(hcl, hang = -1, ann = TRUE)

#Step 7 - Apply hierarchical clustering to the data using Euclidean distance and complete linkage. and plot the tree. 
hc2 <- hclust(dist.norm, method = 'complete')
plot(hc2, hang = -1, ann = TRUE )

#Step 8 - If we cut at distance 7, how many clusters do we get? 4

#Step 9 - Get the centroids of each cluster. Which cluster has the lowest calories? Which cluster has the lowest rating? Which cluster would you deem the healthiest in terms of fat, sugar, and sodium levels?
Cereal.df.cut <- Cereal.df[!record.missing,]
memb <- cutree(hc2, k=4) #H=7
centers <- aggregate(.~memb, data = Cereal.df.cut[, -c(1,2,3)], FUN = mean)
centers
#Which cluster has the lowest calories? 1
#Which cluster has the lowest rating? 2
#Which cluster would you deem the healthiest in terms of fat, sugar, and sodium levels? 3