#                     Simple Linear Regression


# (1) Import cityraw into the R Workspace; list the variable names

cityraw <- read.csv('cityraw.csv');  names(cityraw)
mean(cityraw$attitude)#mean
t.test(cityraw$attitude)#95% confident estimate MORE PRECISE


# (2) Create a scatterplot to confirm (or disconfirm) any linear
# relationship between the dependent and independent variables

plot(cityraw$duration, cityraw$attitude, pch = 19, col = 'red', 
     xlim = c(0, 18), ylim = c(0, 11), xlab = 'Years of Residence',
     ylab = 'Attitude on a 1 to 11 Rating Scale', main = 'Scatterplot
     of Attitude against Years of Residence')




# (3) Regress the dependent variable ('attitude') on the independent 
# variable ('duration'); display the estimated regression equation. 
# Name the model object 'model1'

model1 <- lm(attitude ~ duration, data = cityraw); model1




# (4) Include the regression line in the scatterplot

abline(model1, col = 'blue')




# (5) Insert lines representing the mean of the dependent and independent
# variables, if desired

# abline(h = mean(cityraw$attitude), col = 'purple')

# abline(v = mean(cityraw$duration), col = 'green')

 


# (6) Report the diagnostic statistics associated with model1; report
# findings in normal notation (not scientific notation) 

options(scipen = 999)

summary(model1)




# (7) Find the 95% confidence interval estimate 
#  of the coefficient on 'duration'

confint(model1, level = 0.95)
