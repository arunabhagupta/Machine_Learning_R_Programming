# Simple Linear Regression
# Import a dataset
dataset = read.csv("Salary_Data.csv")
#dataset = dataset[,2:3] #Subset of our main dataset

# Splitting the data in Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123) #Similar to random_state in python to generate same results
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == "TRUE")
test_set = subset(dataset, split == "FALSE")

# Feature scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])
 
# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor,newdata = test_set)
y_pred

# Visualising the Training set results
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            colour = 'blue') + 
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualising the Test set results
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            colour = 'blue') + 
  ggtitle('Salary vs Experience (Test Set: 2)') +
  xlab('Years of Experience') +
  ylab('Salary')
