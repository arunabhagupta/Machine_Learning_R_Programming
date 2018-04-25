#Import a dataset
dataset = read.csv("Data.csv")

#Taking care of Missing DataAge
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x,na.rm=TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                        dataset$Salary)
dataset

#Encoding categorical data to factor
dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))

# Splitting the data in Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(123) #Similar to random_state in python to generate same results
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == "TRUE")
test_set = subset(dataset, split == "FALSE")

# Feature scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
