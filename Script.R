#Built in data set that captures observations from a chemical power plant
View(stackloss)

#Create a train and test set
set.seed(1)
row.number <- sample(1:nrow(stackloss), 0.8*nrow(stackloss))
train <- stackloss[row.number,]
test <- stackloss[-row.number,]

#Create the linear regression model 
stackloss.lm <- lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc., data=train)

#Predict the value of point (72, 20, 85) with the created model
testPoint <- data.frame(Air.Flow=72, Water.Temp=20, Acid.Conc.=85)
predict(stackloss.lm, testPoint)

#Statistical summary of linear regression model
summary(stackloss.lm)

#Create 95% Confidence interval for given testPoint
predict(stackloss.lm, testPoint, interval="confidence")

#Create 95% predictor interval for given testPoint
predict(stackloss.lm, testPoint, interval="predict")