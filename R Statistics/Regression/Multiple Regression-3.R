#                             Multiple Regression

# (1) Import cityraw into the R Workspace; list the first 2 observations and
# variable names

cityraw <- read.csv('cityraw.csv'); head(cityraw, 2)




# (2) Create a scatterplot to confirm (or disconfirm) any linear
# relationship between the dependent and independent variables

plot(cityraw$weather, cityraw$attitude, pch = 19, col = 'red', 
     xlim = c(0, 11), ylim = c(0, 11), xlab = 'Importance Placed on 
     Having Good Weather', ylab = 'Attitude on 11 Point Rating Scale',
     main = 'Scatterplot of Attitude against Importance Placed on 
     Having Good Weather')




# (3) Regress the dependent variable ('attitude') on the 2 independent 
# variables ('duration' and 'weather'). Name the model object 'model2.' 
# Display the estimated regression equation.

model2 <- lm(attitude ~ duration + weather, data = cityraw); model2




# (4) Report the diagnostic statistics associated with model2; report
# findings in normal notation (not scientific notation) 

options(scipen = 999)

summary(model2)




# (5) Find the 95% confidence interval of the regression coefficients and
# the intercept term

confint(model2, level = 0.95)




# (6) Find the values of the predicted dependent variable ('attitude') 
# for model1; store the values in the new object named 'attitude_predicted.'
# Display those values

attitude_predicted <- predict(model2); attitude_predicted




# (7) Incorporate the new column of data into the cityraw data; name the
# new (larger) data object 'newcityraw'

newcityraw <- cbind(cityraw, attitude_predicted); newcityraw




# (8) Find correlation coefficient of the actual and predicted dependent
# variables; that is, the correlation of 'attitude' and 'attitude_predicted'

cor(newcityraw$attitude, newcityraw$attitude_predicted)

