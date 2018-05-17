install.packages("car")
library(car)

scatter.smooth(x = cars$speed, y = cars$dist, main = "Dist ~ Speed")

install.packages("e1071")
library(e1071)

#divide graph into two columns
par(mfrow = c(1, 1))

#denisty plot for speed - #sub is the calculating the Skewness and rounding to 2 decimal places
plot(density(cars$speed), main = "Density Plot: Speed", ylab = "frequency", sub = paste("skewness:",
round(e1071::skewness(cars$speed), 2)))

polygon(density(cars$speed), col = 'red')

#density plot for distance
plot(density(cars$dist), main = "density plot: Distance", ylab = "frequency", sub = paste("skewness:",
round(e1071::skewness(cars$dist), 2)))

polygon(density(cars$dist), col = 'red')

#calculate the correlation between speed and distance
cor(cars$speed, cars$dist)

#build the linear regression mondel on the full data
linearMod <- lm(dist ~ speed, data = cars)
print(linearMod)

#model summary
summary(linearMod)

AIC(linearMod)

BIC(linearMod)

#create a train and test set from the dataset 
seed(1):
no_of_records <- sample(1:nrow(cars), 0.8 * nrow(cars))

#model training data
training_data <- cars[no_of_records, ]

#test data
test_data <- cars[-no_of_records, ]

#build the model on training data
lr_model <- lm(dist ~ speed, data = training_data)

#predict distance from the testing data
dist_prid <- predict(lr_model, test_data)

#review the model significance
summary(lr_model)

#review the predicted versus actual
actuals_pred <- data.frame(cbind(actuals = test_data$dist, predicted = dist_prid))
head(actuals_pred)

correlations_accuracy <- cor(actuals_pred)
correlations_accuracy

#min/max accuracy
min_max_accuracy <- mean(apply(actuals_pred, 1, min) / apply(actuals_pred, 1, max))
min_max_accuracy

#MAPE mean absolute precentage error
mape <- mean(abs((actuals_pred$predicted - actuals_pred$actuals)) / actuals_pred$actuals)
mape

#k-fold cross validaiton
install.packages("DAAG")
library(DAAG)

dev.off

cvResults <- suppressWarnings(CVlm(data = cars, form.lm = dist ~ speed, m = 5, dots = FALSE, seed = 29,
 legend.pos = 'topleft', printit = FALSE, main = "Small symbol are predicted values while bigger ones are actuals"));

summary(cvResults)

scatterplotMatrix(cars)